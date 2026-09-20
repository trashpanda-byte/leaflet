# TASK-0005 — Seed capture vertical slice

| Field | Value |
|---|---|
| Status | queued |
| Owner | Claude / implementation engineer |
| Reviewer | Codex |
| Branch | `feat/seed-capture-slice` (recommended) |
| Risk | medium |
| Depends on | TASK-0004 |

## Why

The deterministic Seed foundation must be proven through the actual mobile experience before AI or native widgets are added.

## Expected experience

The user opens Leaflet, captures a Seed quickly, receives a brief result, and can use the relevant Grow / Hold / Snip behavior. Explicit commands may complete directly with Undo. Ambiguous Seeds are preserved without forcing a decision.

## Acceptance criteria

- [ ] Capture is fast and does not require pre-classification.
- [ ] Original text is preserved.
- [ ] Brief acknowledgements follow the restrained voice in `docs/SEED_DOMAIN.md`.
- [ ] Obvious deterministic organization is reflected without exposing unnecessary internals.
- [ ] Unresolved Seeds have a calm understandable state.
- [ ] Exploratory Seeds expose the smallest useful Grow / Hold / Snip controls.
- [ ] Explicit reversible commands may show completed action + Undo rather than redundant Grow/Hold/Snip.
- [ ] Retry/double-tap does not accidentally duplicate the same request.
- [ ] Loading, offline/retry boundary, error, empty, success, keyboard, accessibility, and reduced-motion behavior are considered.
- [ ] No AI/model-provider dependency is introduced.

## Out of scope

- home-screen widget;
- full Tree;
- advanced relationship editor;
- learned-knowledge management UI;
- location awareness;
- external calendar integration;
- generative Grow conversation.

## Refactor / architecture checkpoint

Keep capture UI thin. Domain behavior belongs in shared services/modules that future widget and platform entry points can reuse.

## AI necessity review

No model behavior.

## Verification plan

Test on the configured iOS development build plus automated domain/integration checks. Include accidental retry, ambiguous input, explicit command, Hold, Snip/Undo, and correction scenarios.

## Implementation handoff

Complete using `docs/ai/HANDOFF.md`.

## Independent review

Complete using `docs/ai/REVIEW_TEMPLATE.md`.
