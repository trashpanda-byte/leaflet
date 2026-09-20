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

Done locally (see handoff evidence): `npm ci` from the committed lockfile, `npm run typecheck`, `npm run doctor`, `bash scripts/validate-repository.sh`, Metro smoke, iOS JS export, and EAS project linking.

Still required after Apple Developer activation (none performed or verified yet):

- register the iPhone (`eas device:create`);
- create/install the iOS development client;
- launch the scaffold from Metro on the iPhone;
- verify no private environment file or generated dependency directory is tracked;
- rerun relevant checks after cleanup.

## Implementation handoff

### Implementation summary

The Windows local-development setup is verified with Node.js 22.13.0. The committed npm lockfile reproduces the dependency installation, and CI now installs from that lockfile before running the repository contract, TypeScript, and Expo Doctor checks.

The local Expo development server reaches the Metro ready state, and an iOS JS bundle export completes successfully. iOS signing, installation, and real-device launch remain pending Apple Developer enrollment and are not claimed as verified.

An independent rerun on 2026-09-20 (base commit `aeab1c8`) reproduced every local check from a clean `node_modules` state (no `node_modules` directory existed in the checkout before this run) and additionally exercised `npm audit`, an iOS export smoke test, and read-only EAS status. No application code changed as a result; this rerun is documentation/verification only.

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

Initial pass (prior session):

- `npm install`: passed; 474 packages installed and `package-lock.json` generated (committed in `aeab1c8`);
- `npm ci`: passed; clean lockfile install reproduced all 474 packages;
- `npm run typecheck`: passed with no TypeScript errors;
- `npm run doctor`: passed all 21 checks;
- `bash scripts/validate-repository.sh`: passed;
- `npm ls --depth=0`: passed with the expected direct dependencies;
- `npm start -- --offline`: Metro reached `Waiting on http://localhost:8081`, then was stopped after the smoke test;
- tracked-file and credential-pattern checks: no private env file, dependency directory, credential-like file, or high-confidence live-token pattern found.

Independent rerun, 2026-09-20, base commit `aeab1c8`, Node.js 22.13.0, npm 10.9.2:

- `node -v` / `npm -v`: `v22.13.0` / `10.9.2`, matching `.nvmrc` and `engines.node`;
- `npm install`: passed; 474 packages installed. The run rewrote four unrelated `libc` metadata fields on optional `lightningcss-linux-*` packages in `package-lock.json` (an npm-version cosmetic normalization, not a dependency change); that diff was stashed and dropped rather than committed;
- `npm ci` against the already-committed lockfile: passed; 474 packages installed with zero lockfile drift (`git status` clean afterward), confirming the committed lockfile reproduces installation exactly;
- `npm run typecheck`: passed with no TypeScript errors;
- `npm run doctor`: passed 21/21 checks;
- `bash -n scripts/validate-repository.sh`: syntax valid;
- `bash scripts/validate-repository.sh`: passed (`Application-specific CI commands are configured.` / `Repository contract is valid.`);
- `git ls-files`: 47 tracked files reviewed; no `.env*` (other than `.env.example`), `node_modules/`, `ios/`, `android/`, or credential-like filenames tracked;
- `npm ls --depth=0`: passed with the 7 expected direct dependencies (`expo`, `expo-dev-client`, `expo-status-bar`, `react`, `react-native`, `@types/react`, `typescript`);
- `npm audit`: 10 moderate advisories, all rooted in one transitive `uuid@<11.1.1` finding (GHSA-w5hq-g745-h8pq, missing buffer bounds check) pulled in via `xcode` → `@expo/config-plugins` → `@expo/cli`/`@expo/prebuild-config`. This chain is Expo's local native-tooling path (prebuild/CNG), not runtime app code or a user-data path. The only available fix, `npm audit fix --force`, downgrades `expo` to `46.0.21` (a major breaking regression) and was not applied;
- `npx expo start --dev-client --offline` on port 8081: failed non-interactively because port 8081 was already in use by another local process on this machine (environmental, not a repository issue); retried on `--port 8090`: Metro reached `Waiting on http://localhost:8090`, then was stopped;
- `npx expo export --platform ios`: passed; bundled 582 modules into an iOS Hermes bytecode bundle (`1.4MB`) in ~16s, exported outside the repository. This is a JS/bundling smoke test, not a signed build or device launch;
- `npx eas-cli@latest whoami`: authenticated as `trashpandadev` (`tollenschris06@gmail.com`), Owner on `trashpandadev` and `trashpandadevs-team`. Read-only check;
- `npx eas-cli@latest build:list --non-interactive` (before linking): failed with `EAS project not configured`. Codex then linked the project (see below); no build, credential, or device was created;
- `gh auth status`: blocked by session tool permissions; this session did not check GitHub Actions itself (see Codex evidence below).

