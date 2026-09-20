# Database workflow

## Source of truth

The repository's ordered migrations are the authoritative schema history. Do not rely on undocumented edits in the Supabase dashboard.

Product/domain behavior for Seeds is defined in `docs/SEED_DOMAIN.md`. Schema design must implement those invariants rather than redefining them.

## Required workflow

1. Create or change schema in a new migration.
2. Apply the migration to a local database.
3. Rebuild from zero using the full migration history and synthetic seed data.
4. Test normal access, anonymous access, and cross-user denial.
5. Review SQL and RLS independently.
6. Apply to an isolated preview/staging environment.
7. Back up and release to production through the guarded deployment process.

## RLS policy

RLS is mandatory for every user-owned table exposed through Supabase APIs. Enabling RLS without policies is not a completed feature; policies and negative tests must accompany it.

Policies must scope access from authenticated identity and ownership or membership relationships. Client-provided user IDs are not proof of identity. Service-role operations remain server-only and require narrowly defined use cases.

## Seed data requirements

The exact schema is an engineering choice, but it must preserve these behaviors:

- original user-authored Seed content remains available as provenance and is not silently overwritten by normalization or derived interpretation;
- derived objects are separate from their source Seed;
- one Seed can hold many typed relationships;
- lifecycle state is separate from organization/resolution provenance;
- important derived decisions can record their source/basis;
- explicit user corrections can be represented with stronger authority than inferred relationships;
- creation supports idempotent retry/double-submit protection without semantic deduplication;
- genuine repeated thoughts remain separate records;
- Snip/Undo can be represented without falsely promising permanent erasure before retention policy is finalized;
- user ownership is enforceable at the database boundary;
- future capture sources and offline-safe retry are not blocked by an assumption that the server creates all identity synchronously.

Do not add a generic graph schema, vector database, embeddings table, or model-specific storage merely in anticipation of future AI.

## Resolution provenance

Do not store arbitrary numbers that imply calibrated confidence unless a defined algorithm actually produces calibrated values.

Prefer interpretable provenance such as explicit user intent, exact match, rule match, confirmed learned match, ambiguous, or unresolved.

Names/enums are implementation details; the semantics are required.

## Seed data for development

Local seed data must be synthetic and reproducible. It should include at least two users so cross-user isolation can be tested, plus representative:

- straightforward Seeds;
- ambiguous/unresolved Seeds;
- repeated-but-genuine similar Seeds;
- an accidental retry/idempotency case;
- multiple relationships from one Seed;
- a corrected organization/alias case;
- explicit versus ambiguous commitment language.

Never copy production user data into development merely for convenience.

## Migration review checklist

- Can a clean database be rebuilt?
- Is original Seed provenance preserved?
- Are derived objects and relationships separable from origin captures?
- Are constraints, foreign keys, indexes, timestamps, and deletion behavior intentional?
- Is RLS enabled and are all operations covered?
- Can User A read or mutate User B's row by changing an ID?
- Does retry behavior avoid accidental duplicate creation without removing genuine repeated thoughts?
- Does Snip/Undo behavior match current product claims?
- Does a privileged function validate identity and search path?
- Is the change safe for existing rows and active traffic?
- Is there a recovery plan for a partial or failed rollout?
