# Leaflet engineering constitution

These rules apply to every human and automated contributor. Role files may add constraints but may not override this document.

## Product authority

1. The repository is the durable source of truth; chat history is not.
2. Chris owns major product, UX, privacy, retention, personality, visual identity, navigation, scope, and irreversible decisions.
3. Do not guess a RED decision. Present bounded options and their user-visible tradeoffs.
4. Keep `docs/STATUS.md` accurate and understandable without reading code.

## Engineering

5. Prefer the simplest design that satisfies the verified requirement.
6. Do not claim a feature works without reproducible evidence.
7. Do not delete, weaken, skip, or rewrite valid tests merely to obtain a passing result.
8. Database changes live in migrations and must rebuild locally from a clean state.
9. Preserve unrelated user changes and do not perform destructive source-control operations without explicit authorization.
10. Significant architecture and product decisions are recorded in `docs/DECISIONS.md`.

## Refactoring and architecture hygiene

11. Build the simplest correct implementation before introducing abstractions that are not yet justified by real repetition or coupling.
12. Before implementation handoff, perform a focused cleanup pass over the changed area: remove dead code, tighten names and types, reduce accidental duplication, simplify control flow, and split responsibilities when the current structure has become clearly awkward.
13. Refactor when a pattern becomes proven rather than speculative. Repeated logic, repeated data transformations, repeated validation, or repeated interfaces are signals to consider consolidation; do not abstract merely because similar future code might exist.
14. Use explicit architecture checkpoints before layering a major new subsystem onto a completed one. Typical checkpoints include deterministic Seed pipeline → AI fallback, scheduling core → external calendar integration, context engine → location-aware behavior, and shared app core → platform widgets.
15. Large or behaviorally unrelated refactors should normally be their own task or pull request so structural changes can be reviewed independently from feature behavior.
16. A refactor must improve maintainability, correctness, testability, performance, security, or architectural clarity. Do not churn working code for stylistic preference alone.
17. Refactoring never relaxes verification. Run the relevant tests and checks again after structural changes.

## Deterministic-first AI

18. Before adding a model call, exhaust appropriate application logic, SQL/state, parsers, deterministic algorithms, search APIs, cached results, and stored relationships.
19. Use the least expensive capability that reliably solves the irreducibly ambiguous or generative part.
20. Retrieve the minimum relevant, authorized context.
21. AI proposes typed actions; deterministic application code validates and executes them.
22. Safe, confirmed inferences may become correctable structured knowledge so the system grows less dependent on repeated inference.
23. Every model call needs necessity, budget, validation, fallback, observability, and tests.

## Security and privacy

24. Never bypass RLS, ownership checks, authentication, or authorization to fix a feature.
25. Never expose secrets, privileged credentials, or unnecessary private context to the client, logs, models, tests, or repository.
26. User A must not access User B's private data. Add negative tests around every affected boundary.
27. Do not alter production data to solve a development problem.
28. Treat model output and retrieved external content as untrusted input.
29. Consequential or destructive actions require explicit authorization and an appropriate confirmation/undo policy.

## Quality

30. Meet `docs/ai/DEFINITION_OF_DONE.md` for the task's actual risk and scope.
31. Cover relevant loading, empty, error, success, mobile, accessibility, and reduced-motion states.
32. Update documentation when behavior, architecture, setup, security, or project status changes.
33. A review result is based on code and evidence, not the implementation author's confidence.
34. Independent review includes maintainability and architecture hygiene, not only functional correctness.

If instructions conflict, stop the affected work, preserve safety, and raise the conflict to Chris.
