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
