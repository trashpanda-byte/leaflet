# Development

## Foundation

Leaflet uses Expo SDK 57, React Native, TypeScript, npm, and Expo development builds.

Expo Go is not a compatibility target. It may remain useful for very early smoke checks, but native-capability work is developed against a project-specific development client so widgets, notifications, location, calendar access, and other native integrations can be added without changing the development model later.

Native `ios/` and `android/` directories are generated through Expo Continuous Native Generation (CNG) and are not the source of truth. App configuration and config plugins are committed; native projects can be regenerated with `npm run prebuild:clean`.

## Prerequisites

- Node.js 22.13.x or newer within Node 22
- npm
- Git
- An Expo account for EAS cloud builds
- For local Android builds: Android Studio / Android SDK
- For local iOS builds: macOS with a compatible Xcode version

## First local setup

Select Node.js 22.13.0 (`.nvmrc`). On Windows with `fnm`: `fnm install 22.13.0` once, then `fnm use` in the repository (or prepend the version's `installation` directory to `PATH`). Confirm with `node -v`.

```bash
npm ci
npm run typecheck
npm run doctor
bash scripts/validate-repository.sh
```

`package-lock.json` is committed; use `npm ci` for reproducible setup and CI parity. Use `npm install` only when intentionally changing dependencies, and commit the resulting lockfile change. Note that a different npm version may cosmetically rewrite optional-package metadata (for example `libc` fields); do not commit such churn on its own.

## Start the development server

After a development client is installed on the device or simulator:

```bash
npm start
```

This runs Metro in development-client mode.

## Create a cloud development build

The repository is already linked to the EAS project `@trashpandadev/leaflet` (ID `0dd168ed-e23c-475f-830d-32190618a508`, owner `trashpandadev`, both in `app.json`); do not run `eas init` again. Sign in with `npx eas-cli@latest login` if needed and confirm with `npx eas-cli@latest whoami`. The development iOS bundle identifier is `com.trashpandadev.leaflet`.

Apple Developer is active. The registered iPhone, `com.trashpandadev.leaflet`, the managed distribution certificate, and the ad hoc provisioning profile exist in EAS (never commit UDIDs or certificate details). The first development/internal iOS build (`1797c499-f96b-4c1f-a808-b08c3af48d1e`, version 0.1.0, build 1) was `IN_PROGRESS` as of 2026-09-21T19:29Z. It was built from the committed source plus the `ITSAppUsesNonExemptEncryption=false` `infoPlist` entry that EAS generated in `app.json`.

Remaining steps (not yet verified):

1. Confirm the EAS build finishes successfully.
2. Install the build on the registered iPhone.
3. Run `npm start` and confirm the development client loads the Leaflet shell from Metro.
4. Record device model/iOS version, build ID, and the observed result in the TASK-0001 handoff.

Build targets:

```bash
# Android physical device or emulator
npx eas-cli@latest build --platform android --profile development

# iOS physical device
npx eas-cli@latest build --platform ios --profile development

# iOS Simulator
npx eas-cli@latest build --platform ios --profile development-simulator
```

Install the resulting build, then run `npm start`.

Additional physical devices require their own registration and a new ad hoc provisioning profile. Do not create production App Store or Play Store infrastructure as part of this task.

## Local native build option

When the required platform SDK is installed locally:

```bash
npm run prebuild:clean
npm run android
```

On macOS, iOS can be built locally with:

```bash
npm run prebuild:clean
npm run ios
```

Re-run a clean prebuild after adding or changing a native dependency or config plugin.

## Current boundary

This foundation intentionally contains no Supabase client, authentication, Seed schema, classification engine, or model-provider integration. The next product work should build the deterministic data and application logic first; AI integration comes only after unresolved cases are observable and justified.
