# AI architecture

## Mantra

> Code first. Data second. Rules third. Reuse previous intelligence fourth. AI last.

When AI is required:

> Retrieve narrowly → reason minimally → validate with code → save reusable knowledge when appropriate.

## Escalation ladder

| Level | Capability | Examples |
|---|---|---|
| 0 | Pure application logic | UI state, known action dispatch, calculations |
| 1 | Database lookup | Existing topics, tasks, events, preferences |
| 2 | Rules, parsing, fuzzy match | Dates, explicit commands, normalized names |
| 3 | Stored relationships/cached inference | Semantic aliases and prior confirmed corrections |
| 4 | Low-cost classification | Ambiguous intent or object type |
| 5 | Focused reasoning | A useful follow-up question or synthesis |
| 6 | Large-context reasoning | Rare cross-project contradiction or deep review |

Most requests should resolve at Levels 0–3. Model-provider names do not belong in product logic. Call capabilities such as `classification.low_cost` or `reasoning.focused`; map capabilities to providers in configuration.

## AI gateway

Every proposed model call must answer:

- Why is generative inference required?
- Can exact data, rules, parsing, search, algorithms, or cached knowledge solve it?
- Has this result already been computed?
- What is the smallest relevant context?
- What is the least expensive reliable capability?
- Can the output be represented and validated as a typed schema?
- Can a confirmed inference safely become reusable knowledge?

If a deterministic path exists, deny the call with a machine-readable reason such as `deterministic_path_available`.

## Runtime pattern

```text
Input
  → normalize
  → query relevant structured state
  → exact/rule/fuzzy/cached resolution
      → resolved: validate and execute
      → unresolved and useful: AI gateway
          → smallest capable model
          → typed proposal
          → deterministic validation
          → execute or request confirmation
  → record outcome and safe reusable learning
```

## Action safety

Models do not write directly to the database or calendar. They propose an allowed action such as:

```json
{
  "action": "create_task",
  "title": "Go to gym",
  "date": "2026-09-21",
  "confidence": 0.82
}
```

Application code validates the schema, permission, ownership, temporal value, duplicates, uncertainty language, and confirmation policy. Ambiguous statements remain thoughts and may produce a suggestion, not an automatic commitment.

## Context policy

Retrieve only the context needed for the current inference. Do not send an entire journal, graph, calendar, or conversation history when a few relevant records suffice. Context selection itself must respect authorization.

## Learning layer

Confirmed relationships may crystallize into scoped structured knowledge, for example `weights → Fitness / Strength Training`. Store provenance, confidence, scope, creation source, last confirmation, and a way to correct or remove it. Never convert sensitive inference into durable fact merely because a model stated it.

## Telemetry and budgets

Track without exposing private content:

- total requests;
- deterministic resolutions by mechanism;
- model calls by capability and reason;
- denial reasons;
- input/output tokens and estimated cost;
- latency and error rate;
- cache hits;
- validation rejection and user-correction rates.

Primary efficiency metric:

`deterministic_resolution_rate = requests_resolved_without_generative_model / eligible_requests`

This metric must not be gamed by reducing product quality or silently misclassifying ambiguity.

## Required review for every new model call

- documented necessity and capability;
- narrow authorized context;
- explicit data retention behavior;
- schema-constrained output;
- deterministic validation;
- timeout, retry, and fallback behavior;
- token/cost budget and rate limit;
- tests for malformed, adversarial, ambiguous, and unavailable-model cases;
- telemetry proving whether the call remains necessary.
