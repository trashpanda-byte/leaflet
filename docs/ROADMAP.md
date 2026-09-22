# Roadmap

This roadmap is ordered by dependency, not by promised date.

## Phase 0 — Verify the mobile development foundation

- Use Expo SDK 57, React Native, TypeScript, npm, and Expo development builds.
- Install from the committed lockfile with `npm ci`.
- Verify type checking and Expo Doctor.
- The EAS project is linked; register the device and produce the first development build after Apple Developer activation.
- Install and launch the development client on the iOS device.
- Keep Expo Go non-authoritative so native features can be added later without changing the development model.

## Phase 1 — Seed persistence foundation (TASK-0002)

- Initialize local Supabase with versioned migrations and synthetic seed data.
- Preserve original Seed provenance.
- Establish idempotent creation/retry behavior.
- Enforce RLS and cross-user denial.
- Keep derived-object and many-to-many relationship paths open without building a generic graph engine.
- Add the first real integration/security test foundation.

## Phase 2 — Seed lifecycle and reversible actions (TASK-0003)

- Implement Active / Held / Resolved / Snipped behavior.
- Keep Grow as an action/intent rather than a lifecycle state.
- Add Snip/Undo semantics without claiming permanent erasure before retention policy is defined.
- Add typed ordinary reversible action handling.
- Keep ambiguous commitment language from creating Tasks/Events.

## Phase 3 — Deterministic organization and relationships (TASK-0004)

- Resolve exact/rule/confirmed learned matches.
- Leave ambiguity unresolved.
- Reuse existing broad structure before creating new categories.
- Support multiple relationships and optional primary home.
- Learn narrowly from explicit corrections.
- Link similar information; do not automatically merge it.
- Measure resolution mechanisms and correction/unresolved cases without logging raw Seed text.

## Phase 4 — Mobile Seed capture vertical slice (TASK-0005)

- Capture a Seed in the iOS development build.
- Persist and process it through the deterministic pipeline.
- Show brief organization/action results.
- Expose Grow / Hold / Snip where appropriate.
- Show direct result + Undo for clear reversible commands.
- Exercise ambiguous input and retry behavior through the real mobile experience.

## Phase 5 — Required Seed architecture checkpoint (TASK-0006)

- Review persistence, lifecycle, action, organization, relationship, validation, and capture boundaries together.
- Remove accidental duplication and temporary code.
- Consolidate only proven abstractions.
- Verify unresolved is a first-class safe outcome.
- Produce evidence describing what the deterministic system still cannot solve reliably.
- Complete independent Codex architecture review.

**No AI feature work begins before this checkpoint is complete.**

## Phase 6 — Internal Schedule domain (TASK-0007)

- Implement a provider-neutral Schedule service and internal Event model.
- Consume typed `create_event` ActionIntents from the Seed core.
- Preserve Seed/action provenance.
- Keep timezone, validation, ownership, retry, and Undo behavior in normal code.
- Keep Google/Apple/provider state outside the core Event.

## Phase 7 — External calendar adapters

After the internal Schedule domain is reviewed:

- add provider mapping/sync state behind adapters;
- begin with the calendar integration that best matches validated user need;
- define conflict resolution and one-way/two-way sync policy before enabling writes;
- keep Seed processing and Leaflet-native scheduling independent of provider availability.

## Phase 8 — AI only for demonstrated gaps

- Review real unresolved/correction evidence from the deterministic Seed pipeline.
- Perform an AI Necessity Review for each proposed capability.
- Add a provider-agnostic AI gateway only where justified.
- Route only irreducibly ambiguous/generative work to the smallest suitable capability.
- Keep model output schema-constrained and untrusted.
- Validate every proposed action with normal code before writing state.
- Track deterministic resolution, model-call reasons, tokens/cost, validation rejection, and correction rate.

## Later

- iOS and Android widget entry points into the same Seed service;
- richer schedule-aware assistance, recurrence, availability, and rescheduling;
- location-aware context with explicit permissions and privacy controls;
- visual Tree experience;
- social sharing and environmental-impact surfaces;
- deeper learning from confirmed corrections with provenance, reversibility, and privacy controls.
