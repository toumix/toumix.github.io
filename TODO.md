# TODO.md

> I'm separating my prompts and my agents memories in two repos: my personal website for prompts (public), my current agents repo for memory (private)

This repo's half of the split: it becomes PROMPTS_REPO. The memory half is the paired branch on
`toumix/agents`.

- [x] Bring `.agents/` up to the live generation of prompts (the ones running out of `toumix/agents`):
      `RULES.md` as the operating base, `BIRDSONG.md` / `DAYLIGHT.md` / `EVENING.md`, `check-approval.sh`
- [x] Drop the superseded `ROUTINE.md` and the older collaboration `RULES.md` (that protocol now
      lives in [discopy's `RULES.md`](https://github.com/discopy/discopy/blob/main/RULES.md))
- [x] Carry the open "merge instead of rebase" prompt change ([toumix/agents#19](https://github.com/toumix/agents/pull/19))
      into the migrated files so the split does not silently revert it
- [x] Add `.claude/` — the `approval` skill and the session-start hook the routines need to run
- [x] Split `CONTROL_REPO` into `PROMPTS_REPO` (public, here) and `MEMORY_REPO` (private, `toumix/agents`)
      across `RULES.md`, the phase files and the skill
- [x] State the trust boundary the split creates: only `main` is trusted in a public repo, and no
      memory or verbatim Alexis ever lands here
- [x] Move `state/` (the 26-07-21 bootstrap memory) out to `toumix/agents`
- [x] Update `AGENTS.md` and the Jekyll `exclude:` list

> ok the rules have just blown up to a human unreadable level and it pollutes my context, let's cut things down
> one thing I want to change: DAYLIGHT should not be a special prompt that I have to keep as a pinned chat, it's the default prompt for every interactive session that I start during the day
> i added some feedback with a description of BIRDSONG

- [x] Apply the BIRDSONG review comment: "VP of Engineering", no model names or times, uncluttered
      titles, a concise bulleted first paragraph per file
- [x] Cut RULES.md roughly in half; the approval mechanics stay in the `approval` skill
- [x] DAYLIGHT is the default prompt for every interactive daytime session, not a pinned chat