Evidence supplied by Codex (not independently reproduced by this implementer session):

- Codex ran `eas init --account trashpandadev --non-interactive --no-icon` (authorized by Chris, personal account `trashpandadev`), `eas project:info`, and `eas config --platform ios --profile development --non-interactive`; all succeeded. Project: `@trashpandadev/leaflet`, ID `0dd168ed-e23c-475f-830d-32190618a508`;
- GitHub Actions run `35533800411` for `aeab1c8` (https://github.com/trashpanda-byte/leaflet/actions/runs/35533800411): all steps passed. Commits after `aeab1c8` require a new CI run;
- After the EAS link, Codex re-ran on Node 22.13.0/npm 10.9.2: typecheck, script syntax and validation, Expo Doctor 21/21, and iOS export (582 modules, 1.4MB); all passed;
- Codex scanned 67 historical commits with high-confidence token patterns (0 hits) and 50 tracked files (no private env, generated, or signing-named files).

Final config re-verification after `app.json` update (EAS link + `ios.bundleIdentifier`): see the final rerun recorded in the commit report.

### Known limitations and follow-ups

- The global Windows Node.js installation is newer than the repository-supported major version. `fnm` 1.39.0 is configured for the Windows user and automatically selects Node.js 22.13.0 from `.nvmrc` when entering the repository; on this session's machine, `node`/`npm` on `PATH` already resolved to 22.13.0/10.9.2 without needing to prepend the fnm install path manually.
- `npm audit` still reports 10 moderate advisories; the audit is **not clean**. All trace to one transitive `uuid@<11.1.1` finding (GHSA-w5hq-g745-h8pq, buffer bounds check in v3/v5/v6 when a `buf` argument is supplied) through `xcode` in Expo's local native-tooling chain (prebuild/CNG). Codex noted `xcode/lib/pbxProject.js:90` calls `uuid.v4()` without a provided buffer, so the advisory's affected path does not appear reachable there; this is a scoped reachability assessment, not a fix. The tooling runs on developer/build machines, not in the app runtime. The only offered fix forces a major downgrade to Expo SDK 46 and was not applied. Revisit when Expo ships updated dependencies.
- This session's verification ran in the existing checkout (which had no `node_modules` present beforehand) rather than a literal separate `git clone`, because the session's sandbox only permits access inside this checkout. This closely approximates but is not identical to the unchecked "fresh clone" acceptance criterion below.
- Port 8081 was occupied by an unrelated local process on this machine; the Metro smoke test used port 8090 instead. This is machine-specific, not a repository defect.
- The CI workflow triggers only on `pull_request` events or a `push` to `main`. Codex confirmed run `35533800411` passed for `aeab1c8`; this session did not check GitHub itself, and later commits need a new run.
- The EAS project is linked and EAS CLI is authenticated. iOS device registration, the development build, installation, and real-device Metro launch remain pending Apple Developer activation; no signing credentials, builds, or device registrations exist.
- Apple Developer enrollment is reported pending by Chris; physical iPhone acceptance-criteria items remain unchecked and should not be marked complete until a real device launch is verified.
- Coordination note: during this session the `app.json` EAS link appeared in the working tree. It was Codex's authorized concurrent change (Chris selected the personal `trashpandadev` account), not a side effect of `expo export`. This session briefly reverted it in error, then restored `owner`, `extra.eas.projectId`, and added `ios.bundleIdentifier` `com.trashpandadev.leaflet` (reversible config; no Apple registration or paid build).

### Decisions

No RED decision was made. Application CI uses the existing Node/npm/Expo choices and the repository's `.nvmrc`.

### Review target

`feat/application-foundation` against `main`; final commit SHA to be recorded after commit.

## Independent review

Pending runtime/device verification and handoff.
