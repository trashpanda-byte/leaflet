# Leaflet

Leaflet is a personal thinking system that helps one person turn scattered thoughts into connected ideas, useful questions, plans, and actions without forcing them to organize everything manually.

This repository is also the source of truth for how Leaflet is built. Product decisions, architecture, security boundaries, agent responsibilities, active work, and verified project status belong here—not only in an AI chat history.

## Current repository state

Leaflet is a greenfield project. There is no pre-existing application to import or preserve. The repository currently contains the project operating system—product direction, architecture boundaries, security rules, agent roles, task formats, and repository checks—while the application itself has not been scaffolded yet. See [docs/STATUS.md](docs/STATUS.md).

## Start here

- Product: [docs/PRODUCT.md](docs/PRODUCT.md)
- Design: [docs/DESIGN.md](docs/DESIGN.md)
- Architecture: [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)
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

Application-specific setup commands do not exist yet because the greenfield application has not been scaffolded. Task 0001 will select and record the stack, create the initial app, and replace this section with exact, tested commands for installing dependencies, starting the app, starting local Supabase where applicable, resetting the database, running tests, and building production output.

Never commit `.env.local` or real credentials. Copy `.env.example` only after the application declares the variables it actually uses.
