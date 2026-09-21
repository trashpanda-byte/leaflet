# Leaflet status

**Last verified:** 2026-09-21

## Overall state

Leaflet is a greenfield project. The first application scaffold exists on the `feat/application-foundation` branch.

The selected foundation is Expo SDK 57 + React Native + TypeScript + npm with `expo-dev-client` and EAS development-build profiles. Local dependency installation (`npm ci` from the committed lockfile), TypeScript, Expo Doctor, repository validation, Metro startup, and an iOS JS export are verified locally. The EAS project `@trashpandadev/leaflet` is linked and the iOS bundle identifier is `com.trashpandadev.leaflet`. Apple Developer is now active. EAS restored the Apple session, registered `com.trashpandadev.leaflet`, generated a managed distribution certificate, and created an active ad hoc provisioning profile for the user's registered iPhone (no UDID or certificate details are stored in the repository). EAS development/internal iOS build `1797c499-f96b-4c1f-a808-b08c3af48d1e` (version 0.1.0, build 1) finished successfully at 2026-09-21T19:33:01.369Z; EAS status is `FINISHED` and an installable IPA is available. The development build is **not yet verified on an iPhone**: installation and a real-device Metro launch have not been confirmed.

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
| Stack selection | Local installation, typecheck, Doctor, Metro startup, and iOS JS export verified; native device verification pending |
| Development build | Apple registration and signing confirmed; EAS build `1797c499-f96b-4c1f-a808-b08c3af48d1e` finished successfully at 2026-09-21T19:33Z; installation and iOS launch not verified |
| Package lock | Generated and verified with a clean `npm ci` install |
| Design direction | Canonical references committed; full implementation pending |
| Seed product/domain rules | Approved baseline; revisable during development |
| Local Supabase | Not initialized; TASK-0002 queued |
| Seed/domain implementation | Not started |
| Seed implementation plan | TASK-0002 through TASK-0006 queued |
| Internal schedule plan | ACTION/Schedule contracts defined; TASK-0007 queued |
| AI integration | Intentionally prohibited before TASK-0006 completes |
| Automated app tests | Not configured |
| CI | Signing/configuration commit `1a02870` passed [run 35645426451](https://github.com/trashpanda-byte/leaflet/actions/runs/35645426451); later documentation commits receive separate CI checks on PR #3 |
| Independent review | Codex: local foundation PASS; overall task incomplete pending physical-iPhone evidence. See [review](ai/reviews/TASK-0001.md). |
| Dependency audit | 10 moderate findings from one transitive tooling advisory; no high/critical findings; scoped assessment and follow-up recorded in review |
| Production | Not created or changed by this repository |

## Waiting on Chris

The immediate hands-on step is the development build: install the successful EAS build `1797c499-f96b-4c1f-a808-b08c3af48d1e` on the registered iPhone, and launch it from Metro. Apple registration, signing, and the EAS project link are already done.

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
