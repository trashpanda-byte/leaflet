# Roadmap

This roadmap is ordered by dependency, not by promised date.

## Phase 0 — Verify the mobile development foundation

- Use Expo SDK 57, React Native, TypeScript, npm, and Expo development builds.
- Install dependencies and commit the generated lockfile.
- Verify type checking and Expo Doctor.
- Link an EAS project only when needed to produce the first development build.
- Install and launch the development client on at least one target platform.
- Keep Expo Go non-authoritative so native features can be added later without changing the development model.

## Phase 1 — Reproducible local development

- Make application setup work from a fresh clone.
- Configure local Supabase with versioned migrations and synthetic seed data.
- Establish exact format, lint, typecheck, test, build, and database-reset commands.
- Create `.env.example` from actual variable usage without values.

## Phase 2 — Deterministic Seed foundation

Build as much of the full loop as possible without generative AI:

- define Seed lifecycle and typed domain objects;
- create database schema, constraints, indexes, timestamps, provenance, and reversible state transitions;
- implement ownership and RLS with cross-user denial tests;
- implement Seed creation, update, Hold, Grow-state transitions, and Snip behavior;
- build deterministic category matching, explicit-command parsing, exact lookups, aliases, and reusable learned relationships;
- define confidence and uncertainty states;
- implement typed action schemas and validators;
- record why a Seed was classified or left unresolved;
- expose unresolved cases cleanly instead of pretending confidence.

No model-provider SDK belongs in this phase.

## Phase 3 — Safety and delivery gates

- Add unit, integration, end-to-end, and RLS/security test foundations.
- Replace provisional repository CI with app-specific checks.
- Configure feature branches, required pull-request checks, and preview builds.
- Separate local, preview/staging, and production data and credentials.

## Phase 4 — Prove the core Seed loop

- Capture a Seed in the app.
- Persist it.
- Resolve everything deterministic logic can resolve.
- Show the resulting category/state and Grow / Hold / Snip controls.
- Measure unresolved and correction cases.
- Run the slice through spec → implementation → independent review → remediation → CI → product check → merge.

## Phase 5 — Add AI only for demonstrated gaps

- Review real unresolved cases from the deterministic Seed pipeline.
- Add the provider-agnostic AI gateway.
- Route only irreducibly ambiguous or generative work to the smallest suitable capability.
- Keep model output schema-constrained and untrusted.
- Validate every proposed action with normal code before writing state.
- Track deterministic-resolution rate, model-call reasons, tokens, cost, validation rejection, and correction rate.

## Later

- iOS and Android widget entry points into the same Seed service;
- calendar integration and schedule-aware assistance;
- location-aware context with explicit permissions and privacy controls;
- visual Tree experience;
- social sharing and environmental-impact surfaces;
- deeper learning from confirmed corrections with provenance, reversibility, and privacy controls.
