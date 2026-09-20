# Leaflet status

**Last verified:** 2026-09-20

## Overall state

The GitHub repository is reachable but contained no commits or application files when the project foundation was created. The repository operating system now exists locally: product/design rules, engineering constitution, architecture and security boundaries, Claude/Codex roles, task/review templates, and provisional repository checks.

The Leaflet application itself has **not** been imported or verified in this repository. No claim is made about the app running, tests passing, Supabase being reproducible, Vercel previews working, or production readiness.

## Current focus

Get the existing Leaflet code from Chris's PC into this repository, then perform a real inventory and replace provisional setup/CI notes with tested commands.

## Completed in this foundation

- shared product, design, engineering, security, database, and AI rules;
- separate Claude implementation and Codex review responsibilities;
- definition of done, handoff, review, and decision-request formats;
- active-task format and severity model;
- initial durable decisions;
- repository hygiene and a provisional contract check.

## Health

| Area | State |
|---|---|
| Application code | Not present in repository |
| Local app startup | Not testable |
| Local Supabase | Not present / not testable |
| Automated app tests | Not present |
| CI | Provisional repository-contract checks only |
| Preview deployment | Not configured/verified |
| Production | Not inspected or changed |
| Known security blockers | Cannot assess app until code is imported |

## Waiting on Chris

Push the current Leaflet project files from the PC to `trashpanda-byte/leaflet`, or make them available in the same workspace. Do not include `.env.local`, API keys, database passwords, or other secrets.

## Next

1. Import and inventory the application.
2. Detect and document the real toolchain.
3. Make local setup reproducible from a clean clone.
4. Reconcile the existing Supabase schema into migrations with RLS tests.
5. Replace provisional CI with commands that exercise the actual app.
