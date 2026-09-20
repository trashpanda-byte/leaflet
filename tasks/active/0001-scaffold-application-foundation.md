# TASK-0001 — Select and scaffold the application foundation

| Field | Value |
|---|---|
| Status | in progress |
| Owner | Claude / implementation engineer |
| Reviewer | Codex |
| Branch | `feat/application-foundation` |
| Risk | medium |

## Why

Leaflet is a greenfield project with no pre-existing build. The first engineering task is to choose a maintainable foundation deliberately, create a minimal reproducible application, and establish real commands and tests before product features accumulate.

## Expected experience

An authorized contributor can clone the repository, install dependencies, create or install an Expo development client, start Metro, and see a minimal Leaflet development shell on a target device or simulator.

## Acceptance criteria

- [x] The chosen framework, package manager, runtime baseline, repository layout, and rationale are recorded.
- [ ] Supported versions are pinned through project files **and a committed lockfile**.
- [ ] A minimal Leaflet development shell starts from a fresh clone using exact README commands.
- [x] The scaffold follows the product/design constitutions without implementing product features prematurely.
- [ ] Local Supabase is initialized through repository configuration, an initial migration, and synthetic seed data.
- [ ] At least two synthetic users are represented wherever tenant-isolation tests require them.
- [ ] Formatting, linting, type checking, unit-test, integration-test, and production-build foundations are configured or explicitly documented as not yet applicable.
- [x] No secret values were added to `.env.example`.
- [ ] App-specific CI replaces or extends the provisional repository-contract workflow.
- [x] README, architecture, development, roadmap, and status documentation describe the current setup and boundaries.
- [ ] A fresh-clone verification is recorded in the implementation handoff.

## Current implementation

- Expo SDK 57
- React Native 0.86
- React 19.2
- TypeScript
- npm
- Node 22.13+ baseline
- `expo-dev-client`
- EAS development and iOS-simulator build profiles
- minimal Leaflet-branded shell
- no Supabase client, auth, Seed logic, or AI integration yet

## Out of scope

- automatic thought organization;
- production user authentication;
- model-provider integration or AI calls;
- production database creation or migration;
- production deployment;
- full visual-system implementation.

## Product decisions

- GREEN: directory organization, lint/test configuration, and other reversible scaffolding choices.
- YELLOW: framework and package-manager recommendation. Current choice is Expo/React Native + npm because Leaflet targets both iOS and Android and will need native integrations such as widgets.
- RED: adding a new paid vendor, creating production infrastructure, changing the agreed product direction, or making an irreversible platform commitment requires Chris's approval.

## Technical notes

Expo Go is not the compatibility target. Leaflet will use a project-specific development client so future native widgets, notifications, location, calendar access, and other integrations fit the development model.

Generated native directories are treated as build artifacts under Expo CNG unless a future native customization requires a deliberate change.

The next product phase is explicitly deterministic-first: build the Seed database/domain/state/action loop before adding any model-provider SDK.

## AI necessity review

No model behavior is part of this task. Do not introduce an LLM call into the scaffold.

## Security and data review

No user data is stored by the current scaffold. When Supabase is introduced, user-owned tables require RLS, explicit policies, and negative cross-user tests in the same feature scope.

## Verification plan

Still required in a networked development environment:

- run `npm install` and commit the generated `package-lock.json`;
- run `npm run typecheck`;
- run `npm run doctor`;
- run `bash scripts/validate-repository.sh`;
- link EAS only as needed for the first development build;
- create/install a development client;
- launch the scaffold on at least one target platform;
- verify no private environment file or generated dependency directory is tracked.

## Implementation handoff

Pending runtime verification.

## Independent review

Pending runtime verification and handoff.
