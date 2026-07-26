# AGENTS.md

## What

This is [Alexis Toumi's personal website](https://alexis.toumi.xyz), a Jekyll site published
with GitHub Pages. It doubles as the PROMPTS_REPO of Alexis's Claude routines
(Birdsong, Daylight, Evening):

- [.agents/](.agents/) holds the routine prompts — `RULES.md` (the operating base) and the
  phase files (`BIRDSONG.md` / `DAYLIGHT.md` / `EVENING.md`) — plus `check-approval.sh`
- [.claude/](.claude/) holds what the routine sessions need to run: the `approval` skill and
  the session-start hook

Both folders are excluded from the website build in [_config.yml](_config.yml).

The routines' MEMORY — the day files where they record plans and Alexis's feedback verbatim —
lives in the private `toumix/agents` repo, never here. The prompts are public because they are
the rules; the memory is private because it is Alexis's work.

## Rules

- @.agents/RULES.md binds every routine; they follow it and then their phase file.
- Routines NEVER push to this repo's default branch and NEVER touch anything outside `.agents/`
  and `.claude/` — the website itself is Alexis's. A prompt change lands as its own pull
  request, and only Alexis merges it: the merge is his consent.
