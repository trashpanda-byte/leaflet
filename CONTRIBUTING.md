# Contributing to Leaflet

## Before starting

Read `docs/ai/CONSTITUTION.md`, `docs/STATUS.md`, and the active task. Read the role-specific instructions for the work being performed.

Create a branch from the current protected base using a clear prefix such as `feat/`, `fix/`, `docs/`, or `chore/`. Do not commit secrets or real user data.

## Define the work

Substantial work starts from `tasks/TEMPLATE.md`. Acceptance criteria describe observable outcomes. Put implementation details in technical notes rather than disguising them as product requirements.

Classify decisions:

- **GREEN:** reversible internal engineering choice consistent with existing decisions;
- **YELLOW:** meaningful choice with a recommended default that should be disclosed in the handoff;
- **RED:** product behavior, privacy/retention, destructive action, visual identity, navigation, scope, or irreversible choice owned by Chris.

## Implement and verify

Follow `docs/ai/DEFINITION_OF_DONE.md` proportionally to risk. Add tests at the lowest useful layer, but do not substitute a unit test for an integration or security boundary that requires a real database/browser flow.

## Review

Claude normally implements and hands off. Codex normally reviews independently using `docs/ai/REVIEW_TEMPLATE.md`. BLOCKING and HIGH findings must be fixed and re-verified before merge.

## Merge

Require CI, review, and preview/product checks applicable to the change. Update `docs/STATUS.md`, close or move the task, and record durable decisions. Squash versus merge strategy should be decided when GitHub protection is configured; do not rewrite shared history casually.
