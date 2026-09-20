# Database workflow

## Source of truth

The repository's ordered migrations are the authoritative schema history. Do not rely on undocumented edits in the Supabase dashboard.

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

## Seed data

Local seed data must be synthetic and reproducible. It should include at least two users so cross-user isolation can be tested, plus representative thoughts, topics, goals, tasks, and events. Never copy production user data into development merely for convenience.

## Migration review checklist

- Can a clean database be rebuilt?
- Are constraints, foreign keys, indexes, timestamps, and deletion behavior intentional?
- Is RLS enabled and are all operations covered?
- Can User A read or mutate User B's row by changing an ID?
- Does a privileged function validate identity and search path?
- Is the change safe for existing rows and active traffic?
- Is there a recovery plan for a partial or failed rollout?
