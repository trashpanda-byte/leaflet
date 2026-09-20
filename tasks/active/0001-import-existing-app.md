# TASK-0001 — Import and inventory the existing application

| Field | Value |
|---|---|
| Status | blocked |
| Owner | Chris / implementation engineer |
| Reviewer | Codex |
| Branch | `chore/import-existing-app` (recommended) |
| Risk | high |

## Why

The GitHub repository was empty when the engineering foundation was created. The existing Leaflet code on Chris's PC must become available in the repository before its setup, database, tests, security, or deployments can be inspected and made reproducible.

## Expected experience

A fresh authorized clone contains the application and can follow exact documented commands toward local startup. No secret or real user data is introduced.

## Acceptance criteria

- [ ] Existing Leaflet source and required configuration templates are committed.
- [ ] `.env.local`, credentials, build output, dependencies, and real user data are excluded.
- [ ] Framework, package manager, runtime versions, major directories, and external services are inventoried.
- [ ] Current install, development, build, lint, typecheck, and test commands are recorded as verified, missing, or failing.
- [ ] Existing Supabase schema/migrations and Vercel configuration are inventoried without changing production.
- [ ] Secret scan and dependency inventory are performed.
- [ ] `README.md`, `docs/ARCHITECTURE.md`, `.env.example`, and `docs/STATUS.md` reflect verified reality.
- [ ] App-specific CI replaces or extends provisional contract checks.

## Out of scope

- redesigning application architecture;
- fixing every discovered bug;
- production migrations or deployments;
- adding model calls or new product behavior.

## Product decisions

No RED decision is currently required. Preserve the existing application and report conflicts rather than silently redesigning it during import.

## Technical notes

Before pushing from the PC, inspect staged files and confirm no `.env*` file other than `.env.example` is tracked. Prefer a feature branch if the code already has meaningful history elsewhere; preserve that history rather than copying files when practical.

## AI necessity review

No model behavior changes.

## Security and data review

The main risks are committed credentials, copied production data, unknown privileged Supabase keys, and unreviewed deployment configuration. Do not connect to or mutate production during inventory.

## Verification plan

- Review `git status` and `git diff --cached` before commit.
- Run the repository contract check.
- Search tracked content for credential signatures without printing secret values.
- After import, run every discovered project command and record its actual result.

## Blocker

The existing Leaflet project files are not available in this repository/workspace yet.
