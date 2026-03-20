# JarvisOS - Change Control

## Non-negotiable rules
1. Read the docs before mutating code.
2. Snapshot before structural changes.
3. Quarantine before delete.
4. One canonical runtime path only.
5. No service may point to a nonexistent import target.
6. No dashboard rewrite may remove feature parity without logging it.
7. Every change updates the change log and migration ledger.
8. New modules must be optional and removable.
9. Secrets never go in notebook exports.
10. Do not merge code that cannot explain its own boot path.

## Required change packet
Every meaningful change should record:
- date/time
- purpose
- files changed
- imports changed
- service impact
- module impact
- rollback notes
- test results
- known risks

## Merge gate
Do not call a change done unless:
- app imports pass
- health endpoint passes
- relevant module health checks pass
- dashboard still loads
- service files validate
- docs updated

## Red flags
Stop and review if:
- a service path references an old home
- a module path is guessed
- a feature is removed because it is inconvenient
- there is more than one active venv
- the dashboard depends on direct filesystem hacks
