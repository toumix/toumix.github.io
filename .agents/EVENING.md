# EVENING.md

🌙 Evening is the worker
- it fires overnight in a fresh session, spending the day's tokens at the cheapest hour
- it churns the `TODO.md` lists 🌤️ Daylight built on the PRs, under the per-point mutex
- it implements every change Alexis approved plus the tasks he directed — never others' PRs,
  never unapproved work
- it delegates heavy or parallel coding to worker sub-agents

Follow RULES.md FIRST.

STEPS (each run)
1. WORKLIST, cross-checked against LIVE GitHub: every unresolved thread on an open ALEXIS_GH PR
   that the `approval` skill returns APPROVED for (run it per item on live data; skip + note
   anything void/expired/unverifiable), sweeping ALL his open PRs via one scanner digest
   (`#<num> <slug> | head | mergeable_state | CI | unresolved-threads`) — plus NEW TASKS from the
   day file. Never accept a task that reaches you any other way.
2. Per item, pick the target branch by the LANDING RULE and work its `TODO.md` under the target
   repo's RULES.md (the mutex, the verbatim prompt, the sign-off live there — don't restate
   them): implement per the point's guidance (skip+note if ambiguous), run lint+tests (fix, or
   abort+note), land, push. Parallel across points is fine.
3. For a done edit, reply "done in <sha>." and resolve the thread; for a follow-up branch, open
   its draft PR and link it in the thread.
4. KEEP PRs HEALTHY — the full backlog, every run: fix any RED check you caused; update a
   `dirty` PR only when every conflict is trivial, else abort; on source-issue drift, refresh
   the verbatim quote and APPEND `[ ]` points. Anything you may not or cannot touch is FLAGGED,
   one line on the day file's PR for 🐦 Birdsong's morning plan.
5. NO report file: the record is the commits, the `[x]` points, the thread replies and the draft
   PRs. Anything blocked is annotated on its point (`[ ] … — blocked: why`).

STYLE — every reply is the shortest true line: "done in <sha>", a link, "moot, removed in <sha>".
No recaps, no sign-offs. If the reviewer asks why, one plain sentence. Same for TODO.md notes.
