# Leaflet

Leaflet is a personal thinking system that helps one person turn scattered thoughts into connected ideas, useful questions, plans, and actions without forcing them to organize everything manually.

This repository is also the source of truth for how Leaflet is built. Product decisions, architecture, security boundaries, agent responsibilities, active work, and verified project status belong here—not only in an AI chat history.

## Current repository state

Leaflet is a greenfield project. Task 0001 is in progress on `feat/application-foundation`: the first Expo/React Native development-build scaffold has been added, but it is not yet considered verified until dependencies are installed, the lockfile is committed, checks pass, and a development client is launched on the iOS device.

The Seed domain is specified and approved as a revisable implementation baseline. Tasks 0002–0006 are queued so the core can be built deterministically and reviewed in small slices before any AI integration.

## Start here

- Product: [docs/PRODUCT.md](docs/PRODUCT.md)
- Seed domain: [docs/SEED_DOMAIN.md](docs/SEED_DOMAIN.md)
- Action contracts: [docs/ACTION_CONTRACTS.md](docs/ACTION_CONTRACTS.md)
- Schedule domain: [docs/SCHEDULE_DOMAIN.md](docs/SCHEDULE_DOMAIN.md)
- Design: [docs/DESIGN.md](docs/DESIGN.md)
- Architecture: [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)
- Database: [docs/DATABASE.md](docs/DATABASE.md)
- Development: [docs/DEVELOPMENT.md](docs/DEVELOPMENT.md)
- AI architecture: [docs/AI_ARCHITECTURE.md](docs/AI_ARCHITECTURE.md)
- Security: [docs/SECURITY.md](docs/SECURITY.md)
- Project status: [docs/STATUS.md](docs/STATUS.md)
- Decisions: [docs/DECISIONS.md](docs/DECISIONS.md)
- Task queue: [tasks/README.md](tasks/README.md)
- Shared engineering rules: [docs/ai/CONSTITUTION.md](docs/ai/CONSTITUTION.md)

## Standard feature loop

1. Chris defines or approves the intended user experience and product rules.
2. Work is placed in `tasks/queued/` until its dependencies are satisfied.
3. The next bounded task moves to `tasks/active/`.
4. Claude implements on a feature branch and records a handoff.
5. Claude performs the required focused cleanup/refactor pass and reruns verification.
6. Codex independently reviews the actual diff, evidence, security, and maintainability.
7. Claude fixes blocking and high-severity findings.
8. CI, preview/device, and product checks pass.
9. The change moves to `tasks/completed/`, is merged, and `docs/STATUS.md` is updated.

## Local setup

Task 0001 targets Expo SDK 57, React Native, TypeScript, npm, and Expo development builds rather than Expo Go as the primary development environment.

After pulling `feat/application-foundation`:

```bash
npm install
npm run typecheck
npm run doctor
```

Then follow [docs/DEVELOPMENT.md](docs/DEVELOPMENT.md) to create/install the iOS development client and start Metro with:

```bash
npm start
```

Do not begin TASK-0002 implementation until TASK-0001 is verified and merged. Seed work then proceeds through the queued deterministic tasks. AI is considered only after TASK-0006 completes the Seed architecture/refactor checkpoint and produces evidence of real unresolved gaps.

Never commit `.env.local` or real credentials.
