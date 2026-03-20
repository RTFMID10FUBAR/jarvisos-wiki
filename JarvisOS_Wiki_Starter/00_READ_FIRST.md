# JarvisOS - Read First

This is the master reference pack for the JarvisOS rebuild.

## Mission
Build a stable, modular, Jacob-first assistant platform that:
- runs reliably on JarvisOS first
- keeps one canonical backend spine
- supports a living dashboard
- grows by modules, not by random patches
- can later ship as native Mac and Android clients against the same core APIs
- preserves auditability, rollback, and change integrity

## Current truth
The current codebase has useful subsystems, but its runtime spine drifted:
- service targets and module paths do not agree
- dashboard/API logic exists in more than one shape
- placeholder services still exist
- experiments, backups, and live runtime were mixed together

That means the next step is not "add more parts."
It is "stabilize the spine, then grow."

## Prime directives
1. One canonical backend package.
2. One canonical module registry.
3. One canonical dashboard service.
4. One source of truth for service files.
5. Quarantine before delete.
6. Test before merge.
7. Every mutation updates the docs and manifest.
8. UI modules can be added or removed without breaking the core.

## What this pack contains
- phase roadmap
- system map
- dashboard architecture
- native client plan
- AI collaborator prompts
- change-control rules
- module registry example
- migration ledger template

## How to use this pack
1. Read `01_PHASE_PLAN.md`
2. Read `02_SYSTEM_MAP.md`
3. Read `03_DASHBOARD_SPEC.md`
4. Keep `06_CHANGE_CONTROL.md` open while coding
5. Give `05_AI_COLLAB_PROMPTS.md` to Gemini, Copilot, or GPT before asking them to touch code
