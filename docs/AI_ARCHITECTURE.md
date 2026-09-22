# AI architecture

## Mantra

> Code first. Data second. Rules third. Reuse previous intelligence fourth. AI last.

When AI is required:

> Retrieve narrowly → reason minimally → validate with code → save reusable knowledge when appropriate.

For the Seed core, TASK-0002 through TASK-0006 intentionally contain no generative AI. The AI layer may be designed only after the deterministic vertical slice is working, the architecture checkpoint is complete, and unresolved cases provide evidence of a real need.

## Escalation ladder

| Level | Capability | Examples |
|---|---|---|
| 0 | Pure application logic | UI state, known action dispatch, calculations |
| 1 | Database lookup | Existing topics, tasks, events, preferences |
| 2 | Rules, parsing, exact/fuzzy lexical match | Dates, explicit commands, normalized names |
| 3 | Stored relationships/cached confirmed knowledge | Aliases and prior confirmed corrections |
| 4 | Low-cost classification | Ambiguous intent or object type only when later justified |
| 5 | Focused reasoning | A useful follow-up question or synthesis |
| 6 | Large-context reasoning | Rare cross-project contradiction or deep review |

Most requests should resolve at Levels 0–3. Model-provider names do not belong in product logic. Call capabilities such as `classification.low_cost` or `reasoning.focused`; map capabilities to providers in configuration.

## AI gateway

Every proposed model call must answer:

- What measured unresolved case requires generative inference?
- Can exact data, rules, parsing, search, algorithms, or confirmed knowledge solve it?
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
  → exact/rule/confirmed-knowledge resolution
      → resolved: validate and execute
      → ambiguous/unresolved: preserve safely
          → only after AI is approved for this case:
              AI gateway
              → smallest capable model
              → typed proposal
              → deterministic validation
              → execute, suggest, or request confirmation
  → record outcome and safe reusable learning
```

## Action safety

Models do not write directly to the database or calendar. They propose an allowed typed action such as:

```json
{
  "action": "create_task",
  "title": "Go to gym",
  "date": "2026-09-21",
  "basis": "explicit_user_request",
  "requires_confirmation": false
}
```

Application code validates schema, permission, ownership, temporal values, idempotency/duplicates, uncertainty language, reversibility, and confirmation policy.

Do not treat a model-supplied numeric “confidence” as calibrated truth. Preserve interpretable provenance and application-level policy instead.

Ambiguous statements remain Seeds and may produce a suggestion; they are not automatic commitments.

## Context policy

Retrieve only the context needed for the current inference. Do not send an entire journal, graph, calendar, or conversation history when a few relevant records suffice. Context selection itself must respect authorization.

## Learning layer

Confirmed relationships may crystallize into scoped structured knowledge, for example `weights → Fitness / Strength Training`. Store provenance, scope, creation source, last confirmation where useful, and a way to correct or remove it.

Explicit corrections outrank inference. Reuse a correction narrowly at first rather than broadening one example into a large semantic assumption.

Never convert sensitive inference into durable fact merely because a model stated it.

## Telemetry and budgets

Track without exposing raw private content:

- total eligible requests;
- deterministic resolutions by mechanism;
- unresolved/ambiguous outcomes;
- user corrections;
- model calls by capability and reason after AI exists;
- denial reasons;
- input/output tokens and estimated cost;
- latency and error rate;
- cache/confirmed-knowledge hits;
- validation rejection rates.

Primary efficiency metric:

`deterministic_resolution_rate = requests_resolved_without_generative_model / eligible_requests`

This metric must not be gamed by forcing ambiguous input into incorrect classifications.

## Required review for every new model call

- evidence from unresolved cases that the capability is needed;
- documented deterministic alternatives;
- narrow authorized context;
- explicit data retention behavior;
- schema-constrained output;
- deterministic validation;
- timeout, retry, and fallback behavior;
- token/cost budget and rate limit;
- tests for malformed, adversarial, ambiguous, and unavailable-model cases;
- telemetry proving whether the call remains necessary.
