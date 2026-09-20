# Implementation handoff protocol

Add this structure to the active task or pull request after implementation.

## Implementation summary

What user-visible and internal behavior changed?

## Changed files

List files grouped by product code, database, tests, configuration, and documentation.

## Data and security impact

Describe migrations, RLS, authorization, secrets, retention, logging, and cross-user behavior. Write `None` only after checking.

## AI necessity and cost impact

Identify every new/changed model call, why it is required, selected capability, context, caching, validation, fallback, and expected usage. Write `None` if no model behavior changed.

## Verification evidence

List exact commands and results. Separate checks that ran from checks that were not available or not run.

## Manual checks

Record environment, scenario, and observed result.

## Known limitations and follow-ups

Include deferred behavior, temporary compromises, and issues discovered outside scope.

## Decisions

Record decisions made under existing authority and any RED decisions still needed from Chris.

## Review target

State the branch/base, commit SHA, or exact diff Codex should review.
