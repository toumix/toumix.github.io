# AGENTS.md

## What

This is [Alexis Toumi's personal website](https://alexis.toumi.xyz), a Jekyll site published
with GitHub Pages. It doubles as the CONTROL_REPO for Alexis's scheduled Claude routines
(Birdsong, Daylight, Evening):

- [Alexis/.agents/](Alexis/.agents/) holds the routine prompts — see
  [HANDOFF.md](Alexis/.agents/HANDOFF.md) for the design and setup checklist
- `state/` holds the routines' shared memory: reports and Alexis's recorded feedback

Both folders are excluded from the website build in [_config.yml](_config.yml).

## Rules

- @Alexis/.agents/RULES.md binds every agent — human-run or autonomous — that writes code in
  Alexis's repos.
- Scheduled routines follow [ROUTINE.md](Alexis/.agents/ROUTINE.md) and then their phase file
  (`EVENING.md` / `BIRDSONG.md` / `DAYLIGHT.md`), exactly.
- Routines push ONLY files under `state/` to this repo's default branch and NEVER edit
  `Alexis/.agents/` — rule changes are Alexis's own, made by hand.
