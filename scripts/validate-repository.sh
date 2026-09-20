#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "README.md"
  "CLAUDE.md"
  "AGENTS.md"
  "docs/PRODUCT.md"
  "docs/DESIGN.md"
  "docs/ARCHITECTURE.md"
  "docs/DATABASE.md"
  "docs/SECURITY.md"
  "docs/AI_ARCHITECTURE.md"
  "docs/STATUS.md"
  "docs/DECISIONS.md"
  "docs/ai/CONSTITUTION.md"
  "docs/ai/DEFINITION_OF_DONE.md"
  "tasks/TEMPLATE.md"
)

for file in "${required_files[@]}"; do
  if [[ ! -s "$file" ]]; then
    echo "Missing or empty required file: $file" >&2
    exit 1
  fi
done

while IFS= read -r tracked_env; do
  if [[ "$tracked_env" != ".env.example" ]]; then
    echo "Private environment file is tracked: $tracked_env" >&2
    exit 1
  fi
done < <(git ls-files '.env' '.env.*')

# Keep likely credential values out of output while still blocking the commit.
secret_pattern='(sk-ant-[A-Za-z0-9_-]{16,}|sk-proj-[A-Za-z0-9_-]{16,}|sb_secret_[A-Za-z0-9_-]{16,}|gh[pousr]_[A-Za-z0-9]{20,})'
if git grep -I -q -E "$secret_pattern" -- . ':!scripts/validate-repository.sh'; then
  echo "A tracked file appears to contain a live credential. Rotate it and remove it from Git history before continuing." >&2
  exit 1
fi

if [[ -f package.json ]]; then
  application_workflow=".github/workflows/repository-contract.yml"
  required_ci_commands=(
    "npm ci"
    "npm run typecheck"
    "npm run doctor"
  )

  if [[ ! -s "$application_workflow" ]]; then
    echo "Application scaffold detected without an application CI workflow." >&2
    exit 1
  fi

  application_workflow_contents="$(<"$application_workflow")"
  for command in "${required_ci_commands[@]}"; do
    if [[ "$application_workflow_contents" != *"$command"* ]]; then
      echo "Application CI is missing required command: $command" >&2
      exit 1
    fi
  done

  echo "Application-specific CI commands are configured."
else
  echo "Greenfield application not scaffolded yet; repository contract validation only."
fi

echo "Repository contract is valid."
