# Architecture

## Status

This document defines architectural boundaries and the intended runtime shape. Leaflet is a greenfield project: no pre-existing application or implementation must be imported, reverse-engineered, or preserved.

The current implementation consists only of repository governance, documentation, task formats, and a repository-contract workflow. Task 0001 will select and scaffold the application stack. After that work, add a verified “Current implementation” section with the exact framework, package manager, directory map, runtime services, deployment targets, and commands.

## Target runtime flow

```text
Client
  → Request router
  → Context + intent engines
  → Deterministic rule engine
      → resolved: action engine
      → unresolved: AI gateway
  → schema/permission validator
  → database
  → learning layer for safe reusable relationships
```

## Boundaries

- The client never receives server secrets or service-role credentials.
- Authentication establishes identity; authorization and RLS enforce ownership at every data boundary.
- Database changes are versioned migrations. Manual dashboard changes are not the source of truth.
- AI proposes typed outputs; application code validates and executes allowed actions.
- External search and place lookup use purpose-built APIs when available; an LLM does not invent current facts.
- Observability must avoid raw private content by default.
- Production, preview/staging, and local development use separate data environments.

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

## Initial implementation choices to resolve

- frontend and backend frameworks;
- package manager and supported runtime versions;
- initial Supabase project structure, schema, migrations, and local seed strategy;
- authentication providers and callback flows;
- test frameworks and initial coverage expectations;
- Vercel configuration and preview environment behavior;
- monitoring, analytics, and error-reporting approach.
