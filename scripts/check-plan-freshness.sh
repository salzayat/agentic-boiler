#!/bin/sh
set -eu

# Warn-only: checks the Milestone Tracking table in
# plans/autonomous-vertical-slice-plan.md against the actual archive/task-completion
# state of each listed governing change. Catches the same class of drift
# check-spec-policy-references.sh catches for specs: a hand-maintained status label
# that no longer matches reality because changes underneath it were completed and
# archived without anyone updating the table.
#
# This cannot verify prose like "Blocked by X" is still an accurate description of
# why a phase is blocked; it only flags the two mechanically checkable cases: a
# named change that does not exist anywhere, and a phase whose every governing
# change is fully archived while its Status cell does not say so.

plan="plans/roadmap.md"

if [ ! -f "$plan" ]; then
  printf '%s\n' "OpenSpec plan-freshness check passed (warn-only, no plan file found)"
  exit 0
fi

python3 <<EOF
import re
from pathlib import Path

plan_path = Path("$plan")
changes_root = Path("openspec/changes")
archive_root = changes_root / "archive"

text = plan_path.read_text(encoding="utf-8")
table_match = re.search(
    r"^\|\s*Phase\s*\|\s*Governing changes\s*\|\s*Status\s*\|.*?\n\|[- |]+\n((?:\|.*\n)+)",
    text,
    re.M,
)
if not table_match:
    print("OpenSpec plan-freshness check passed (warn-only, no milestone table found)")
    raise SystemExit(0)

archived_by_name = {}
for entry in archive_root.glob("*"):
    if entry.is_dir():
        # archived directories are named YYYY-MM-DD-<change-name>
        name = re.sub(r"^\d{4}-\d{2}-\d{2}-", "", entry.name)
        archived_by_name[name] = entry

def change_status(name: str) -> str:
    if name in archived_by_name:
        return "archived"
    pending = changes_root / name / "tasks.md"
    if pending.is_file():
        tasks_text = pending.read_text(encoding="utf-8")
        total = len(re.findall(r"^- \[[ x]\]", tasks_text, re.M))
        done = len(re.findall(r"^- \[x\]", tasks_text, re.M))
        if total == 0:
            return "pending (no tasks.md checklist)"
        if done == total:
            return "pending (all tasks checked, not archived)"
        return f"pending ({done}/{total} tasks)"
    return "MISSING (not found under openspec/changes/ or openspec/changes/archive/)"

findings = []
for row in table_match.group(1).splitlines():
    cells = [c.strip() for c in row.strip().strip("|").split("|")]
    if len(cells) < 3:
        continue
    phase, governing, status = cells[0], cells[1], cells[2]
    names = re.findall(r"\`([a-z0-9-]+)\`", governing)
    if not names:
        continue
    statuses = {name: change_status(name) for name in names}
    missing = [n for n, s in statuses.items() if s.startswith("MISSING")]
    all_archived = all(s == "archived" for s in statuses.values())
    # Only treat the status as an unqualified completion claim, e.g. "Complete" or
    # "Complete.", not a partial/qualified one like "2 of 3 complete; blocked on X" —
    # a substring match on "complete" would flag the latter as a false positive.
    status_claims_complete = bool(re.fullmatch(r"complete[d]?\.?", status.strip(), re.I))

    if missing:
        findings.append(
            f"- Phase '{phase}' references change(s) not found anywhere: {', '.join(missing)}"
        )
    if all_archived and not status_claims_complete:
        findings.append(
            f"- Phase '{phase}' has every governing change archived, but its Status cell "
            f"still reads '{status}'"
        )
    if status_claims_complete and not all_archived:
        detail = "; ".join(f"{n}: {s}" for n, s in statuses.items() if s != "archived")
        findings.append(
            f"- Phase '{phase}' Status cell reads '{status}', but not every governing change "
            f"is archived ({detail})"
        )

print("Phase completion snapshot:")
for row in table_match.group(1).splitlines():
    cells = [c.strip() for c in row.strip().strip("|").split("|")]
    if len(cells) < 3:
        continue
    phase, governing, status = cells[0], cells[1], cells[2]
    names = re.findall(r"\`([a-z0-9-]+)\`", governing)
    if not names:
        continue
    summary = ", ".join(f"{n}={change_status(n)}" for n in names)
    print(f"  {phase} [{status}]: {summary}")

if findings:
    print()
    print("Possible plan drift:")
    for line in findings:
        print(line)

print()
print("OpenSpec plan-freshness check passed (warn-only)")
EOF
