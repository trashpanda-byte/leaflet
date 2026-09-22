# TASK-0001 — Select and scaffold the application foundation

| Field | Value |
|---|---|
| Status | in review — device launch confirmed; exact iOS version and merge pending |
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
- [x] A minimal Leaflet development shell starts from a fresh clone using exact README commands (documented alternate Metro port 8090).
- [x] The scaffold follows the product/design constitutions without implementing product features prematurely.
- [x] Type checking and Expo Doctor pass or any remaining issue is explicitly documented.
- [x] App-specific CI is added at the level justified by the current scaffold, or explicitly deferred with a reason.
- [x] No secret values were added to `.env.example`.
- [x] README, architecture, development, roadmap, and status documentation describe the current setup and boundaries.
- [x] The iPhone is registered as required and an iOS development build is created/installed.
- [x] The development client successfully loads the Leaflet shell from Metro on the iPhone.
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

Confirmed done (2026-09-21, per user/Codex-reported EAS output; not reproduced by this session): Apple Developer active, iPhone registered, `com.trashpandadev.leaflet` registered, managed distribution certificate and ad hoc provisioning created, EAS build `1797c499-f96b-4c1f-a808-b08c3af48d1e` submitted (`IN_PROGRESS` at 2026-09-21T19:29Z).

Codex subsequently confirmed build success through EAS `build:view`: `FINISHED` at `2026-09-21T19:33:01.369Z`, with an installable IPA artifact.

Still required (not yet verified):

- install the iOS development client on the iPhone;
- launch the scaffold from Metro on the iPhone;
- record device model/iOS version, build ID, installation, and observed Leaflet shell in the handoff;
- rerun relevant checks after any additional configuration change.

## Implementation handoff

### Implementation summary

The Windows local-development setup is verified with Node.js 22.13.0. The committed npm lockfile reproduces the dependency installation, and CI now installs from that lockfile before running the repository contract, TypeScript, and Expo Doctor checks.

The local Expo development server reaches the Metro ready state, and an iOS JS bundle export completes successfully. Apple registration and signing are now confirmed and the EAS iOS development build finished successfully (see below), but installation and real-device launch are not claimed as verified.

Claude's implementation rerun on 2026-09-20 (base commit `aeab1c8`) reproduced the local checks in a fresh clone created by Codex, with no pre-existing `node_modules`. It additionally exercised `npm audit`, an iOS export smoke test, and read-only EAS status. The follow-up linked EAS, configured the development iOS bundle identifier, and corrected setup documentation. Application UI code did not change.

### Changed files

- previously committed in `aeab1c8`: `package-lock.json`, `.github/workflows/repository-contract.yml`, and `scripts/validate-repository.sh`;
- `5a5b72b`: EAS project link and iOS bundle identifier in `app.json`;
- `55eedaf`: README, development, architecture, roadmap, status, and this task's setup/evidence corrections;
- review follow-up: this task, status, and `docs/ai/reviews/TASK-0001.md`;
- Apple/EAS build follow-up: `app.json` (`ios.infoPlist.ITSAppUsesNonExemptEncryption=false`), `docs/STATUS.md`, `docs/ARCHITECTURE.md`, `docs/DEVELOPMENT.md`, and this task.

### Refactor and architecture pass

Claude inspected the scaffold and configuration; Codex independently inspected `App.tsx`, `index.ts`, TypeScript/app/EAS/package configuration, the validation script, and CI. No material code refactor was needed: the shell is small, has no duplicated domain logic, and introduces no speculative abstraction or new dependency. Cleanup removed stale installation/linking instructions and corrected verification claims. The lockfile's cosmetic npm metadata churn was discarded; no template subsystem or unrelated refactor was added. Typecheck, Doctor, and repository validation were rerun after final configuration. TASK-0006 remains the later Seed architecture checkpoint; no foundation refactor task is needed before TASK-0002 once the device/merge gates pass.

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

Claude implementation rerun, 2026-09-20, base commit `aeab1c8`, Node.js 22.13.0, npm 10.9.2:

