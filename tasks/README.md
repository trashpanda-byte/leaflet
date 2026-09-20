# Task system

`tasks/active/` contains current feature and remediation specifications. `tasks/completed/` contains the final specification plus handoff and review record for shipped work.

Create substantial tasks from `tasks/TEMPLATE.md`. Use stable numeric prefixes such as `0002-topic-routing.md`. One task may produce multiple commits, but acceptance criteria and review evidence should remain coherent.

A task is not complete merely because code was written. It moves to `completed` only when applicable definition-of-done items, review, CI, status updates, and product decisions are resolved.
