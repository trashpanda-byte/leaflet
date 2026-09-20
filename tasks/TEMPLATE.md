# TASK-NNNN — Short title

| Field | Value |
|---|---|
| Status | proposed / ready / in progress / in review / blocked / complete |
| Owner |  |
| Reviewer |  |
| Branch |  |
| Risk | low / medium / high |

## Why

What user problem or project risk does this solve?

## Expected experience

Describe what the user sees and does in plain language.

## Acceptance criteria

- [ ] Observable outcome one
- [ ] Observable outcome two
- [ ] Important failure/uncertainty behavior

## Out of scope

List tempting adjacent behavior that this task will not add.

## Product decisions

List GREEN/YELLOW decisions and any RED decision required from Chris. Use `docs/ai/DECISION_REQUEST_TEMPLATE.md` for a blocking RED choice.

## Technical notes

Implementation engineer records relevant current architecture, proposed approach, dependencies, migration impact, and risks.

## AI necessity review

Complete for every new or changed model call; otherwise write `No model behavior changed`.

- Irreducibly ambiguous/generative need:
- Deterministic alternatives considered:
- Selected provider-agnostic capability:
- Minimum context:
- Typed output and validator:
- Cache/reusable knowledge:
- Failure fallback:
- Budget/rate limit/telemetry:

## Security and data review

- Data read/written:
- Authorization and RLS impact:
- Cross-user denial cases:
- Secrets/logging/retention impact:
- Destructive or irreversible behavior:

## Verification plan

List automated commands and manual scenarios before implementation begins.

## Implementation handoff

Complete using `docs/ai/HANDOFF.md`.

## Independent review

Complete using `docs/ai/REVIEW_TEMPLATE.md`.
