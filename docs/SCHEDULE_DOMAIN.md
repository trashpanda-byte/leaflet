# Schedule domain

## Purpose

Leaflet owns an internal schedule model. External calendars are integrations with that model, not the core source of truth for Leaflet behavior.

This boundary allows Seeds, Tasks, proactive assistance, widgets, notifications, location context, and future providers to refer to the same internal Event.

## Core flow

```text
Seed
  ↓
SeedResolver
  ↓
create_event ActionIntent
  ↓
Schedule service
  ↓
Leaflet Event
  ↓
Leaflet schedule / notifications / context
  ↓
optional provider adapters
```

Never make the Seed domain call Google Calendar, Apple Calendar, or another provider directly.

## Event concept

The internal Event should be provider-neutral. Conceptually it needs:

- Leaflet event ID;
- owner/user ID;
- title;
- start;
- end or duration;
- timezone;
- status;
- provenance back to the source Seed/action when one exists.

All-day events, recurrence, attendees, travel time, reminders, and richer calendar semantics should be added only when the corresponding product flow is designed.

## Provenance

When a Seed creates an Event, preserve the reason chain:

```text
Seed
  └─ derived action
       └─ Event
```

Later this can support:

```text
Goal → Task → Event
Seed ────────────┘
```

without forcing those objects to become the same record.

## External calendar adapters

Provider-specific state belongs at the integration boundary, not on the core Event model.

A future mapping may conceptually contain:

- Leaflet event ID;
- provider;
- provider calendar ID;
- provider event ID;
- provider revision/sync token;
- last synchronized time;
- provider-specific metadata required for safe synchronization.

The exact conflict-resolution and two-way-sync policy is intentionally deferred until external calendar integration is designed.

## Source of truth

Leaflet's internal Event is the canonical object for Leaflet-native behavior.

An external provider may later be configured as a synchronization source/target, but that policy must not force Seed processing, reminders, widgets, or contextual assistance to depend directly on one vendor's API.

## Architecture checkpoint

Build and review the internal Schedule service before adding Google Calendar, Apple Calendar, or another external calendar integration.

The schedule service must expose provider-neutral commands/queries so provider adapters can be added or replaced without changing Seed semantics.
