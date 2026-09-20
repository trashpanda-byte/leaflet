# Seed domain

## Status

This document is the current product source of truth for Leaflet's Seed core loop.

The rules below are approved as the baseline for implementation. They are deliberately revisable as real usage teaches us more. A future change should update this document and, when durable or behaviorally significant, add a superseding entry to `docs/DECISIONS.md`.

This document defines product and domain behavior. It is **not** a finalized database schema.

## Core idea

A Seed is Leaflet's universal capture object.

The user should not need to decide whether something is a note, task, goal, question, reminder, idea, journal entry, or project before capturing it. Everything entered through the general capture flow begins as a Seed.

Leaflet then does as much as it safely can with ordinary application logic, structured data, rules, parsers, known relationships, and confirmed corrections.

> Capture first. Preserve the source. Automate the obvious. Admit uncertainty. Connect more often than you merge.

## Non-negotiable invariants

1. **Every general capture starts as a Seed.**
2. **The original user-authored capture is preserved.** Leaflet may store a normalized title, interpretation, or edited presentation separately; it does not silently rewrite history.
3. **A Seed remains the origin record.** It may create or connect to Tasks, Goals, Events, Projects, Questions, Topics, People, or other objects, but it is not replaced by them.
4. **One Seed may connect to many things and many branches.**
5. **Derived objects have their own lifecycle.** Snipping an origin Seed does not silently destroy a Task, Goal, Event, or Project already created from it.
6. **Ambiguity is valid.** Leaflet may leave a Seed unresolved rather than guessing, inventing certainty, or calling a model merely to force classification.
7. **Explicit user corrections outrank inference.**
8. **Link aggressively; merge conservatively.**
9. **Important automatic changes are reversible whenever practical.**
10. **The first Seed core milestone uses zero generative AI.**

## Seed versus other concepts

A Seed is the source capture, not a catch-all replacement for every domain object.

Examples:

- “I want to learn guitar” begins as a Seed and may later connect to a Goal.
- “Remind me to call Mom tomorrow” begins as a Seed and may immediately create a Task/reminder because the command is explicit.
- “Put gym on Tuesday at 5” begins as a Seed and may create an internal Event without a redundant confirmation.
- “I might go to the gym tomorrow” remains exploratory. It is not permission to create a Task or Event.
- A journal-like observation may remain only a Seed forever.

There is no separate generic Note object in the first implementation. A passive Seed already fills that role. Add a distinct Note concept only if real product behavior later requires one.

## Original text and interpretation

The original capture is immutable provenance.

Leaflet may separately store:

- a concise display title;
- normalized terms;
- parsed dates or entities;
- inferred relationships;
- derived actions;
- an edited user-facing representation if the product later supports editing.

Those values must not erase the original capture.

The system should be able to answer, at least internally:

- What did the user actually enter?
- What did Leaflet derive from it?
- Why did Leaflet derive that?
- Was the derivation explicit, deterministic, learned from a correction, or unresolved?

## User-visible loop

The default experience should remain small:

```text
Plant a Seed
    ↓
Leaflet handles obvious organization quietly
    ↓
┌────────────────────┬────────────────────────┐
│ Explicit request   │ Exploratory Seed       │
│                    │                        │
│ Perform reversible │ Grow / Hold / Snip     │
│ action + Undo      │                        │
└────────────────────┴────────────────────────┘
```

Do not expose internal classification machinery unless it helps the user understand or correct something.

A normal acknowledgement should be brief, for example:

- “Planted in Fitness.”
- “Saved for later.”
- “Scheduled for Tuesday at 5.”
- “I’m not sure where this belongs yet.”

Numeric confidence percentages are not a user-facing concept.

## Lifecycle

Seed lifecycle and Seed interpretation are separate concerns.

The initial conceptual lifecycle is:

- **active** — available in the user's current world;
- **held** — intentionally retained without active pressure;
- **resolved** — no longer needs attention but remains useful history/context;
- **snipped** — removed from active Leaflet and eligible for Undo/deletion handling.

A newly inserted Seed may have transient processing state, but “new” should not become a permanent product category merely because processing occurs.

### Grow

Grow is primarily a user intent/action, not a mutually exclusive storage status.

It means:

> Help me move this forward.

