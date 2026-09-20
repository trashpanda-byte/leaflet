# TASK-0001 — Select and scaffold the application foundation

| Field | Value |
|---|---|
| Status | in progress |
| Owner | Claude / implementation engineer |
| Reviewer | Codex |
| Branch | `feat/application-foundation` |
| Risk | medium |
| Depends on | none |

## Why

Leaflet is a greenfield project with no pre-existing build. The first engineering task is to establish a maintainable mobile foundation and verify a real Expo development build before product/database work accumulates.

## Expected experience

An authorized contributor can clone the repository, install dependencies, create or install an Expo development client, start Metro, and see a minimal Leaflet development shell on the registered iOS device.

## Acceptance criteria

- [x] The chosen framework, package manager, runtime baseline, repository layout, and rationale are recorded.
- [ ] Supported versions are pinned through project files **and a committed lockfile**.
- [ ] A minimal Leaflet development shell starts from a fresh clone using exact README commands.
- [x] The scaffold follows the product/design constitutions without implementing product features prematurely.
- [ ] Type checking and Expo Doctor pass or any remaining issue is explicitly documented.
- [ ] App-specific CI is added at the level justified by the current scaffold, or explicitly deferred with a reason.
- [x] No secret values were added to `.env.example`.
- [x] README, architecture, development, roadmap, and status documentation describe the current setup and boundaries.
- [ ] The iPhone is registered as required and an iOS development build is created/installed.
- [ ] The development client successfully loads the Leaflet shell from Metro on the iPhone.
- [ ] A fresh-clone/device verification is recorded in the implementation handoff.

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
- approved Seed domain specification and queued implementation tasks
- no Supabase client, auth, Seed implementation, or AI integration yet

## Out of scope

- Supabase initialization or database migrations — moved to TASK-0002;
- synthetic tenant data and RLS tests — moved to TASK-0002;
- automatic Seed organization;
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

Expo Go is not the compatibility target. Leaflet uses a project-specific development client so future native widgets, notifications, location, calendar access, and other integrations fit the normal development model.

Generated native directories are treated as build artifacts under Expo CNG unless a future native customization requires a deliberate change.

Seed behavior is specified now so implementation can begin immediately after this task, but Task 0001 intentionally stops before database/domain coding. TASK-0002 owns the first Supabase and Seed persistence work.

## Refactor / architecture checkpoint

Keep this scaffold minimal. Remove template/demo code and obvious setup cruft before handoff, but do not create product abstractions until the Seed work demonstrates a need.

## AI necessity review

No model behavior is part of this task. Do not introduce an LLM call into the scaffold.

## Security and data review

No user data is stored by the current scaffold. Secrets must not be committed or exposed in client configuration.

When Supabase is introduced in TASK-0002, user-owned tables require RLS, explicit policies, and negative cross-user tests in the same task.

## Verification plan

Still required in a networked development environment:

- run `npm install` and commit the generated `package-lock.json`;
- run `npm run typecheck`;
- run `npm run doctor`;
- run `bash scripts/validate-repository.sh`;
- link EAS only as needed for the first development build;
- register the iPhone when required;
- create/install the iOS development client;
- launch the scaffold from Metro on the iPhone;
- verify no private environment file or generated dependency directory is tracked;
- rerun relevant checks after cleanup.

## Implementation handoff

Pending runtime/device verification.

## Independent review

Pending runtime/device verification and handoff.
