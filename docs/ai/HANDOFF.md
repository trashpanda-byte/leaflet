# Implementation handoff protocol

Add this structure to the active task or pull request after implementation.

## Implementation summary

What user-visible and internal behavior changed?

## Changed files

List files grouped by product code, database, tests, configuration, and documentation.

## Refactor and architecture pass

Describe the cleanup performed after the implementation became correct.

Include:

- duplication removed or intentionally retained;
- dead or temporary code removed;
- names, types, module boundaries, and control flow improved;
- abstractions added only after a real pattern was demonstrated;
- oversized or mixed-responsibility code split where appropriate;
- whether this task reaches an architecture checkpoint before the next major subsystem;
- any larger cleanup deliberately moved to a separate task.

Write `No material refactor needed` only after inspecting the changed area.

## Data and security impact

Describe migrations, RLS, authorization, secrets, retention, logging, and cross-user behavior. Write `None` only after checking.

## AI necessity and cost impact

Identify every new/changed model call, why it is required, selected capability, context, caching, validation, fallback, and expected usage. Write `None` if no model behavior changed.

## Verification evidence

List exact commands and results. Separate checks that ran from checks that were not available or not run. If a refactor occurred after initial verification, record the checks rerun after the refactor.

## Manual checks

Record environment, scenario, and observed result.

## Known limitations and follow-ups

Include deferred behavior, temporary compromises, technical debt, intentionally local duplication, and issues discovered outside scope.

## Decisions

Record decisions made under existing authority and any RED decisions still needed from Chris.

## Review target

State the branch/base, commit SHA, or exact diff Codex should review.
