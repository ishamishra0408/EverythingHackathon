#!/bin/bash
# Exports the autopilot's scheduled tasks into a copy-paste pack for the
# Claude desktop "Scheduled tasks" UI (New task dialog).
# Usage: ./scripts/export-scheduled-tasks.sh   (writes scripts/scheduled-tasks-setup.md and prints it)

set -euo pipefail
TASKS_DIR="$HOME/.claude/scheduled-tasks"
OUT="$(cd "$(dirname "$0")/.." && pwd)/scripts/scheduled-tasks-setup.md"

declare -a IDS=("luma-hackathon-scout" "devansh-weekly-registration" "luma-approval-check" "devansh-backfill-2026-08-02")
declare -a WHEN=("Every Friday at 6:00 PM" "Every Friday at 7:00 PM" "Every Monday at 12:00 PM" "One time — today 10:00 AM (skip if already run)")

{
  echo "# Scheduled tasks — copy-paste pack for the Claude UI"
  echo
  echo "For each task below: New task → paste the Name, pick the Schedule, paste the full Prompt."
  echo "IMPORTANT: after adding them in the UI, tell Claude — the duplicates in the CLI store"
  echo "must be disabled so nothing fires twice."
  echo
  for i in "${!IDS[@]}"; do
    id="${IDS[$i]}"
    skill="$TASKS_DIR/$id/SKILL.md"
    [ -f "$skill" ] || { echo "## $id — SKILL.md NOT FOUND, skip"; continue; }
    echo "---"
    echo
    echo "## Task: $id"
    echo
    echo "**Schedule to select:** ${WHEN[$i]}"
    echo
    echo "**Prompt to paste:**"
    echo
    echo '```'
    # strip the frontmatter block, keep the prompt body
    awk 'BEGIN{fm=0} /^---$/{fm++; next} fm!=1' "$skill"
    echo '```'
    echo
  done
} > "$OUT"

echo "Wrote $OUT"
echo
cat "$OUT" | head -20
