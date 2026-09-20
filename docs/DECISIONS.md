# Decision log

Record durable product and architecture choices here. Append entries; do not rewrite history without explicitly superseding an earlier decision.

## 2026-09-20 — Leaflet is a greenfield build

**Decision:** Leaflet has no pre-existing application, database schema, or deployment to import or preserve. Implementation starts from a deliberately selected and documented foundation.

**Reason:** The earlier repository status incorrectly assumed a local build existed on Chris's PC.

**Consequence:** Task 0001 selects and scaffolds the initial stack. Documentation must not refer to importing, recovering, or reconciling an existing Leaflet implementation.

**Revisit when:** Never as a historical fact; future implementation state should be documented as it is created.

## 2026-09-20 — Deterministic-first AI

**Decision:** Leaflet uses application logic, structured state, rules, parsing, purpose-built search, cached results, and confirmed relationships before generative AI.

**Reason:** This improves speed, cost, privacy, predictability, and reliability while reserving AI for ambiguity and cognition.

**Consequence:** Every model call requires an AI Necessity Review and deterministic validation of typed output.

**Revisit when:** Evidence shows a specific deterministic path causes worse user outcomes than an appropriately bounded model capability.

## 2026-09-20 — Models propose; code acts

**Decision:** Models cannot directly modify important state. They propose allowlisted structured actions that code validates and executes or presents for confirmation.

**Reason:** Model fluency is not proof of authorization or correctness.

**Consequence:** Action schemas, validators, permission checks, and uncertainty policies are required before model-driven writes.

## 2026-09-20 — Repository as shared source of truth

**Decision:** Claude, Codex, humans, and CI coordinate through versioned repository artifacts rather than relying on chat memory.

**Reason:** Files, diffs, tests, decisions, and status are inspectable and reproducible across sessions.

**Consequence:** Meaningful changes update the appropriate task, documentation, and status.

## 2026-09-20 — Separate implementer and reviewer roles

**Decision:** Claude is normally the primary implementation engineer; Codex is normally the independent reviewer.

**Reason:** Separate incentives reduce self-review blind spots.

**Consequence:** Codex does not modify code during review unless explicitly assigned remediation.

## 2026-09-20 — RLS required for user-owned Supabase data

**Decision:** Every user-owned table exposed through Supabase APIs requires RLS, explicit policies, and negative cross-user tests.

**Reason:** Application-layer filters alone are not a sufficient tenant-isolation boundary.

**Consequence:** A table is not complete merely because automatic RLS is enabled; policies and tests must be reviewed.

## 2026-09-20 — Current visual direction

**Decision:** Leaflet's visual identity is green, calm, organic, playful, warm, slightly retro, and minimally cluttered. The character uses restrained scrap-metal construction, a green retro display, and a living leaf emerging from a forehead crack.

**Reason:** This direction was explicitly selected during product design exploration.

**Consequence:** New design work follows `docs/DESIGN.md` unless Chris changes the direction.

## 2026-09-20 — Clean organic brand system supersedes the retro character direction

**Decision:** The committed brand board and app-icon reference in `docs/assets/design/` are Leaflet's canonical visual direction. Leaflet uses a Forest Green and Mint Cream foundation, rounded typography, clean organic components, and a simplified sprouting companion. This supersedes the earlier pixel-art, scrap-metal, exposed-bolt, and green-screen character details recorded above.

**Reason:** Chris selected the new reference images as the product's design direction after reviewing the earlier character concept.

**Consequence:** New design and implementation follow the visual rules and reference scope in `docs/DESIGN.md`. Copy, navigation labels, feature names, dates, and metrics inside the board remain illustrative unless approved separately as product behavior.

**Revisit when:** Chris approves a replacement visual system or a specific implementation constraint requires an explicit, recorded adjustment.

## 2026-09-20 — Expo development builds are the mobile development baseline

**Decision:** Leaflet uses Expo SDK 57, React Native, TypeScript, npm, and project-specific Expo development builds. Expo Go is not a compatibility requirement.

**Reason:** Leaflet targets iOS and Android and is expected to need native widgets, notifications, location, calendar access, and other capabilities that should fit the normal development environment rather than force a later migration away from Expo Go.

**Consequence:** Native-capability work is tested in development clients. Generated native projects remain reproducible through Expo CNG unless a future requirement justifies committing native projects.

**Revisit when:** A required native capability cannot be supported cleanly through Expo modules/config plugins or the cost of CNG outweighs its benefits.

## 2026-09-20 — Build the Seed loop deterministically before integrating AI

**Decision:** The first Seed implementation will maximize database constraints, typed domain logic, state machines, parsers, exact/fuzzy lookups, aliases, action validators, RLS, and explicit unresolved states before any model-provider SDK or LLM call is added.

**Reason:** Leaflet's product and environmental thesis depends on avoiding unnecessary generative inference. We need to observe what the deterministic system actually cannot resolve before deciding what AI capability is necessary.

**Consequence:** AI is not part of the initial Seed pipeline milestone. Unresolved cases are recorded and surfaced safely rather than automatically routed to a model. Later AI work must be justified by those measured gaps and remain a bounded fallback.

**Revisit when:** The deterministic Seed loop is working end-to-end and real unresolved/correction cases demonstrate a specific need for model inference.

## 2026-09-20 — Refactor at proven boundaries and architecture checkpoints

**Decision:** Leaflet uses deliberate refactor passes rather than continuous cleanup or large late-stage rewrites. Implement the simplest correct solution first, clean the changed area before handoff, abstract only after repetition or coupling is proven, and perform broader architecture reviews before major new subsystems are layered on top.

**Reason:** Premature abstraction creates complexity before the problem is understood, while delaying all cleanup allows technical debt to compound. Timed cleanup gives the team enough real code to see the correct structure without letting poor structure become permanent.

**Consequence:** Claude performs a focused cleanup pass before handoff; Codex reviews maintainability and architecture hygiene explicitly; tasks identify architecture checkpoints; large unrelated refactors normally receive their own task/PR; verification is rerun after structural changes.

**Examples of architecture checkpoints:** deterministic Seed pipeline before AI fallback, scheduling core before external calendar integrations, context engine before location-aware behavior, and shared app/domain core before platform-specific widgets.

**Revisit when:** The workflow creates excessive churn, slows delivery without measurable quality benefit, or repeated defects show the checkpoints are too infrequent.


## 2026-09-20 — Seed domain baseline approved as revisable implementation contract

**Decision:** The rules in `docs/SEED_DOMAIN.md` are approved as the implementation baseline for the Seed core. Key rules include universal Seed capture, preserved original provenance, separate derived objects, many-to-many relationships, explicit reversible commands without redundant confirmation, ambiguity as a valid unresolved result, narrow learning from corrections, link-before-merge behavior, and zero generative AI through the deterministic Seed architecture checkpoint.

**Reason:** These rules best match Leaflet's intended experience: fast capture, useful automation, low cognitive load, resource-conscious processing, and user control without turning the product into a configuration-heavy system.

**Consequence:** TASK-0002 through TASK-0006 must implement and review against `docs/SEED_DOMAIN.md`. Claude must not silently reinterpret the product rules to simplify implementation, and Codex treats violations as review findings. The exact schema, module boundaries, and algorithms remain engineering choices as long as they preserve the domain contract.

**Revisit when:** Development or real usage reveals a simpler, more helpful, safer, or more efficient behavior. Revisions are expected to be possible; update the domain document and record a superseding decision when a durable rule changes.
