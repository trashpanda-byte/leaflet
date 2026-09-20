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
  → create Seed origin record
  → normalize without overwriting the source
  → retrieve relevant structured state
  → deterministic rules / parsers / confirmed relationships
      → resolved: validate and execute/recommend
      → ambiguous/unresolved: preserve safely
  → persist typed relationships, provenance, and lifecycle
  → expose the smallest useful UI result

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
- capture/domain logic is shared so future native widgets do not duplicate the brain of Leaflet.

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
- AI capabilities only after the deterministic architecture checkpoint.
