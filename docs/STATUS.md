# Leaflet status

**Last verified:** 2026-09-20

## Overall state

Leaflet is a greenfield project. The first application scaffold exists on the `feat/application-foundation` branch.

The selected foundation is Expo SDK 57 + React Native + TypeScript + npm with `expo-dev-client` and EAS development-build profiles. Local dependency installation (`npm ci` from the committed lockfile), TypeScript, Expo Doctor, repository validation, Metro startup, and an iOS JS export are verified locally. The EAS project `@trashpandadev/leaflet` is linked and the iOS bundle identifier is `com.trashpandadev.leaflet`. The development build is **not yet verified on an iPhone**: iOS device registration, the development build, installation, and a real-device Metro launch still need to occur after Apple Developer activation (user-reported pending).

The Seed product/domain baseline is now approved and documented in `docs/SEED_DOMAIN.md`. Tasks 0002–0006 are queued in dependency order so Claude can implement small bounded Seed slices and Codex can review each one independently. The resolver/action/schedule boundaries are now specified, and TASK-0007 is queued for the provider-neutral internal Schedule domain after the Seed architecture checkpoint.

No Supabase client, Seed schema, authentication, AI provider SDK, or model calls have been introduced into application code yet.

## Current focus

Finish Task 0001 and successfully launch the development build on the iOS device.

Do not start Task 0002 implementation until Task 0001 is verified and merged. Documentation/specification work for the Seed core is ready.

## Completed in this foundation

- shared product, design, engineering, security, database, and AI rules;
- separate implementation and independent-review responsibilities;
- definition of done, handoff, review, refactor-checkpoint, and decision-request formats;
- canonical brand-board and app-icon references;
- Expo/React Native/TypeScript scaffold on a feature branch;
- Expo development-client dependency and EAS development profiles;
- development setup documentation;
- approved Seed domain baseline;
- deterministic-before-AI implementation order;
- queued Seed implementation tasks 0002–0006;
- mandatory architecture/refactor checkpoint before AI.

## Health

| Area | State |
|---|---|
| Application code | Initial Expo scaffold committed on feature branch |
| Stack selection | Selected; verification pending |
| Development build | Configured; iOS launch not yet verified |
| Package lock | Generated and verified with a clean `npm ci` install |
| Design direction | Canonical references committed; full implementation pending |
| Seed product/domain rules | Approved baseline; revisable during development |
| Local Supabase | Not initialized; TASK-0002 queued |
| Seed/domain implementation | Not started |
| Seed implementation plan | TASK-0002 through TASK-0006 queued |
| Internal schedule plan | ACTION/Schedule contracts defined; TASK-0007 queued |
| AI integration | Intentionally prohibited before TASK-0006 completes |
| Automated app tests | Not configured |
| CI | Repository contract, lockfile install, typecheck, and Expo Doctor configured; workflow triggers on pull requests and pushes to `main`; run 35533800411 for `aeab1c8` passed all steps (checked by Codex); commits after `aeab1c8` need a new run |
| Production | Not created or changed by this repository |

## Waiting on Chris

The immediate hands-on step is the development build: once Apple Developer enrollment is active, register the iPhone, create the iOS development build, install it, and launch it from Metro. The EAS project is already linked.

No Seed product decision currently blocks Task 0002. The approved rules may be revised later through the normal decision/documentation workflow.

## Next

1. Finish and merge TASK-0001.
2. Implement TASK-0002 Seed persistence/RLS foundation.
3. Implement TASK-0003 lifecycle and reversible actions.
4. Implement TASK-0004 deterministic organization/relationships.
5. Implement TASK-0005 iOS capture vertical slice.
6. Complete TASK-0006 Seed architecture checkpoint.
7. Implement TASK-0007 provider-neutral internal Schedule domain.
8. Add external calendar adapters only after the internal Schedule boundary is reviewed.
9. Consider AI only from measured unresolved cases after TASK-0006.
