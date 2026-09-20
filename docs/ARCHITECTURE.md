# Architecture

## Status

Leaflet is a greenfield project. Task 0001 is establishing the first application foundation on `feat/application-foundation`. The Seed domain baseline is approved in `docs/SEED_DOMAIN.md`, and implementation tasks are queued behind Task 0001 verification.

## Current implementation

The current scaffold selects:

- **Client framework:** Expo SDK 57 / React Native 0.86
- **Language:** TypeScript with strict checking
- **React:** 19.2
- **Package manager:** npm
- **Runtime baseline:** Node.js 22.13+
- **Development environment:** Expo development builds using `expo-dev-client`
- **Native project model:** Expo Continuous Native Generation; generated `ios/` and `android/` directories are not the primary source of truth
- **Cloud build configuration:** EAS profiles are declared, but the project is not yet linked or verified through an actual EAS build
- **Database:** Supabase is planned but not initialized in the application scaffold yet
- **AI:** intentionally absent from the application scaffold and first deterministic Seed milestones

See `docs/DEVELOPMENT.md` for the exact current setup path.

## Target runtime flow

```text
Capture source (app now; widgets/voice later)
  → create Seed origin record with stable client/request identity
  → normalize without overwriting the source
  → retrieve relevant structured state
  → SeedResolver
      → resolved: typed relationships and/or ActionIntents
      → ambiguous: competing valid interpretations
      → unresolved: insufficient deterministic evidence
  → validator / appropriate domain executor
  → persist relationships, provenance, lifecycle, and action outcome
  → expose the smallest truthful UI result

Only after the deterministic Seed core is complete and refactored:
  measured unresolved and valuable cases
      → AI gateway
      → smallest capable model
      → typed proposal
      → deterministic validation
      → execute, suggest, or ask for confirmation
```

## Seed core invariants

Architecture must preserve the rules in `docs/SEED_DOMAIN.md`:

- the original Seed is provenance and is not silently overwritten by interpretation;
- derived Tasks, Goals, Events, Projects, Questions, and relationships remain separate objects;
- a Seed may have many relationships and branches;
- lifecycle state is distinct from organization/resolution provenance;
- Grow is an action/intent, not a lifecycle enum value;
- unresolved is a valid successful result;
- explicit user corrections outrank inference;
- idempotency prevents retry duplicates without semantic deduplication;
- linking is preferred to merging;
- action execution validates ownership, intent, reversibility, and duplicate/retry behavior;
- capture/domain logic is shared so future native widgets do not duplicate the brain of Leaflet;
- Topic is the persisted organizational concept; Branch is primarily a Tree/UI projection of Topic relationships;
- the initial relationship vocabulary stays small (`about`, `part_of`, `related_to`, `derived_from`);
- the SeedResolver returns typed outcomes and does not directly write Task/Schedule state;
- ActionIntents cross into domain services through the provider-neutral contracts in `docs/ACTION_CONTRACTS.md`;
- the source Seed survives downstream action failure;
- when a successful explicit action fully satisfies a Seed, the Seed resolves automatically;
- Leaflet Events belong to the internal Schedule domain; external calendars are adapters, as defined in `docs/SCHEDULE_DOMAIN.md`.

## Domain boundaries

```text
Capture/UI
   ↓
Seed application service
   ↓
SeedResolver
   ↓
typed Resolution / ActionIntent
   ↓
┌──────────────┬───────────────┐
│ Seed storage │ domain service│
│/relationships│ Task/Schedule │
└──────────────┴───────────────┘
```

The resolver is deterministic and side-effect free with respect to derived domains: it interprets authorized context and returns typed results. Validators/executors own state changes.

The Schedule domain owns internal Events. Google Calendar, Apple Calendar, and future providers may only integrate through provider adapters after the internal Schedule service is established.

## Deterministic-first boundary

The first Seed milestones must not include a model-provider SDK, prompt layer, embedding service, or hidden generative fallback.

The database model, lifecycle/state machine, parsers, action schemas, validation, ownership rules, organization provenance, learned corrections, and observable unresolved cases are implemented first.

After the end-to-end deterministic slice works, Task 0006 is the required architecture/refactor checkpoint before AI design begins.

## Boundaries

- The client never receives server secrets or service-role credentials.
- Authentication establishes identity; authorization and RLS enforce ownership at every data boundary.
- Database changes are versioned migrations. Manual dashboard changes are not the source of truth.
- AI proposes typed outputs; application code validates and executes allowed actions.
- External search and place lookup use purpose-built APIs when available; an LLM does not invent current facts.
- Observability must avoid raw private content by default.
- Production, preview/staging, and local development use separate data environments.
- Native widgets and platform integrations call shared application/domain services rather than duplicating business logic.

## Environment model

| Environment | Purpose | Agent freedom |
|---|---|---|
| Local | Development with synthetic seed data | High within the repository and local services |
| Preview/staging | PR and integration validation | Limited, isolated, non-production data |
| Production | Real users and data | Guarded; explicit human authorization for risky operations |

## Change rules

- One coherent feature or fix per branch when practical.
- Schema changes include forward migration, rollback/recovery notes, RLS impact, and tests.
- New dependencies require a concrete need, maintenance/security consideration, and license check.
- Important choices are recorded in `docs/DECISIONS.md`.
- Temporary compromises include an owner and removal condition.
- The queued Seed task sequence should be implemented in dependency order unless a recorded decision changes that plan.

## Remaining implementation choices

- exact Supabase schema and migration design that satisfies the Seed invariants;
- authentication providers and callback flows;
- test frameworks and initial coverage expectations;
- exact Undo-window duration and permanent retention/deletion policy;
- preview environment behavior;
- monitoring, analytics, and error-reporting approach;
- exact widget implementation for each platform after the shared Seed service exists;
- exact internal Schedule schema and calendar conflict/sync policy when schedule work begins;
- AI capabilities only after the deterministic architecture checkpoint.