- `node -v` / `npm -v`: `v22.13.0` / `10.9.2`, matching `.nvmrc` and `engines.node`;
- `npm install`: passed; 474 packages installed. The run rewrote four unrelated `libc` metadata fields on optional `lightningcss-linux-*` packages in `package-lock.json` (an npm-version cosmetic normalization, not a dependency change); that diff was stashed and dropped rather than committed;
- `npm ci` against the already-committed lockfile: passed; 474 packages installed with zero lockfile drift (`git status` clean afterward), confirming the committed lockfile reproduces installation exactly;
- `npm run typecheck`: passed with no TypeScript errors;
- `npm run doctor`: passed 21/21 checks;
- `bash -n scripts/validate-repository.sh`: syntax valid;
- `bash scripts/validate-repository.sh`: passed (`Application-specific CI commands are configured.` / `Repository contract is valid.`);
- `git ls-files`: tracked filenames reviewed; Codex independently counted 50 files at `aeab1c8`; no private `.env*` (other than `.env.example`), `node_modules/`, `ios/`, `android/`, or credential-like filenames tracked;
- `npm ls --depth=0`: passed with the 7 expected direct dependencies (`expo`, `expo-dev-client`, `expo-status-bar`, `react`, `react-native`, `@types/react`, `typescript`);
- `npm audit`: 10 moderate advisories, all rooted in one transitive `uuid@<11.1.1` finding (GHSA-w5hq-g745-h8pq, missing buffer bounds check) pulled in via `xcode` → `@expo/config-plugins` → `@expo/cli`/`@expo/prebuild-config`. This chain is Expo's local native-tooling path (prebuild/CNG), not runtime app code or a user-data path. The only available fix, `npm audit fix --force`, downgrades `expo` to `46.0.21` (a major breaking regression) and was not applied;
- `npx expo start --dev-client --offline` on port 8081: failed non-interactively because port 8081 was already in use by another local process on this machine (environmental, not a repository issue); retried on `--port 8090`: Metro reached `Waiting on http://localhost:8090`, then was stopped;
- `npx expo export --platform ios`: passed; bundled 582 modules into an iOS Hermes bytecode bundle (`1.4MB`) in ~16s, exported outside the repository. This is a JS/bundling smoke test, not a signed build or device launch;
- `npx eas-cli@latest whoami`: authenticated as `trashpandadev`, Owner on `trashpandadev` and `trashpandadevs-team`. Read-only check;
- `npx eas-cli@latest build:list --non-interactive` (before linking): failed with `EAS project not configured`. Codex then linked the project (see below); no build, credential, or device was created;
- `gh auth status`: blocked by session tool permissions; this session did not check GitHub Actions itself (see Codex evidence below).

Evidence supplied by Codex (not independently reproduced by this implementer session):

