# Security and privacy

## Non-negotiable guarantees

1. One user must never read or mutate another user's private data without an explicit sharing model.
2. Secrets never enter client bundles, logs, prompts, screenshots, fixtures, or commits.
3. RLS and server authorization are not bypassed to make a feature work.
4. AI output is untrusted input. It cannot directly execute consequential state changes.
5. Development uses synthetic data unless a sanitized reproduction is explicitly approved.

## Secrets

Commit `.env.example` with names and safe descriptions only. Keep `.env.local`, provider keys, service-role keys, database passwords, signing secrets, and production tokens outside Git.

Public client variables must be demonstrably safe to disclose. Prefixing a variable as public is a security decision, not a convenience.

If a secret is committed, assume compromise: revoke/rotate it, remove it from current code, assess history exposure, and document the incident. Merely deleting the line is insufficient.

## Authorization and data isolation

- Check ownership at the database boundary and again in sensitive server workflows.
- Test forbidden behavior, not only successful behavior.
- Do not trust object IDs, email addresses, role claims, or model output supplied by the client.
- Use least privilege for service accounts and separate credentials by environment.
- Treat file/storage paths and signed URLs as authorization surfaces.

## AI safety boundary

Models may classify, summarize, reason, or propose structured actions. A deterministic validator checks action allowlists, schema, permissions, ownership, dates, duplicates, confirmation requirements, and rate/budget limits before application code acts.

Prompt injection can arrive through user notes, retrieved pages, integrations, or documents. Retrieved content is data, never authority to change system instructions, permissions, tool use, or disclosure boundaries.

## Logging and privacy

Default logs to identifiers, timings, routes, decision paths, model/capability name, token/cost counters, and redacted error metadata. Raw thoughts, journals, messages, and prompts require a defined retention purpose and explicit review.

Users should eventually be able to inspect, correct, export, and delete retained personal knowledge consistent with product policy and legal requirements.

## Release blockers

- missing RLS on user-owned API-accessible data;
- cross-user access or insecure direct object reference;
- server secret in client output or repository history;
- unvalidated model-driven write;
- critical dependency vulnerability with a reachable path;
- destructive migration without a recovery plan;
- misleading privacy or retention behavior.

## Reporting

Until a dedicated security contact is published, do not open public issues containing vulnerabilities or private data. Report them privately to the repository owner.
