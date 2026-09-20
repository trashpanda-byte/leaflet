# Leaflet status

**Last verified:** 2026-09-20

## Overall state

Leaflet is a greenfield project. The first application scaffold now exists on the `feat/application-foundation` branch.

The selected foundation is Expo SDK 57 + React Native + TypeScript + npm with `expo-dev-client` and EAS development-build profiles. The files are committed, but the development build is **not yet verified as running** because dependency installation, lockfile generation, Expo Doctor/typecheck execution, EAS project linking, and a real device/simulator launch still need to occur in a networked development environment.

No Supabase client, Seed schema, authentication, AI provider SDK, or model calls have been introduced into the application scaffold.

## Current focus

Finish Task 0001 by installing dependencies, committing the lockfile, running checks, and successfully launching a development build. Do not start the Seed feature implementation before that verification.

After Task 0001, build the Seed loop with database/application logic first and defer AI integration.

## Completed in this foundation

- shared product, design, engineering, security, database, and AI rules;
- separate implementation and independent-review responsibilities;
- definition of done, handoff, review, and decision-request formats;
- canonical brand-board and app-icon references;
- Expo/React Native/TypeScript scaffold on a feature branch;
- Expo development-client dependency and EAS development profiles;
- development setup documentation;
- explicit deterministic-before-AI implementation order.

## Health

| Area | State |
|---|---|
| Application code | Initial Expo scaffold committed on feature branch |
| Stack selection | Selected; verification pending |
| Development build | Configured; not yet launched/verified |
| Package lock | Pending local/networked `npm install` |
| Design direction | Canonical references committed; full implementation pending |
| Local Supabase | Not initialized |
| Seed/domain logic | Not started |
| AI integration | Intentionally not started |
| Automated app tests | Not configured |
| CI | Repository-contract checks only; app-specific checks pending |
| Preview deployment | Not configured/verified |
| Production | Not created or changed by this repository |

## Waiting on Chris

A local or EAS-backed run is needed to finish verification. The next hands-on step is to pull the feature branch on the development machine, run `npm install`, then follow `docs/DEVELOPMENT.md`.

No product decision is currently blocking the foundation.

## Next

1. Install dependencies and commit `package-lock.json`.
2. Run `npm run typecheck` and `npm run doctor`.
3. Create/install the development client on Android and/or iOS and launch the scaffold.
4. Complete independent review and merge Task 0001.
5. Initialize Supabase locally with migrations and RLS test foundations.
6. Define and implement the deterministic Seed data model and state machine.
7. Add AI only after deterministic unresolved cases are observable.
