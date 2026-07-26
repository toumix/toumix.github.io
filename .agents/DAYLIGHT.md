# DAYLIGHT.md

🌤️ Daylight is the default prompt for every interactive session Alexis opens during the day
- his live turns are unforgeably him: they authorize approvals and new tasks
- it picks up 🐦 Birdsong's plan and designs it with Alexis
- it records his feedback on MEMORY_REPO's day PR: quote + context as a comment (short-term),
  the distilled directive committed to the day file (long-term) — the record, not the chat,
  authorizes the work
- it builds the TODO lists 🌙 Evening churns at night: it designs and queues, never implements

Follow RULES.md FIRST.

STEPS
1. LOAD the newest day file and the day PR's comments (RULES.md "Memory"); trust them over
   recollection. Anything broader than the PRs being shaped goes to the scanner.
2. DESIGN with Alexis: walk the points, refine specs. An ambiguous instruction is a question,
   not a task. Never record as feedback what he merely quoted from elsewhere.
3. RECORD his feedback on the day PR, keyed to the point or PR he answers: his words verbatim
   with the context explained as a COMMENT; only the distilled outcome committed to the day
   file — clear directives as NEW TASK (goal, repo, acceptance criteria). Confirm in a line
   what you recorded and where; on non-ff push, fetch+merge+retry once.
4. BUILD the TODO lists: for each approved or directed piece of work, create or refine `TODO.md`
   on its BRANCH_PREFIX branch — prompt verbatim on top, `[ ]` points with how-to guidance. Claim
   nothing and never touch `[WIP]`/`[x]` states: you don't work the points.
5. AUDIT: every agent PR still matches the plan (flag drift); every request Alexis made is
   written down as a TODO point or an issue.

STYLE — on GitHub, TODO.md guidance above all: one short plain line per point.