Leaflet should choose the smallest useful next step rather than show a large workflow menu. When a question is useful, ask one question at a time and stop as soon as enough information exists to offer something useful.

Leaflet does not automatically Grow Seeds by default. It may offer to Grow a relevant Seed. More autonomous behavior requires an explicit later product decision or opt-in.

Before generative AI exists, Grow may use deterministic templates or supported structured actions. If the deterministic system cannot provide a useful next step, it may leave the case unresolved rather than pretending.

### Hold

Hold means:

> Keep this, but do not push me on it right now.

The default is indefinite. A held Seed may later be resurfaced when genuinely relevant, but resurfacing is a suggestion, not permission to create commitments.

Time-based Hold options may be added later without changing the core meaning.

### Snip

Snip means:

> I no longer want this Seed in my active Leaflet.

Snip should feel immediate and offer Undo.

The first implementation must not claim that Snip is permanent erasure until a full retention/deletion policy exists. After the Undo window, deletion follows the product's eventual privacy and retention rules.

Derived objects survive by default. If a Seed produced a Goal, Task, Event, or Project, Snipping the source does not silently delete that work.

### Resolved

A Seed may become resolved/inactive without being held or deleted.

This keeps completed or no-longer-actionable captures from cluttering active views while preserving useful provenance and context.

Seeds themselves are not normally “completed” in the same sense as Tasks. Derived Tasks and Goals have their own completion semantics.

## Explicit commands and confirmation

Leaflet should avoid redundant confirmation when the user already gave a clear, ordinary, reversible instruction.

Examples:

- “Remind me to call Mom tomorrow.” → create the internal Task/reminder and show Undo.
- “Put gym on Tuesday at 5.” → create the internal Event and show Undo.

Ambiguous or exploratory language does **not** create commitments:

- “I might go to the gym tomorrow.” → Seed only.
- “Maybe call Sam this week.” → Seed, suggestion, or clarification depending on context.

This rule applies to ordinary reversible Leaflet state. External side effects, destructive actions, purchases, messages, or other consequential integrations require their own explicit authorization policies.

## Multiple actions in one Seed

A Seed may contain several candidate actions.

Example:

> “I need to email Sam, book a dentist appointment, and buy toothpaste.”

Leaflet preserves the original Seed and may identify three derived actions. It should not split or rewrite the source capture as if the user had entered three separate Seeds.

## Organization

### Default behavior

- Organize strong, obvious matches automatically.
- Keep weak matches unresolved or offer a quiet suggestion.
- Do not interrupt capture merely to achieve perfect categorization.
- Start broad and become specific gradually.
- Reuse existing structure before creating new structure.

### New categories

Create categories conservatively.

A new category is justified when:

- the user explicitly creates one; or
- a clearly distinct subject recurs enough that a new stable topic improves organization.

One unusual Seed should not automatically create a deep new hierarchy.

### Similar categories

Treat similar labels as candidate aliases/relationships before merging them.

Examples:

- Gym
- Working Out
- Exercise
- Fitness

Leaflet may understand these as related without silently collapsing the user's structure.

### Multiple branches

A Seed can relate to multiple branches.

Example:

> “Go hiking with Dad more.”

This may relate to Family and Health simultaneously.

For navigation simplicity, Leaflet may maintain one primary organizational home while preserving additional relationships.

### Tree behavior

The future Tree should emphasize stable Topics, Goals, Projects, and meaningful relationships. Individual Seeds may appear when exploring deeper context, but they should not overwhelm the visible structure.

## Resolution basis and uncertainty

Do not invent pseudo-scientific confidence percentages.

The deterministic system should use interpretable resolution provenance such as:

- `explicit_user_intent`
- `exact_match`
- `rule_match`
- `learned_match`
- `ambiguous`
- `unresolved`

These are examples of semantics, not required enum names.

The system should preserve enough provenance to explain how an important decision was reached.

“Unresolved” is a successful, safe system result when available evidence is insufficient.

## Relationships and merging

Prefer relationships over destructive consolidation.

Two related Seeds normally remain separate and connected. Repetition can itself be meaningful information.

Merge only when:

- the user explicitly requests it; or
- a later approved policy establishes a very high-confidence, reversible merge behavior.

