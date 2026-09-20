# TASK-0007 — Internal Schedule domain

| Field | Value |
|---|---|
| Status | queued |
| Owner | Claude / implementation engineer |
| Reviewer | Codex |
| Branch | `feat/internal-schedule-domain` (recommended) |
| Risk | high |
| Depends on | TASK-0006 |

## Why

Leaflet needs a provider-neutral internal Event/Schedule model before external calendars, proactive timing, widgets, or location-aware scheduling can be integrated cleanly.

## Expected experience

A valid `create_event` ActionIntent can be validated and executed into a Leaflet Event. The Event remains useful to Leaflet even when no Google/Apple calendar is connected.

## Acceptance criteria

- [ ] Implement the provider-neutral rules in `docs/SCHEDULE_DOMAIN.md`.
- [ ] A Schedule service owns Event creation/update/cancel/query behavior.
- [ ] `create_event` ActionIntents from the Seed core cross the boundary through `docs/ACTION_CONTRACTS.md`.
- [ ] Core Event data includes owner, title, start, end/duration, timezone, status, and provenance to its source action/Seed where applicable.
- [ ] Successful execution returns a reversible ActionReceipt where the product action is reversible.
- [ ] Failed execution preserves the source Seed/action state and supports safe retry.
- [ ] The Schedule domain has no Google Calendar, Apple Calendar, or provider-specific fields in the core Event object.
- [ ] RLS/authorization and cross-user denial tests cover Event data.
- [ ] Timezone behavior is explicitly tested.
- [ ] No generative AI is required.

## Out of scope

- Google Calendar synchronization;
- Apple Calendar synchronization;
- recurring events;
- attendees;
- travel time;
- complex availability optimization;
- automatic rescheduling;
- AI scheduling.

## Refactor / architecture checkpoint

Before any external calendar provider is integrated, Codex must verify the Schedule service exposes provider-neutral commands/queries and that provider state can live entirely behind an adapter/mapping boundary.

## AI necessity review

No model behavior.

## Security and data review

Events are user-owned private schedule data. Apply the same RLS and logging discipline as Seeds.

## Verification plan

Unit/integration tests for valid/invalid temporal data, timezone handling, idempotent creation, ownership, Undo/cancel behavior, source provenance, and cross-user denial.

## Implementation handoff

Complete using `docs/ai/HANDOFF.md`.

## Independent review

Complete using `docs/ai/REVIEW_TEMPLATE.md`.
