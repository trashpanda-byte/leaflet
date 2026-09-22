# TASK-0004 — Deterministic Seed organization and relationships

| Field | Value |
|---|---|
| Status | queued |
| Owner | Claude / implementation engineer |
| Reviewer | Codex |
| Branch | `feat/seed-organization` (recommended) |
| Risk | high |
| Depends on | TASK-0003 |

## Why

Leaflet should organize obvious cases and learn from corrections without requiring an LLM.

## Expected experience

Strong matches organize quietly; weak matches remain unresolved; one Seed may relate to multiple branches; user corrections become narrow reusable knowledge; related records are linked rather than silently merged.

## Acceptance criteria

- [ ] Organization follows `docs/SEED_DOMAIN.md`.
- [ ] Resolution provenance is interpretable; no arbitrary user-facing confidence percentage is introduced.
- [ ] Organization is implemented behind a distinct deterministic `SeedResolver` boundary.
- [ ] Resolver authority follows: explicit instruction/correction → user-confirmed knowledge → exact structured-state match → single unambiguous deterministic rule/parser → ambiguous/unresolved.
- [ ] Conflicting viable interpretations at the highest applicable authority level return `ambiguous`; lower-authority rules do not break the tie.
- [ ] Strong exact/rule/confirmed-learned matches can resolve automatically only under that precedence.
- [ ] Ambiguous cases remain unresolved without forced categorization.
- [ ] Existing structure is reused before new categories are created.
- [ ] Category creation is conservative and broad-first.
- [ ] Persisted organization uses Topics + typed relationships; Branch is treated as a Tree/UI projection rather than a separate persistence concept unless later evidence requires it.
- [ ] Initial relationship types stay limited to `about`, `part_of`, `related_to`, and `derived_from`.
- [ ] One Seed can hold multiple relationships while supporting a primary organizational home if useful.
- [ ] Similar names can be represented as aliases/relationships without automatic destructive merge.
- [ ] User corrections outrank inferred structure and initially learn only the exact normalized corrected term or explicitly confirmed alias; no automatic “close variant” generalization.
- [ ] Repeated genuine thoughts remain separate records.
- [ ] Important organization changes are reversible.
- [ ] No vector database, embeddings, model-provider SDK, or generative model call is introduced unless separately approved.

## Out of scope

- semantic embeddings;
- AI classification;
- automatic category merging;
- broad generalization from one correction;
- full Tree UI.

## Refactor / architecture checkpoint

A pattern may now exist across persistence, lifecycle, and organization. Consolidate only proven shared validation/relationship logic. Do not create a generic graph framework unless current code demonstrates the need.

## AI necessity review

No model behavior. The unresolved set created by this task is future evidence for whether AI is necessary.

## Security and data review

Relationships and learned knowledge are user-owned data and require the same isolation guarantees as Seeds.

## Verification plan

Cover exact matches, rule matches, confirmed aliases, ambiguous cases, multiple relationships, correction precedence, reversible changes, cross-user isolation, and genuine repeated thoughts.

## Implementation handoff

Complete using `docs/ai/HANDOFF.md`.

## Independent review

Complete using `docs/ai/REVIEW_TEMPLATE.md`.
