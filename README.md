# Leaflet

Leaflet is a personal thinking system that helps one person turn scattered thoughts into connected ideas, useful questions, plans, and actions without forcing them to organize everything manually.

This repository is also the source of truth for how Leaflet is built. Product decisions, architecture, security boundaries, agent responsibilities, active work, and verified project status belong here—not only in an AI chat history.

## Current repository state

Leaflet is a greenfield project. Task 0001 is now in progress on `feat/application-foundation`: the first Expo/React Native development-build scaffold has been added, but it is not yet considered verified until dependencies are installed, the lockfile is committed, checks pass, and a development client is launched on a real device or simulator. See [docs/STATUS.md](docs/STATUS.md).

## Start here

- Product: [docs/PRODUCT.md](docs/PRODUCT.md)
- Design: [docs/DESIGN.md](docs/DESIGN.md)
- Architecture: [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)
- Development: [docs/DEVELOPMENT.md](docs/DEVELOPMENT.md)
- AI architecture: [docs/AI_ARCHITECTURE.md](docs/AI_ARCHITECTURE.md)
- Security: [docs/SECURITY.md](docs/SECURITY.md)
- Project status: [docs/STATUS.md](docs/STATUS.md)
- Decisions: [docs/DECISIONS.md](docs/DECISIONS.md)
- Shared engineering rules: [docs/ai/CONSTITUTION.md](docs/ai/CONSTITUTION.md)

## Standard feature loop

1. Chris defines the intended user experience and resolves product decisions.
2. A task is created from [tasks/TEMPLATE.md](tasks/TEMPLATE.md).
3. Claude implements on a feature branch and records a handoff.
4. Codex independently reviews the actual diff and verification evidence.
5. Claude fixes blocking and high-severity findings.
6. CI, preview, and product checks pass.
7. The change is merged and `docs/STATUS.md` is updated.

## Local setup

Task 0001 currently targets Expo SDK 57, React Native, TypeScript, npm, and Expo development builds rather than Expo Go as the primary development environment.

After pulling `feat/application-foundation`:

```bash
npm install
npm run typecheck
npm run doctor
```

Then follow [docs/DEVELOPMENT.md](docs/DEVELOPMENT.md) to create or install the development client and start Metro with:

```bash
npm start
```

Do not begin Seed/AI feature work until the development build is verified. After that, Leaflet will implement the Seed loop as database and deterministic application logic first. AI integration remains a later fallback for cases that cannot be resolved reliably in code.

Never commit `.env.local` or real credentials.
