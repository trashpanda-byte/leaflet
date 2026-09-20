# Independent review

## Result

PASS / CHANGES REQUIRED / INCOMPLETE REVIEW

## Findings

List findings from highest to lowest severity. For each:

- Severity:
- Location:
- Evidence:
- Impact:
- Remediation or verification:

If there are no findings, say so explicitly and identify any residual risk or untested area.

## Verification performed

List exact commands, inspected evidence, and manual checks.

## Acceptance criteria coverage

Map each criterion to evidence or identify the gap.

## Maintainability and architecture review

Inspect the actual changed area and surrounding code for:

- avoidable duplication;
- dead code or temporary/debugging leftovers;
- oversized functions/modules and mixed responsibilities;
- weak or confusing names and types;
- unnecessary indirection, dependencies, or speculative abstractions;
- leaky boundaries between UI, domain logic, data access, and platform/native code;
- repeated validation or transformation logic that now represents a proven reusable pattern;
- technical debt being silently layered under a new major subsystem;
- behaviorally unrelated refactoring hidden inside the feature diff.

State whether the implementation is clean enough for the next layer. If it reaches an architecture checkpoint, explicitly say whether a separate refactor task is required before additional complexity is added.

Do not demand refactoring for stylistic preference alone; findings should have a concrete maintainability, correctness, testing, performance, security, or architectural impact.

## AI necessity review

Confirm every new/changed model call is necessary, narrow, validated, observable, budgeted, and provider-agnostic.

## Security review

Summarize authentication, authorization, RLS, cross-user isolation, secret handling, logging, and data lifecycle checks.
