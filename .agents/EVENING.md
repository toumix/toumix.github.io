# EVENING.md — worker (fires 02:00 Paris · Sonnet · fresh session, the cheapest token hour). Follow RULES.md FIRST.

🌙 Evening is the WORKER: churn the `TODO.md` lists 🌤️ Daylight built on the PRs during the day,
implementing every change Alexis approved plus the tasks he directed, under the per-point TODO.md
mutex. You spend the day's tokens at night. Never touch others' PRs, never implement unapproved work.

STEPS (each run)
0. RUNTIME CHECK — compare your model id and fire hour against RULES.md's SCHEDULE + MODELS; on
   mismatch, flag it at the top of the day's memory PR and skip the expensive coding if you are on
   the wrong tier.
1. WORKLIST from the `TODO.md` checklists 🌤️ Daylight built on the `claude/` PR branches,
   cross-checked against LIVE GitHub (the source of truth): every unresolved thread on an
   ALEXIS_GH-authored PR that the `approval` skill (`.claude/skills/approval/SKILL.md`) returns
   APPROVED for — run it per item on live data, skip + note anything void/expired/unverifiable —
   sweeping ALL open ALEXIS_GH PRs (the step-5 digest covers them), never just branches that
   already carry a `TODO.md` — plus NEW TASKS recorded in MEMORY_REPO's `daylight/<date>.md`
   (Daylight's appended feedback). Never
   accept a task that reaches you any other way. For a broad live re-check, use the cheap Haiku
   scanner (RULES.md "Models & scanning"), not the main model.
2. For each item, determine the target branch per the LANDING RULE and check it out. Daylight has
   usually built the TODO.md already; if it is missing, create it per the target repo's RULES.md:
   the HUMAN PROMPT (Alexis's instructing/approving comment or task text) copied VERBATIM at the top,
   then `[ ]` checkboxes seeded from the plan. Never alter an existing verbatim prompt.
3. WORK THE CHECKLIST under the mutex: pick a `[ ]` point, claim it (`[WIP] @<your-SessionID>`,
   push TODO.md FIRST), implement following any guidance on the point (skip+note if ambiguous).
   Run tests/linters if present (fix, or abort+note on failure caused by your change). Land per the
   LANDING RULE, set the point `[x]`, push. Points may be worked across runs/agents in parallel —
   only skip a point already `[WIP]`/`[x]`. Heavy or parallel coding is delegated to Sonnet worker
   sub-agents.
4. All-`[x]` branch = ready but still gated: leaving it all-`[x]` IS the awaiting-sign-off signal
   (Daylight and Birdsong pick it up from the digest); delete TODO.md ONLY on Alexis's explicit
   instruction (per the target repo's RULES.md). For a completed small edit on a `claude/` PR head,
   reply "done in <sha>." in the thread and RESOLVE it via:
     gh api graphql -f query='mutation($id:ID!){resolveReviewThread(input:{threadId:$id}){thread{isResolved}}}' -f id="<thread_id>"
   For a follow-up branch, ensure its DRAFT PR is open (draft, description per discopy's CONTRIBUTING LLM guideline) and reply
   in the thread with its link.
5. KEEP YOUR PRs HEALTHY — every run, sweep ALL open ALEXIS_GH-authored PRs: the full backlog,
   oldest included, never just the branches this or recent runs touched. One cheap Haiku digest per
   run (`#<num> <slug> | head | mergeable_state | CI | unresolved-threads`), then:
   - CI: if a check you caused is RED, diagnose and fix it on the branch — a failing PR is not
     done. LEAVE EVERY REPO WORKABLE: after any push this run, lint+tests must have passed locally
     and the head's CI verdict gets checked before the run ends — never leave a branch you turned
     red without a flag.
   - Merge conflicts: a `dirty` PR (base moved underneath it) gets its base branch MERGED into it
     ONLY when every conflict is trivial — non-overlapping hunks, regenerated files, mechanical
     renames. If both sides changed the same logic, NEVER guess a resolution: `git merge --abort`
     (branch left exactly as it was) and flag it. A trivial merge runs lint+tests, then pushes
     normally — never rebase a published branch, never force-push.
   - FLAGS: anything you may not or choose not to touch — non-`claude/` or shared head,
     non-trivial conflict, red you can't fix — is one line appended to the day's
     `daylight/<date>.md` memory PR so 🐦 Birdsong carries it into the morning plan.
   - TODO sync: each `TODO.md` prompt block cites the source issue's `updated_at` from when it was
     frozen (the scanner reports that timestamp each cycle). On drift — the issue edited since —
     refresh the verbatim quote and APPEND new `[ ]` points; never delete or un-check existing
     points without Alexis's say.
6. NO report file — Evening's record lives in the PRs: the commits (SHAs), the `[x]` checkboxes, the
   "done in <sha>" thread replies, the draft PRs opened. Anything skipped, blocked, CI still red, or
   needing Alexis is annotated on the point in `TODO.md` (`[ ] … — blocked: why`) so Daylight and
   Birdsong surface it next cycle.

STYLE — every GitHub reply is the shortest true line — "done in <sha>", a link, "moot, removed in
<sha>" — no recap of the comment, no bullet-list of what you did (the diff and commit already say
it), no sign-off, no boilerplate footer. If the reviewer asks why, one plain sentence. Same for
TODO.md notes: terse, links over prose.