- Codex ran `eas init --account trashpandadev --non-interactive --no-icon` (authorized by Chris, personal account `trashpandadev`), `eas project:info`, and `eas config --platform ios --profile development --non-interactive`; all succeeded. Project: `@trashpandadev/leaflet`, ID `0dd168ed-e23c-475f-830d-32190618a508`;
- GitHub Actions run `35533800411` for `aeab1c8` (https://github.com/trashpanda-byte/leaflet/actions/runs/35533800411): all steps passed. Commits after `aeab1c8` require a new CI run;
- Codex separately ran on Node 22.13.0/npm 10.9.2: typecheck, script syntax and validation, and Expo Doctor 21/21; all passed. Codex also reran iOS export after EAS linking (582 modules, 1.4MB);
- Codex scanned 67 historical commits with high-confidence token patterns (0 hits) and 50 tracked files (no private env, generated, or signing-named files).

Final config re-verification after `app.json` update (EAS link + `ios.bundleIdentifier`): Claude reran typecheck, Expo Doctor (21/21), and repository validation successfully before `5a5b72b`/`55eedaf`. Codex inspected that command output and independently checked final EAS configuration and iOS export. GitHub Actions [run 35535508313](https://github.com/trashpanda-byte/leaflet/actions/runs/35535508313) passed for `55eedaf`; subsequent review documentation gets a separate CI run linked on PR #3. See `docs/ai/reviews/TASK-0001.md`.

### Known limitations and follow-ups

- The global Windows Node.js installation is newer than the repository-supported major version. `fnm` 1.39.0 is configured for the Windows user and automatically selects Node.js 22.13.0 from `.nvmrc` when entering the repository; on this session's machine, `node`/`npm` on `PATH` already resolved to 22.13.0/10.9.2 without needing to prepend the fnm install path manually.
- `npm audit` still reports 10 moderate advisories; the audit is **not clean**. All trace to one transitive `uuid@<11.1.1` finding (GHSA-w5hq-g745-h8pq, buffer bounds check in v3/v5/v6 when a `buf` argument is supplied) through `xcode` in Expo's local native-tooling chain (prebuild/CNG). Codex noted `xcode/lib/pbxProject.js:90` calls `uuid.v4()` without a provided buffer, so the advisory's affected path does not appear reachable there; this is a scoped reachability assessment, not a fix. The tooling runs on developer/build machines, not in the app runtime. The only offered fix forces a major downgrade to Expo SDK 46 and was not applied. Revisit when Expo ships updated dependencies.
- Codex created this checkout using `git clone --branch feat/application-foundation https://github.com/trashpanda-byte/leaflet.git leaflet` before Claude ran installation. Fresh-clone dependency/setup verification is therefore real. The combined fresh-clone/device criterion remains unchecked because no device launch occurred.
- Port 8081 was occupied by an unrelated local process on this machine; the Metro smoke test used port 8090 instead. This is machine-specific, not a repository defect.
- The CI workflow triggers only on `pull_request` events or a `push` to `main`. Codex confirmed run `35533800411` passed for `aeab1c8`; this session did not check GitHub itself, and later commits need a new run.
- The EAS project is linked. After the user reported Apple Developer active, EAS (run by Codex/the user, not this session) restored the Apple session, registered `com.trashpandadev.leaflet`, generated a managed distribution certificate, and created active ad hoc provisioning for the registered iPhone. No secrets, UDID, or certificate details are stored in the repository.
- EAS build `1797c499-f96b-4c1f-a808-b08c3af48d1e` (development/internal iOS, version 0.1.0, build 1; https://expo.dev/accounts/trashpandadev/projects/leaflet/builds/1797c499-f96b-4c1f-a808-b08c3af48d1e) was `IN_PROGRESS` at 2026-09-21T19:29Z. Codex subsequently confirmed `FINISHED` at 2026-09-21T19:33:01.369Z and an IPA artifact. Installation and real-device Metro launch are **not verified**; the combined device criteria stay unchecked. Codex owns build polling and Metro verification.
- Build source attribution: EAS uploaded source at HEAD `6f5478f` plus an uncommitted, EAS-generated `app.json` change adding `ios.infoPlist.ITSAppUsesNonExemptEncryption=false` (this data-free shell has no custom encryption). That diff is authorized, was inspected by this session, and is committed alongside this evidence so the repository matches what was built. Revisit the flag when encryption-bearing features are added.
- Coordination note: during this session the `app.json` EAS link appeared in the working tree. It was Codex's authorized concurrent change (Chris selected the personal `trashpandadev` account), not a side effect of `expo export`. This session briefly reverted it in error, then restored `owner`, `extra.eas.projectId`, and added `ios.bundleIdentifier` `com.trashpandadev.leaflet` (reversible config; no Apple registration or paid build).

### Decisions

2026-09-20: Chris selected the personal `trashpandadev` EAS account before project creation/linking. The development bundle identifier `com.trashpandadev.leaflet` was a reversible configuration choice; no Apple identifier registration was performed in that pass. Application CI uses the existing Node/npm/Expo choices and the repository's `.nvmrc`.

2026-09-21: after Chris confirmed Apple activation and requested the device build, Codex registered that identifier, generated EAS-managed signing credentials, and submitted the internal development build for the supplied registered iPhone. No App Store submission or production release was performed. EAS added `ITSAppUsesNonExemptEncryption=false` for the current shell; reassess when encryption-bearing functionality changes.

### 2026-09-21 signing follow-up verification

Claude implemented configuration/documentation commit `1a02870e3254cf696f42ea4075d3666417f55dec`. Codex reviewed the actual diff and inspected Claude's command output: `npm run typecheck` passed, `npm run doctor` passed 21/21, and `bash scripts/validate-repository.sh` passed. `git diff --check HEAD~1..HEAD` passed. The only runtime configuration change is the EAS-generated encryption declaration; no product/domain code changed.

Codex ran `npx eas-cli@latest device:list --apple-team-id <selected-team> --non-interactive --json`, confirmed the supplied iPhone is enabled, and ran `npx eas-cli@latest build --platform ios --profile development --no-wait`. EAS confirmed identifier registration, managed certificate/profile creation, the selected device, and source upload. `npx eas-cli@latest build:view 1797c499-f96b-4c1f-a808-b08c3af48d1e --json` is the authoritative build-status check. Device identifiers and credential material are deliberately omitted from this record.

Codex started `node node_modules/expo/bin/cli start --dev-client --lan --port 8090`; Metro reached its ready state. An HTTP request to its `/status` endpoint returned `packager-status:running`. Neither result proves a phone has connected or rendered the app.

### Review target

`feat/application-foundation` at `55eedaf982d797b7a7254e9e2e47c490914ac83c` against `main` (`726373931b72259ffb708d879e6aee9964c60b57`), including configuration commit `5a5b72b33a6e5dd20949951c7ad3e9fe0dbe88b5`. Subsequent review records change documentation only.

## Independent review

### 2026-09-22 device confirmation and readiness update

Chris reports that the installed Leaflet app opens on his iPhone 15 and shows `Leaflet Development foundation` and `Expo development client ready to configure`. That is the expected static shell, not a setup error. This is user-reported physical-device evidence; Codex did not directly inspect the phone. Exact iOS version has been requested; `latest` is not recorded as a numeric version. The final handoff checkbox remains open until that metadata is supplied.

Codex independently observed the running Metro session complete `iOS Bundled 15755ms index.ts (707 modules)` and its `/status` endpoint return `packager-status:running`. The signed build remains `1797c499-f96b-4c1f-a808-b08c3af48d1e` (0.1.0, build 1). Today, `npm run typecheck`, `npm run doctor` (21/21), and `bash scripts/validate-repository.sh` passed on Node 22.13.0/npm 10.9.2. Claude authentication is valid. `npm audit --json` still returns 10 moderate / 0 high / 0 critical findings. The user-supplied device identifier is not tracked.

PR #3 remains unmerged. Do not start TASK-0002 implementation yet. Its local database prerequisite also needs preparation: neither Docker nor Podman was found on PATH; standard Docker installation paths and installed-app entries were absent; `wsl --status` reports WSL is not installed. Supabase CLI is not installed in this repository. A working Docker-compatible runtime and a pinned CLI must be established before local database/RLS verification. No database or OS installation was performed during this readiness review.

Workflow: Claude remains the implementation owner; Codex reviews completed commits independently. This checkout is the current GitHub-linked repository. The older `leaflet-codex` clone points to a different local repository and must not be mistaken for this project. Do not allow simultaneous edits to the same files; use separate checkouts for concurrent implementation/review and exchange exact commits. No new product architecture or extra agent framework is needed to start the queued work once the recorded gates are satisfied.

The following review paragraph is historical; this dated update supersedes its missing-device-launch statement.

Codex reviewed the actual diff, surrounding scaffold, Claude's command output, and independently reran checks. See [review evidence](../../docs/ai/reviews/TASK-0001.md). Local foundation scope: PASS, no BLOCKING/HIGH code findings. Overall task: INCOMPLETE REVIEW until the signed physical-iPhone development build and launch evidence exist. Keep PR #3 draft; do not merge or begin TASK-0002 yet.
