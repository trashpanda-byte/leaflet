# TASK-0003 — Seed lifecycle and reversible actions

| Field | Value |
|---|---|
| Status | queued |
| Owner | Claude / implementation engineer |
| Reviewer | Codex |
| Branch | `feat/seed-lifecycle-actions` (recommended) |
| Risk | high |
| Depends on | TASK-0002 |

## Why

Leaflet needs clear lifecycle behavior before organization and higher-level intelligence are layered onto Seeds.

## Expected experience

A user's Seed can remain active, be Held, become Resolved, be Snipped with Undo behavior, and receive a Grow request without conflating these concepts. Explicit ordinary reversible commands can create typed internal action proposals/results without forcing redundant confirmation.

## Acceptance criteria

- [ ] Lifecycle behavior matches `docs/SEED_DOMAIN.md`.
- [ ] Active, Held, Resolved, and Snipped meanings are represented without using Grow as a mutually exclusive lifecycle status.
- [ ] Invalid state transitions are rejected deterministically.
- [ ] Snip is reversible during the supported undo path and does not silently cascade-delete derived work.
- [ ] User-facing/system language does not claim permanent erasure before a full retention policy is approved.
- [ ] Grow is represented as an intent/action that can succeed deterministically, ask a supported deterministic question, or remain unresolved.
- [ ] Explicit ordinary reversible commands can be represented as typed actions.
- [ ] Ambiguous commitment language does not create Tasks/Events automatically.
- [ ] Action execution is idempotent and validates ownership.
- [ ] Tests cover failure and retry behavior.
- [ ] No generative AI call is introduced.

## Out of scope

- external calendar APIs;
- messaging/purchases/irreversible external actions;
- automatic rescheduling;
- proactivity learning;
- generative follow-up questions.

## Refactor / architecture checkpoint

Keep lifecycle state, interpretation/resolution state, and action execution conceptually separate. Review any enum/state-machine design for accidental coupling before handoff.

## AI necessity review

No model behavior. Unsupported Grow cases remain unresolved.

## Security and data review

State changes require authenticated ownership. Consequential external side effects are not permitted in this task.

## Verification plan

Unit-test state transitions and typed action validation; integration-test ownership and retries; rerun full relevant checks after cleanup.

## Implementation handoff

Complete using `docs/ai/HANDOFF.md`.

## Independent review

Complete using `docs/ai/REVIEW_TEMPLATE.md`.
