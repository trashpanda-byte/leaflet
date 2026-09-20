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

```bash
npm install
npm run typecheck
npm run doctor
```

The first `npm install` should create `package-lock.json`. Commit that lockfile before Task 0001 is considered complete.

## Start the development server

After a development client is installed on the device or simulator:

```bash
npm start
```

This runs Metro in development-client mode.

## Create a cloud development build

Install or invoke the current EAS CLI, sign in, and link this repository to an EAS project:

```bash
npx eas-cli@latest login
npx eas-cli@latest init
```

`eas init` writes the EAS project ID into app configuration. Review that change before committing it.

Then build the desired target:

```bash
# Android physical device or emulator
npx eas-cli@latest build --platform android --profile development

# iOS physical device
npx eas-cli@latest build --platform ios --profile development

# iOS Simulator
npx eas-cli@latest build --platform ios --profile development-simulator
```

Install the resulting build, then run `npm start`.

The first physical iOS build can require Apple signing/device-registration steps. Do not create production App Store or Play Store infrastructure as part of this task.

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
