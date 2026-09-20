# Leaflet

Leaflet is a personal thinking system that helps one person turn scattered thoughts into connected ideas, useful questions, plans, and actions without forcing them to organize everything manually.

This repository is also the source of truth for how Leaflet is built. Product decisions, architecture, security boundaries, agent responsibilities, active work, and verified project status belong here—not only in an AI chat history.

## Current repository state

The GitHub repository was empty when this foundation was created. This commit establishes the project operating system; it does **not** claim that the application, database, or test suite has been imported yet. See [docs/STATUS.md](docs/STATUS.md).

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

Application-specific setup commands cannot be documented until the existing Leaflet code is pushed into this repository. Once imported, replace this section with exact, tested commands for installing dependencies, starting the app, starting local Supabase, resetting the database, running tests, and building production output.

Never commit `.env.local` or real credentials. Copy `.env.example` only after the application declares the variables it actually uses.
