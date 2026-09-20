# Product constitution

## Purpose

Leaflet is a personal thinking system. It helps a person move naturally through:

> thoughts → connections → questions → plans → actions

It should reduce organizational work rather than turn self-organization into another chore. The assistant supports the user's thinking; it is not the product by itself.

## Core promise

A user can capture something quickly without classifying it first, trust Leaflet to handle obvious organization quietly, see how it connects to the rest of their life, and decide what—if anything—should happen next.

Leaflet must preserve the difference between thinking and committing. “I might go to the gym tomorrow” is a Seed, not permission to create a task or calendar event.

The detailed Seed behavior is defined in `docs/SEED_DOMAIN.md`.

## Product principles

1. **Capture first.** Everything entered through general capture begins as a Seed.
2. **Preserve the source.** Keep the original user-authored capture as provenance.
3. **Organize quietly.** Use existing structure, rules, parsers, and confirmed relationships before asking the user to categorize.
4. **Automate the obvious.** Clear, ordinary, reversible instructions may execute without redundant confirmation and must provide an appropriate Undo path.
5. **Admit uncertainty.** Ambiguous input may remain unresolved rather than being forced into a category or action.
6. **Grow ideas with restraint.** Ask one useful question when it meaningfully advances the thought; stop when enough context exists to help.
7. **Connect more than you merge.** Seeds and derived objects may have many relationships; preserve meaningful repetition and merge conservatively.
8. **Learn from corrections.** Explicit user corrections outrank inference and may become narrow reusable personal knowledge.
9. **Keep the user in control.** Important automatic changes should be correctable or reversible wherever practical.
10. **Minimize cognitive load.** Do not expose system complexity unless it helps the current decision.
11. **Protect private context.** Retrieve, log, and disclose only what the current operation needs.
12. **AI is a fallback, not the default runtime.** Deterministic behavior is built and measured before model inference is introduced.

## Core concepts

| Concept | Meaning |
|---|---|
| Seed | The preserved origin capture. Every general input begins here and may remain exploratory forever. |
| Topic | A stable subject used to organize related material. |
| Branch | A visible relationship or path among concepts. |
| Question | Something the user asks or Leaflet proposes to deepen thinking. |
| Goal | A desired outcome, distinct from the actions used to reach it. |
| Task | A concrete action the user has chosen or explicitly requested. |
| Event | A time-bound calendar commitment. |
| Person | A known individual referenced in the user's world. |
| Project | A multi-step body of work with an intended result. |
| Relationship | A typed connection with source and provenance. |
| Conversation | An exchange whose useful results may connect to other concepts. |

There is no separate generic Note concept in the first implementation. A passive Seed already fills that role.

These are product concepts, not a finalized database schema.

## Seed actions

- **Grow:** help move a Seed forward; this is an action/intent, not a mutually exclusive lifecycle state.
- **Hold:** keep the Seed without actively pushing it right now.
- **Snip:** remove the Seed from active Leaflet with an Undo path; do not claim permanent erasure before a full retention policy exists.
- **Resolved:** keep useful provenance/context without showing the Seed as active work.

## Experience boundaries

- Natural language may trigger ordinary software underneath; “AI-like” interaction does not require an LLM call.
- Explicit ordinary reversible commands may execute directly with Undo.
- Ambiguous commitment language does not create Tasks or Events.
- Low-confidence/ambiguous organization remains reversible, explainable when needed, or unresolved.
- Similar topics are linked/aliased before destructive merging.
- One Seed may relate to multiple branches while optionally having one primary organizational home.
- The original Seed remains attached as provenance when Tasks, Goals, Events, Projects, or other objects are derived.
- The user must be able to correct organization and derived assumptions.
- User-created structure and explicit corrections carry more authority than inferred structure.
- Sensitive personal conclusions are not converted into durable facts from ambiguous evidence.
- Repeated genuine thoughts remain separate; only accidental retries/double submissions are deduplicated.

## Founder-owned decisions

Chris owns user-facing behavior, privacy tradeoffs, retained knowledge, personality, visual identity, navigation, irreversible actions, and feature scope. Engineering may make reversible internal choices that do not alter those decisions.

The current Seed rules are approved as a baseline and may be revised as development and real usage expose better behavior. Revisions must update `docs/SEED_DOMAIN.md` and the decision log when durable.

See `docs/ai/DECISION_REQUEST_TEMPLATE.md` for escalation.
