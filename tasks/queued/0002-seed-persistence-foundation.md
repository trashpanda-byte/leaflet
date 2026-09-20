# TASK-0002 — Seed persistence foundation

| Field | Value |
|---|---|
| Status | queued |
| Owner | Claude / implementation engineer |
| Reviewer | Codex |
| Branch | `feat/seed-persistence-foundation` (recommended) |
| Risk | high |
| Depends on | TASK-0001 verified and merged |

## Why

The Seed loop needs a secure, reproducible data foundation before lifecycle, organization, or AI behavior is added.

## Expected experience

There is not yet a polished user-facing feature. From tests and a minimal application/domain API, an authenticated user can create and read their own Seeds; retries do not accidentally duplicate the same submission; another user cannot access them; the original capture remains preserved.

## Acceptance criteria

- [ ] Local Supabase is initialized through committed configuration and ordered migrations.
- [ ] Synthetic data/test setup supports at least two users.
- [ ] Seed persistence follows `docs/SEED_DOMAIN.md`: original capture is preserved as provenance and is not silently overwritten by derived interpretation.
- [ ] The data model allows derived objects/relationships to remain separate from the origin Seed.
- [ ] Creation supports a stable client-generated Seed/request identity plus idempotency suitable for retry/double-submit protection without semantic deduplication.
- [ ] The idempotency identity is not derived from Seed text/content.
- [ ] Downstream derived-action failure cannot cause loss of the original Seed.
- [ ] Every user-owned API-accessible table has RLS and explicit policies.
- [ ] Tests prove User A cannot read, insert on behalf of, update, or delete User B's Seed data.
- [ ] Anonymous access is denied unless an explicit public behavior is approved.
- [ ] Normal user creation/read behavior is covered by integration tests.
- [ ] Migration reset/rebuild works from a clean local database with synthetic data.
- [ ] No model-provider SDK or model call is introduced.

## Out of scope

- automatic categorization;
- Grow behavior;
- Hold/Resolve/Snip transitions beyond any minimal field needed for schema evolution;
- learned aliases;
- Tasks/Events/Goals implementation;
- offline sync engine;
- widget integration;
- AI.

## Product decisions

Use `docs/SEED_DOMAIN.md` as the authority. Do not reinterpret unresolved product behavior in schema design. Raise a decision request if a schema choice would change user-visible meaning or make a future approved behavior materially harder.

## Technical notes

Prefer the smallest schema that satisfies current invariants while leaving derived objects and many-to-many relationships possible. Do not build a generic knowledge graph framework in this task.

Do not use semantic duplicate detection. Idempotency protects retries; repeated thoughts remain valid separate captures.

Design Seed identity so future offline capture can safely create a stable ID before server synchronization. Do not build the offline sync engine in this task.

## Refactor / architecture checkpoint

This is the first implementation of the Seed persistence pattern. Avoid speculative repositories/abstractions until the real access patterns exist. Perform a focused cleanup before handoff, but do not generalize for hypothetical future objects.

## AI necessity review

No model behavior. Model-provider dependencies are prohibited in this task.

## Security and data review

High sensitivity. Seeds may contain private personal text.

- Raw private content must not enter logs by default.
- RLS and cross-user denial tests are release blockers.
- Service-role credentials must not enter the client.
- Test data must be synthetic.

## Verification plan

- local database reset from zero;
- migration application;
- integration tests for create/read;
- idempotent retry test;
- cross-user read/write/update/delete denial tests;
- anonymous denial tests;
- lint/typecheck/tests/build where configured;
- repository contract check;
- rerun relevant checks after cleanup/refactor.

## Implementation handoff

Complete using `docs/ai/HANDOFF.md`.

## Independent review

Complete using `docs/ai/REVIEW_TEMPLATE.md`.
