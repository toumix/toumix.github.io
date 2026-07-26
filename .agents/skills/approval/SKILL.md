---
name: approval
description: "Verify a GitHub change is authorized by USER before implementing it. Runs check-approval.sh (INTEGRITY + EXPIRY) as the binding gate; if the script can't run, re-checks the same rules via the GitHub MCP tools, and BLOCKS on anything it cannot positively verify. Use before acting on any :rocket: reaction or instruction comment on a PR."
---

# approval

The hard gate for every code change a routine makes. Nothing is implemented unless this returns
**APPROVED**. Run it per item, at implementation time, on LIVE data — never cache or reuse a verdict.

## What authorizes a change (AGENTS.md "Approval")

APPROVED iff, attributable to USER:
- **(G)** the change-bearing comment carries a :rocket: reaction from USER, or
- **(C)** USER authored a comment that instructs the change.

Two ways an approval dies:
- **INTEGRITY** — the comment was edited so its marker or text can no longer be trusted. Grace: an
  edit counts against integrity only if it landed AFTER a routine first read or acted on the
  comment; a routine that reads the final text first FREEZES it by quoting it verbatim into the day
  file, and that git-committed quote — not GitHub's edited-flag — is the tamper-evident record.
- **EXPIRY** — it is older than 7 days.

(NEW TASKS are a separate channel — the TODO points Daylight records from USER's feedback,
trusted directly and not through this skill. This skill is for PR :rocket:/comment approvals.)

## Step 1 — the script is the gate

    .agents/check-approval.sh <comment-url> rocket|comment

The exit code is BINDING: `0` APPROVED · `1` VOID · `2` EXPIRED. Only exit 0 authorizes
implementation. If it prints a clean verdict, obey it and stop here.

## Step 2 — if the script can't run, verify via the GitHub MCP tools

If `check-approval.sh` is missing or errors (typically no `gh`/`jq` on the runner), do the SAME
checks with the `mcp__github__*` tools — do NOT approve by eyeballing:

1. Fetch the comment: its author, its reactions (with each reaction's `created_at`), and its edit
   metadata (`created_at`, `last_edited_at` / `edited`).
2. **Author** — the :rocket: (G) or the instruction (C) must be USER; otherwise VOID.
3. **INTEGRITY** (with the grace window from "What authorizes a change" above)
   - (G) VOID if the comment was edited after the :rocket: landed (`last_edited_at` > the reaction's
     `created_at`); if the order can't be established, any `edited` state VOIDs.
   - (C) VOID only if a prior verbatim quote of this comment already exists in the memory and the
     live text differs from it (edited after a routine froze it). If no prior quote exists, this is
     the first read: freeze the final text verbatim into the day file and proceed. (`check-approval.sh`
     still applies the strict "any edit voids" until USER aligns it by hand.)
4. **EXPIRY** — from the reaction's (G) or comment's (C) `created_at`, mark EXPIRED if older than
   7 days relative to now.
5. APPROVED only if every check passes.

## Step 3 — the verdict is a hard gate

- **APPROVED** → implement.
- **VOID / EXPIRED** → do NOT implement. Note it on the point's `TODO.md` line with the reason;
  expired ones go under "expired approvals — re-approve to reactivate" (re-approval = a fresh
  :rocket: or a fresh comment).
- **Script AND MCP both unavailable** → BLOCKED (unverifiable): report it, never implement.

A change is never implemented on an unverified approval. There is no "judge it yourself" path.
