# Architecture

## Status

This document defines architectural boundaries and the intended runtime shape. It does not yet describe the imported application because no application code was present in the repository when this foundation was created.

When the code is imported, add a verified “Current implementation” section with the exact framework, package manager, directory map, runtime services, deployment targets, and commands.

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

## Unknowns to resolve after code import

- frontend and backend frameworks;
- package manager and supported runtime versions;
- current Supabase schema and migration history;
- authentication providers and callback flows;
- test frameworks and coverage;
- Vercel configuration and preview environment behavior;
- current monitoring, analytics, and error reporting.
