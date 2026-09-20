# Leaflet status

**Last verified:** 2026-09-20

## Overall state

Leaflet is intentionally starting from scratch. There is no pre-existing application, codebase, database schema, or deployment that needs to be imported or preserved.

The repository operating system is established: product/design rules, engineering constitution, architecture and security boundaries, Claude/Codex roles, task/review templates, and provisional repository checks. The application itself has **not been scaffolded yet**. No claim is made about the app running, application tests passing, Supabase being configured, Vercel previews working, or production readiness.

## Current focus

Select and record the initial application stack, scaffold a minimal reproducible app, and replace provisional setup/CI notes with tested commands.

## Completed in this foundation

- shared product, design, engineering, security, database, and AI rules;
- separate Claude implementation and Codex review responsibilities;
- definition of done, handoff, review, and decision-request formats;
- active-task format and severity model;
- initial durable decisions;
- canonical brand-board and app-icon references;
- repository hygiene and a provisional contract check.

## Health

| Area | State |
|---|---|
| Application code | Not started; greenfield scaffold pending |
| Stack selection | Not yet recorded |
| Design direction | Canonical references committed; implementation pending |
| Local app startup | Not configured |
| Local Supabase | Not initialized |
| Automated app tests | Not configured |
| CI | Provisional repository-contract checks only |
| Preview deployment | Not configured/verified |
| Production | Not created or changed by this repository |
| Known security blockers | No application attack surface exists yet; implementation review pending |

## Waiting on Chris

Nothing is currently blocked on Chris. If stack selection reveals a meaningful vendor, cost, privacy, product, or irreversible tradeoff, the implementation engineer must present a bounded decision request before proceeding with that choice.

## Next

1. Complete Task 0001: select and scaffold the application foundation.
2. Make local setup reproducible from a clean clone.
3. Initialize local Supabase through versioned migrations and synthetic seed data.
4. Add unit, integration, end-to-end, and RLS/security test foundations.
5. Replace provisional CI with commands that exercise the actual app.
6. Build one small vertical slice through the full Claude → Codex workflow.
