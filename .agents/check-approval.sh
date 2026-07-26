#!/usr/bin/env bash
# check-approval.sh — mechanical INTEGRITY + EXPIRY check for one approval.
# Spec: AGENTS.md "Approval" section; this script is the binding implementation.
#
# Usage:   check-approval.sh <comment-url> [rocket|comment]
#   <comment-url>  a GitHub comment permalink, either
#                  .../pull/N#issuecomment-<id> or .../pull/N#discussion_r<id>
#   rocket (default)  mode (G): comment approved by a :rocket: from GH_USER
#   comment           mode (C): an unedited instruction comment authored by GH_USER
#                     (this checks authorship/integrity/expiry only — whether the comment
#                     actually asks for a code change is the agent's judgement, per RULES.md)
#
# Prints one line — APPROVED / VOID / EXPIRED with the reason — and exits:
#   0 APPROVED   1 VOID   2 EXPIRED   3 usage or API error
# Only exit 0 authorizes implementation. Requires: gh (authenticated), jq.
set -euo pipefail

GH_USER="${GH_USER:-toumix}"
APPROVE_EMOJI="${APPROVE_EMOJI:-rocket}"
EXPIRY_DAYS="${EXPIRY_DAYS:-7}"

url="${1:?usage: check-approval.sh <comment-url> [rocket|comment]}"
mode="${2:-rocket}"

repo="$(sed -nE 's|^https://github\.com/([^/]+/[^/]+)/.*|\1|p' <<< "$url")"
case "$url" in
    *#issuecomment-*)  api="repos/$repo/issues/comments/${url##*#issuecomment-}" ;;
    *#discussion_r*)   api="repos/$repo/pulls/comments/${url##*#discussion_r}" ;;
    *) echo "ERROR: unrecognized comment URL: $url"; exit 3 ;;
esac
[ -n "$repo" ] || { echo "ERROR: cannot parse repo from URL: $url"; exit 3; }

comment="$(gh api "$api")" || { echo "ERROR: cannot fetch $api"; exit 3; }
created="$(jq -r .created_at <<< "$comment")"
updated="$(jq -r .updated_at <<< "$comment")"
author="$(jq -r .user.login <<< "$comment")"

to_s() { date -u -d "$1" +%s; }
age_days() { echo $(( ($(date -u +%s) - $(to_s "$1")) / 86400 )); }

if [ "$mode" = comment ]; then
    [ "$author" = "$GH_USER" ] \
        || { echo "VOID: comment author is $author, not $GH_USER"; exit 1; }
    [ "$created" = "$updated" ] \
        || { echo "VOID: comment edited after creation (at $updated)"; exit 1; }
    age="$(age_days "$created")"
    [ "$age" -lt "$EXPIRY_DAYS" ] \
        || { echo "EXPIRED: comment is ${age}d old (limit ${EXPIRY_DAYS}d)"; exit 2; }
    echo "APPROVED: instruction comment by $GH_USER, unedited, ${age}d old"
    exit 0
fi

reacted="$(gh api "$api/reactions" --paginate \
    | jq -r --arg u "$GH_USER" --arg e "$APPROVE_EMOJI" \
        '[.[] | select(.content == $e and .user.login == $u)]
         | sort_by(.created_at) | last | .created_at // empty')"
[ -n "$reacted" ] \
    || { echo "VOID: no :$APPROVE_EMOJI: from $GH_USER on this comment"; exit 1; }
if [ "$created" != "$updated" ] && [ "$(to_s "$updated")" -ge "$(to_s "$reacted")" ]; then
    echo "VOID: comment edited at $updated, not before the :$APPROVE_EMOJI: at $reacted"
    exit 1
fi
age="$(age_days "$reacted")"
[ "$age" -lt "$EXPIRY_DAYS" ] \
    || { echo "EXPIRED: :$APPROVE_EMOJI: is ${age}d old (limit ${EXPIRY_DAYS}d)"; exit 2; }
echo "APPROVED: :$APPROVE_EMOJI: from $GH_USER at $reacted, ${age}d old"
exit 0
