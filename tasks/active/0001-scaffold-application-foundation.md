# TASK-0001 — Select and scaffold the application foundation

| Field | Value |
|---|---|
| Status | ready |
| Owner | Claude / implementation engineer |
| Reviewer | Codex |
| Branch | `feat/application-foundation` (recommended) |
| Risk | medium |

## Why

Leaflet is a greenfield project with no pre-existing build. The first engineering task is to choose a maintainable foundation deliberately, create a minimal reproducible application, and establish real commands and tests before product features accumulate.

## Expected experience

An authorized contributor can clone the repository, follow the README, install dependencies, start Leaflet locally, see a minimal development shell, run the initial checks, and rebuild the local database state without production access.

## Acceptance criteria

- [ ] The chosen framework, package manager, runtime versions, repository layout, and rationale are recorded in `docs/ARCHITECTURE.md` and `docs/DECISIONS.md`.
- [ ] Supported versions are pinned through appropriate project files and a committed lockfile.
- [ ] A minimal Leaflet development shell starts from a fresh clone using exact README commands.
- [ ] The scaffold follows `docs/PRODUCT.md` and `docs/DESIGN.md` without prematurely implementing full product features.
- [ ] Local Supabase is initialized through repository configuration, an initial migration, and synthetic seed data if Supabase is selected for the foundation.
- [ ] At least two synthetic users are represented wherever tenant-isolation tests require them; no production data is used.
- [ ] Formatting, linting, type checking, unit-test, integration-test, and production-build foundations are configured or explicitly documented as not yet applicable.
- [ ] `.env.example` contains only environment-variable names the scaffold actually uses, with no secret values.
- [ ] App-specific CI replaces or extends the provisional repository-contract workflow.
- [ ] `README.md`, `docs/ARCHITECTURE.md`, `docs/DATABASE.md`, and `docs/STATUS.md` describe verified commands and state.
- [ ] A fresh-clone verification is recorded in the implementation handoff.

## Out of scope

- automatic thought organization;
- production user authentication;
- model-provider integration or AI calls;
- production database creation or migration;
- production deployment;
- implementing the full Leaflet visual system.

## Product decisions

- GREEN: directory organization, lint/test configuration, and other reversible internal scaffolding choices consistent with the constitutions.
- YELLOW: framework and package-manager recommendation, with rationale and migration cost disclosed in the handoff.
- RED: adding a new paid vendor, creating production infrastructure, changing the agreed product direction, or making an irreversible platform commitment requires Chris's approval.

## Technical notes

Begin from supported first-party scaffolding where practical, then remove example/demo code that does not serve Leaflet. Prefer a small vertical foundation over a monorepo or service split that has not been justified by current needs.

Do not link local tooling to production Supabase or Vercel merely to prove setup. Keep local, preview/staging, and production boundaries explicit from the first implementation.

## AI necessity review

No model behavior is part of this task. Do not introduce an LLM call into the scaffold.

## Security and data review

The primary risks are generated secrets, accidentally public environment variables, unsafe default database access, copied real data, and dependency supply-chain risk. Verify generated configuration before committing it. If a user-owned table is introduced, include RLS policies and cross-user denial tests in the same task.

## Verification plan

- Start from a clean clone with only documented prerequisites.
- Run every install, local-start, formatting, lint, typecheck, test, build, and database-reset command defined by the scaffold.
- Run `bash scripts/validate-repository.sh`.
- Inspect the production bundle/configuration for server secrets entering client output.
- Verify no `.env*` file other than `.env.example` and no generated dependency/build directory is tracked.

## Implementation handoff

Complete using `docs/ai/HANDOFF.md`.

## Independent review

Complete using `docs/ai/REVIEW_TEMPLATE.md`.
