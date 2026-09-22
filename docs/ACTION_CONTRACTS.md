# Action contracts

## Purpose

Leaflet separates **understanding an instruction** from **executing a domain action**.

The deterministic Seed resolver may recognize a clear request before the corresponding subsystem exists. It emits a typed action intent; a domain service validates and executes that intent only when that capability is implemented.

This prevents the Seed core from owning calendar, task, messaging, or other subsystem logic.

## Flow

```text
Seed
  ↓
SeedResolver
  ↓
typed ActionIntent
  ↓
domain validator / executor
  ↓
ActionReceipt
  ↓
UI result + optional Undo
```

Recognition is not execution. Leaflet must never claim an action succeeded merely because it parsed the request.

## Initial action intents

Keep the initial allowlist deliberately small.

### create_task

Conceptual payload:

```ts
type CreateTaskIntent = {
  type: "create_task";
  sourceSeedId: string;
  title: string;
  dueAt?: string;
  timeZone?: string;
};
```

### create_event

Conceptual payload:

```ts
type CreateEventIntent = {
  type: "create_event";
  sourceSeedId: string;
  title: string;
  startsAt: string;
  endsAt?: string;
  durationMinutes?: number;
  timeZone: string;
};
```

These shapes define the product seam, not final TypeScript or database schemas. Add fields only when real behavior requires them.

## Action execution

An executor must validate:

- authenticated user and ownership;
- action allowlist and payload schema;
- temporal values and timezone;
- idempotency / retry identity;
- duplicate external/domain effects;
- confirmation policy;
- whether the action is currently supported;
- reversibility / Undo policy.

A successful execution returns an application-level receipt conceptually containing:

```ts
type ActionReceipt = {
  actionId: string;
  type: string;
  status: "executed" | "failed" | "undone";
  targetId?: string;
  reversible: boolean;
  undoToken?: string;
};
```

Do not build a generic event-sourcing framework merely to satisfy this contract.

## Seed lifecycle after actions

When a clear action fully satisfies the Seed and execution succeeds, the source Seed becomes **resolved** automatically unless part of the Seed still needs attention.

Example:

```text
"Put gym on Tuesday at 5"
  → create_event intent
  → Schedule service executes successfully
  → Event exists
  → source Seed becomes resolved
  → "Scheduled Tuesday at 5." + Undo
```

If execution fails or the relevant subsystem does not exist yet:

- preserve the original Seed;
- do not show false success;
- record the failed/unsupported action state where appropriate;
- leave the Seed active or unresolved so it can be retried or revisited.

## Undo

Undo is a domain capability, not a UI-only illusion.

The executor that performs a reversible action owns the corresponding reversal logic. The UI receives an opaque undo token/receipt rather than reconstructing reversal behavior itself.

Undo duration and permanent retention policy remain product decisions that may vary by action.

## Failure and transaction rule

The source capture has higher durability priority than any derived action.

If a derived action fails after the Seed was captured, the Seed remains safely stored. Do not discard the user's thought because scheduling, task creation, or another downstream operation failed.

Within a single database operation, use transactions where they preserve consistency. Across subsystem or provider boundaries, record explicit success/failure and support safe retry rather than pretending distributed operations are atomic.

## Future AI

A future model may propose the same typed ActionIntent shape. It does not receive a privileged execution path.

```text
deterministic resolver ─┐
                       ├→ same validator/executor
future AI proposal ─────┘
```

Application code remains the authority.
