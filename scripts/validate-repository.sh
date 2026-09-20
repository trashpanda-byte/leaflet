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
  echo "package.json detected. Application-specific CI must be configured and documented as part of TASK-0001."
else
  echo "Greenfield application not scaffolded yet; repository contract validation only."
fi

echo "Repository contract is valid."
