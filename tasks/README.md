# Task system

- `tasks/queued/` contains approved or prepared work whose dependencies are not yet satisfied or which is waiting its turn.
- `tasks/active/` contains the bounded feature/remediation task currently being implemented or reviewed.
- `tasks/completed/` contains the final specification plus handoff and review record for shipped work.

Create substantial tasks from `tasks/TEMPLATE.md`. Use stable numeric prefixes such as `0002-seed-persistence-foundation.md`.

## Flow

```text
queued
  ↓ dependencies satisfied
active
  ↓ implementation + cleanup + verification
in review
  ↓ independent review + remediation
completed
```

Prefer one primary implementation task at a time unless parallel work has genuinely independent files, dependencies, and product decisions. Do not start later queued work merely because its code seems easy if an earlier dependency establishes the contracts it relies on.

One task may produce multiple commits, but acceptance criteria and review evidence should remain coherent.

A task is not complete merely because code was written. It moves to `completed` only when applicable definition-of-done items, refactor/architecture requirements, review, CI, status updates, and product decisions are resolved.
