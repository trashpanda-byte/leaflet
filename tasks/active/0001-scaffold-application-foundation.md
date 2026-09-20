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
- [x] Supported versions are pinned through project files **and a committed lockfile**.
- [ ] A minimal Leaflet development shell starts from a fresh clone using exact README commands.
- [x] The scaffold follows the product/design constitutions without implementing product features prematurely.
- [x] Type checking and Expo Doctor pass or any remaining issue is explicitly documented.
- [x] App-specific CI is added at the level justified by the current scaffold, or explicitly deferred with a reason.
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

### Implementation summary

The Windows local-development setup is verified with Node.js 22.13.0. The committed npm lockfile reproduces the dependency installation, and CI now installs from that lockfile before running the repository contract, TypeScript, and Expo Doctor checks.

The local Expo development server reaches the Metro ready state. iOS signing, installation, and real-device launch remain pending Apple Developer enrollment and are not claimed as verified.

### Changed files

- dependency configuration: `package-lock.json`;
- CI and repository validation: `.github/workflows/repository-contract.yml` and `scripts/validate-repository.sh`;
- documentation: this task and `docs/STATUS.md`.

### Refactor and architecture pass

No product or Seed code was introduced. The scaffold remains minimal, and the provisional CI note was replaced with executable application checks.

### Data and security impact

No database, authentication, user data, or secrets were added. Only `.env.example` is tracked; private environment names and dependency output remain ignored.

### AI necessity and cost impact

None. No model behavior or provider dependency was added.

### Verification evidence

- `npm install`: passed; 474 packages installed and `package-lock.json` generated;
- `npm ci`: passed; clean lockfile install reproduced all 474 packages;
- `npm run typecheck`: passed with no TypeScript errors;
- `npm run doctor`: passed all 21 checks;
- `bash scripts/validate-repository.sh`: passed;
- `npm ls --depth=0`: passed with the expected direct dependencies;
- `npm start -- --offline`: Metro reached `Waiting on http://localhost:8081`, then was stopped after the smoke test;
- tracked-file and credential-pattern checks: no private env file, dependency directory, credential-like file, or high-confidence live-token pattern found.

### Known limitations and follow-ups

- The global Windows Node.js installation is newer than the repository-supported major version. `fnm` 1.39.0 is configured for the Windows user and automatically selects Node.js 22.13.0 from `.nvmrc` when entering the repository.
- npm reports 10 moderate advisories in Expo's transitive native tooling. Its proposed forced fix downgrades Expo to SDK 46 and was not applied.
- The GitHub workflow must pass after this commit is pushed.
- EAS project linking, iOS device registration, development-build installation, and real-device launch remain pending.

### Decisions

No RED decision was made. Application CI uses the existing Node/npm/Expo choices and the repository's `.nvmrc`.

### Review target

`feat/application-foundation` against `main`; final commit SHA to be recorded after commit.

## Independent review

Pending runtime/device verification and handoff.
