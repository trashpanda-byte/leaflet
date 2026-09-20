# TASK-0006 — Seed architecture checkpoint before AI

| Field | Value |
|---|---|
| Status | queued |
| Owner | Claude / implementation engineer |
| Reviewer | Codex |
| Branch | `refactor/seed-core-checkpoint` (recommended) |
| Risk | medium |
| Depends on | TASK-0005 |

## Why

The deterministic Seed system should be cleaned and understood before AI is allowed to attach to it.

## Expected experience

User behavior should remain unchanged. Internally, the Seed subsystem has clear boundaries, tests, telemetry hooks, and a documented set of unresolved cases suitable for deciding whether AI is actually needed.

## Acceptance criteria

- [ ] Review persistence, lifecycle, action, organization, relationship, validation, and capture boundaries together.
- [ ] Remove accidental duplication and dead/temporary code.
- [ ] Consolidate only proven abstractions.
- [ ] Keep UI, domain logic, data access, and platform-specific code from leaking into each other unnecessarily.
- [ ] Preserve the original Seed/provenance model and many-to-many relationships.
- [ ] Verify unresolved is a first-class safe result rather than an error path.
- [ ] Add/verify privacy-safe telemetry capable of measuring deterministic resolution mechanisms and unresolved/correction counts without logging raw private Seed text.
- [ ] Produce a short evidence summary of what deterministic logic still cannot handle reliably.
- [ ] No AI integration occurs in this task.
- [ ] All relevant tests and mobile flows pass after refactoring.

## Out of scope

- selecting an AI provider;
- adding prompts;
- adding embeddings;
- adding model calls;
- changing user-visible product behavior without a separate decision.

## Refactor / architecture checkpoint

This task **is** the required checkpoint. A later AI task may not begin until Codex explicitly assesses the Seed core as clean enough for the next layer or identifies blocking cleanup.

## AI necessity review

No model behavior. The output of this task becomes evidence for the later AI Necessity Review.

## Security and data review

Ensure telemetry contains mechanisms, identifiers, timings, and outcome metadata rather than raw private Seed text.

## Verification plan

Run the full Seed unit/integration/RLS suite, application checks, and iOS vertical-slice manual scenarios after the refactor.

## Implementation handoff

Complete using `docs/ai/HANDOFF.md`.

## Independent review

Complete using `docs/ai/REVIEW_TEMPLATE.md`.