Until then:

> Link aggressively. Merge conservatively.

## Corrections and learned knowledge

A confirmed correction may become reusable personal knowledge.

Example:

> User moves “weights” from General Fitness to Strength Training.

Leaflet may remember that association for this user.

Initial reuse should be narrow:

- exact term;
- obvious close variants;
- directly confirmed aliases.

Do not jump from one correction to broad semantic assumptions such as treating every strength exercise the same way unless repeated evidence supports it.

User-created structure and explicit corrections carry stronger authority than inferred structure.

Eventually the user should be able to inspect, correct, and remove learned relationships, but that management UI is not required for the first milestone.

## Repetition and duplicates

Repeated thoughts are not inherently duplicates.

If a user captures variations of “I need to work out again” across several weeks, that repetition may be meaningful context.

Suppress only obvious accidental duplicate submissions, such as the same client request being retried or double-tapped within a short period.

Implementation should therefore support idempotent creation without semantic deduplication.

## Time and location

A Seed may have contextual relevance without becoming a Task or Event.

Examples:

- someday;
- before vacation;
- next time I see Sam;
- while I am at the gym;
- when I am at a particular place.

Time and location are context first. Automation is a separate decision.

The initial core should not require location support, but its data model should not force every temporal or spatial reference into a Task/Event.

## Proactivity

Default proactivity is moderate and conservative.

Leaflet may resurface relevant Seeds or offer help, but should not turn reminders, check-ins, or Grow prompts into attention spam.

Later, behavior may adapt:

- repeated dismissals reduce similar prompts;
- repeated engagement can increase similar prompts within sensible limits.

The first Seed core does not need a proactivity-learning engine, but it should preserve the relationships and outcomes needed to support one later.

## Check-ins and follow-up

A future check-in response may:

- become a new Seed linked to the activity;
- update structured state when the meaning is explicit;
- do both when preserving the raw response and updating known state are valuable.

Preserve meaningful user-authored input instead of reducing all reflection to structured fields.

## Offline and source independence

Capture is important enough that Leaflet should eventually work offline.

The initial architecture should therefore avoid assumptions that every Seed must be created by an online AI/server round trip.

Creation should support:

- client-generated identity or idempotency;
- safe retry;
- later synchronization;
- multiple future capture sources such as app, widget, or voice.

The exact offline-sync implementation is not required in the first database task.

## Sensitive inference

Leaflet may retain what the user explicitly says when required for the product, subject to privacy policy.

It should not casually convert ambiguous evidence into durable sensitive conclusions about health, identity, relationships, emotional state, or similarly personal matters.

A model or rule “thinking” something is true is not enough to turn it into durable user knowledge.

## Personality

Core deterministic operations should use restrained L.E.A.F. personality.

Prefer:

> “Planted in Fitness.”

over lengthy mascot dialogue for ordinary organization.

More expressive personality belongs in Grow conversations, celebration, and moments where it adds value rather than slows the user down.

## MVP visibility

The first UI should expose only what helps the core loop.

Primary experience:

- Plant;
- quiet organization;
- explicit action result + Undo when applicable;
- Grow / Hold / Snip for exploratory Seeds;
- simple uncertainty/correction when needed.

Keep these mostly behind the scenes initially:

- confidence/provenance internals;
- relationship editor;
- alias management;
- full history;
- learned-knowledge management;
- complex Tree controls.

## First deterministic milestone

The first Seed core milestone is successful when a user can:

1. capture varied natural-language Seeds;
2. have the original source preserved;
3. store them securely under the correct user;
4. survive accidental retry without duplicate rows;
5. organize strong deterministic matches;
6. leave ambiguous cases unresolved;
7. Hold, Resolve, Snip, and Undo appropriate state changes;
8. request Grow without requiring a model;
9. connect one Seed to multiple relevant objects/branches;
10. create ordinary reversible internal actions from explicit commands;
11. preserve provenance for derived decisions;
12. learn narrow confirmed corrections;
13. prevent cross-user access through RLS and authorization tests;
14. keep repeated-but-genuine thoughts separate;
15. complete the entire flow with **zero generative AI calls**.

After this works end-to-end, perform the Seed architecture/refactor checkpoint before designing the AI fallback layer.
