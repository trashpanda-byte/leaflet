# Architecture

## Status

Leaflet is a greenfield project. Task 0001 is establishing the first application foundation on `feat/application-foundation`.

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
- **AI:** intentionally absent from the application scaffold

See `docs/DEVELOPMENT.md` for the exact current setup path.

## Target runtime flow

```text
Client
  → typed application command
  → context lookup
  → deterministic rule / parser / state engine
      → resolved: validated action
      → unresolved: mark for later escalation
  → schema/permission validator
  → database
  → safe reusable structured knowledge

Only after the deterministic pipeline is mature:
  unresolved and valuable cases
      → AI gateway
      → typed proposal
      → deterministic validation
      → execute or ask for confirmation
```

The Seed pipeline must not begin as an LLM wrapper. The database model, state machine, parsers, action schemas, validation, ownership rules, confidence policy, and observable fallback states should be implemented first. AI is added only where measured unresolved cases justify it.

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

## Remaining implementation choices

- initial Supabase project structure, schema, migrations, and local seed strategy;
- authentication providers and callback flows;
- test frameworks and initial coverage expectations;
- preview environment behavior;
- monitoring, analytics, and error-reporting approach;
- exact widget implementation for each platform after the core Seed service exists.
