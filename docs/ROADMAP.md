# Roadmap

This roadmap is ordered by dependency, not by promised date.

## Phase 0 — Select and scaffold the application foundation

- Define the smallest first vertical slice that proves the product and technical workflow.
- Select and record the framework, package manager, runtime versions, repository layout, and initial service boundaries.
- Scaffold the application from clean, supported tooling rather than inheriting an unknown template.
- Initialize local development, test foundations, and configuration templates without production credentials.
- Record exact commands and the reasoning behind choices that will be costly to change later.

## Phase 1 — Reproducible local development

- Make application setup work from a fresh clone.
- Configure local Supabase with versioned migrations and synthetic seed data.
- Establish exact format, lint, typecheck, test, build, and database-reset commands.
- Create `.env.example` from actual variable usage without values.

## Phase 2 — Safety and delivery gates

- Add unit, integration, end-to-end, and RLS/security test foundations.
- Replace provisional repository CI with app-specific checks.
- Configure feature branches, required pull-request checks, and preview deployments.
- Separate local, preview/staging, and production data and credentials.

## Phase 3 — Prove the collaboration loop

- Select one small, low-risk feature.
- Run it through spec → Claude implementation → Codex review → remediation → CI → preview → product check → merge.
- Record friction and automate only repeated, well-understood steps.

## Phase 4 — Deterministic Leaflet foundation

- Implement typed intents/actions, context retrieval, rules/parsers, semantic aliases, and the AI gateway.
- Add action validation, confidence/confirmation policy, cost budgets, and deterministic-resolution telemetry.
- Introduce provider-agnostic capability routing only when a product feature truly requires AI.

## Later

- Add carefully scoped hooks and specialist agents.
- Expand integrations only when a validated user flow needs them.
- Improve learning from corrections with provenance, reversibility, and privacy controls.
