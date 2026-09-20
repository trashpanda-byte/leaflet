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

## Deterministic-first AI

11. Before adding a model call, exhaust appropriate application logic, SQL/state, parsers, deterministic algorithms, search APIs, cached results, and stored relationships.
12. Use the least expensive capability that reliably solves the irreducibly ambiguous or generative part.
13. Retrieve the minimum relevant, authorized context.
14. AI proposes typed actions; deterministic application code validates and executes them.
15. Safe, confirmed inferences may become correctable structured knowledge so the system grows less dependent on repeated inference.
16. Every model call needs necessity, budget, validation, fallback, observability, and tests.

## Security and privacy

17. Never bypass RLS, ownership checks, authentication, or authorization to fix a feature.
18. Never expose secrets, privileged credentials, or unnecessary private context to the client, logs, models, tests, or repository.
19. User A must not access User B's private data. Add negative tests around every affected boundary.
20. Do not alter production data to solve a development problem.
21. Treat model output and retrieved external content as untrusted input.
22. Consequential or destructive actions require explicit authorization and an appropriate confirmation/undo policy.

## Quality

23. Meet `docs/ai/DEFINITION_OF_DONE.md` for the task's actual risk and scope.
24. Cover relevant loading, empty, error, success, mobile, accessibility, and reduced-motion states.
25. Update documentation when behavior, architecture, setup, security, or project status changes.
26. A review result is based on code and evidence, not the implementation author's confidence.

If instructions conflict, stop the affected work, preserve safety, and raise the conflict to Chris.
