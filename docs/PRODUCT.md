# Product constitution

## Purpose

Leaflet is a personal thinking system. It helps a person move naturally through:

> thoughts → connections → questions → plans → actions

It should reduce organizational work rather than turn self-organization into another chore. The assistant supports the user's thinking; it is not the product by itself.

## Core promise

A user can capture something quickly, trust Leaflet to place it sensibly, see how it connects to the rest of their life, and decide what—if anything—should happen next.

Leaflet must preserve the difference between thinking and committing. “I might go to the gym tomorrow” is a thought, not permission to create a task or calendar event.

## Product principles

1. **Capture first.** Initial entry should be fast and forgiving.
2. **Organize quietly.** Use existing structure and learned relationships before asking the user to categorize.
3. **Grow ideas with restraint.** Ask one useful question when it meaningfully advances the thought.
4. **Keep the user in control.** Suggest consequential changes; do not silently perform them from ambiguous language.
5. **Connect, do not duplicate.** Thoughts, topics, goals, tasks, events, people, projects, and conversations are related views of one life.
6. **Learn from corrections.** A correction should become reusable, scoped knowledge when safe.
7. **Minimize cognitive load.** Do not expose system complexity unless it helps the current decision.
8. **Protect private context.** Retrieve and disclose only what the current operation needs.

## Core concepts

| Concept | Meaning |
|---|---|
| Thought | A captured statement that may remain exploratory. |
| Topic | A stable subject used to organize related material. |
| Branch | A visible relationship or path among concepts. |
| Question | Something the user asks or Leaflet proposes to deepen thinking. |
| Goal | A desired outcome, distinct from the actions used to reach it. |
| Task | A concrete action the user has chosen or confirmed. |
| Event | A time-bound calendar commitment. |
| Person | A known individual referenced in the user's world. |
| Project | A multi-step body of work with an intended result. |
| Relationship | A typed connection with source, confidence, and provenance. |
| Conversation | An exchange whose useful results may connect to other concepts. |

These are product concepts, not a finalized database schema.

## Experience boundaries

- Natural language may trigger ordinary software underneath; “AI-like” interaction does not require an LLM call.
- Low-confidence organization should remain reversible and visible.
- Similar topics should be suggested for merging until Chris explicitly approves an automatic-merge policy.
- Tasks and events require explicit intent or confirmation when language is uncertain.
- The user must be able to correct organization, undo consequential actions, and understand what changed.

## Founder-owned decisions

Chris owns user-facing behavior, privacy tradeoffs, retained knowledge, personality, visual identity, navigation, irreversible actions, and feature scope. Engineering may make reversible internal choices that do not alter those decisions.

See `docs/ai/DECISION_REQUEST_TEMPLATE.md` for escalation.
