# Definition of done

Apply each item that is relevant to the change. Mark a non-applicable item `N/A` with a short reason; do not silently omit it.

## Behavior

- Acceptance criteria are satisfied.
- Important edge cases and failure behavior are defined.
- No out-of-scope product behavior was introduced.
- Consequential actions follow confirmation and undo policy.

## Verification

- Formatting, typecheck, lint, unit tests, integration tests, and production build pass where configured.
- Relevant end-to-end user flows pass.
- The verifier records exact commands and results.
- Manual checks identify browser/device and observed result.

## Maintainability and refactor pass

- The changed area received a deliberate cleanup pass after behavior became correct.
- Dead code, stale comments, temporary debugging code, and obsolete compatibility paths are removed.
- Naming, types, module boundaries, and control flow are understandable without unnecessary indirection.
- Repeated logic is either consolidated when the pattern is proven or intentionally left local with a reason.
- No speculative abstraction, unnecessary dependency, or premature framework layer was introduced.
- Oversized functions/modules or mixed responsibilities are split when doing so materially improves maintainability or testing.
- Structural changes preserve behavior and the relevant verification is rerun after refactoring.
- If the task crosses an architecture checkpoint, the underlying subsystem is reviewed for cleanup before the next major layer is added.
- Significant unrelated cleanup is moved to its own task rather than hidden inside the feature diff.

## Security and data

- Inputs and model outputs are schema-validated.
- Authentication, ownership, authorization, and RLS are checked.
- Cross-user and anonymous denial tests cover affected data.
- Secrets remain server-side and private content is not added to logs.
- Migrations rebuild cleanly with synthetic seed data.
- Data deletion, rollback, and failure behavior are considered.

## AI

- The AI Necessity Review demonstrates why deterministic approaches are insufficient.
- Context is authorized and minimal.
- The least expensive reliable capability is selected through provider-agnostic routing.
- Timeouts, failures, malformed output, rate limits, budgets, and fallbacks are covered.
- Telemetry can distinguish deterministic resolution from model use.

## Experience

- Loading, empty, error, and success states are present where relevant.
- Narrow mobile layout and primary desktop layout are checked.
- Keyboard, focus, semantics, contrast, and reduced motion are considered.
- Copy and visuals follow `docs/DESIGN.md`.

## Documentation and review

- Task, setup, architecture, decision log, and status are updated as needed.
- Claude handoff is complete and factually accurate.
- Independent Codex review is complete.
- All BLOCKING and HIGH findings are resolved and re-verified.
- CI and preview checks pass before merge.
