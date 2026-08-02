# EverythingHackathon

Automated Luma hackathon autopilot: every Friday 6 pm a local Claude scheduled agent discovers
hackathons and hands-on tech workshops (agent memory, evals, retrieval, RAG, vector search, embeddings, tool calling, MCP, agent harness, loop engineering, context engineering) in SF / Palo Alto / Mountain View /
Cupertino, auto-registers for free events via Isha's logged-in Chrome, then asks her by phone to
keep or cancel each registration. Kept events land on her calendar.

Full audited design (flowchart, guardrails, risks, effort): [docs/plan.md](docs/plan.md).

## Status

- [x] Plan (audited, apply-first order confirmed 2026-08-01)
- [x] Spike 0 — validation tests (2026-08-01): scheduled run drove Chrome ✓, Luma session cookie survives ✓, login = Google-linked ishamishra041996@gmail.com ✓. Open: phone-push receipt confirmation, Chrome-closed cold start, page-hydration settle before reads. Scheduled runs can fire late (observed +23 min) — fine for weekly cadence.
- [x] Session 1 (2026-08-01) — recurring Friday 6pm scheduled task `luma-hackathon-scout` (reads prompts/scout.md), discovery via Chrome + Luma network JSON + web search, drafting from profile.md, always-notify push. Friday 5:55pm Calendar.app reminder added ("keep laptop + Chrome on"). Pending: Isha fills profile.md, first shakedown run.
- [x] Session 2 (2026-08-01) — live auto-registration via Chrome (+ AppleScript fallback), signed ntfy approve/reject buttons, calendar sweep with HMAC-validated decisions, scout.db record. First real run: 9 registered. Sanitized run reports now published to reports/ after every run.
- [ ] Hardening — Fridays of tuning

## Layout (planned)

```
docs/plan.md      audited design doc
profile.md        Isha's application-answer profile (never committed with private data — gitignored if sensitive)
prompts/          scout + executor prompts for the scheduled runs
state/            weekly state.json lives locally, NOT committed
scripts/          setup helpers (pmset wake schedule, scheduled-task creation)
```
