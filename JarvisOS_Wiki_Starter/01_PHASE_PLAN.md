# JarvisOS - Phase Plan

## Target end state
A production-grade JarvisOS made of:

- a canonical backend package
- modular feature routers
- a reliable animated dashboard
- voice, memory, command, audit, legal, and idea systems
- grounded AI routing between Jarvis and Delaney
- smoke tests, health checks, migration rules, and service discipline
- a clean path to Mac and Android native clients

---

## Phase 0 - Freeze, audit, and protect
### Goal
Stop architecture drift and create a safe rebuild lane.

### Deliverables
- clean code snapshot without venv and clutter
- file inventory
- service inventory
- route inventory
- dependency inventory
- secrets inventory
- stale-path report
- "keep / move / archive / kill" matrix
- baseline health report

### Rules
- no feature additions in this phase
- no direct deletion without quarantine
- no new services until service map is approved

### Exit criteria
- canonical repo root chosen
- active runtime entrypoints identified
- active dashboard code identified
- active secrets and config files isolated

---

## Phase 1 - Canonical spine rebuild
### Goal
Create one real runtime package and stop pretending ghost modules exist.

### Deliverables
- `app/` canonical runtime package
- `app/server.py` main FastAPI entrypoint
- `app/bootstrap.py`
- `app/state.py`
- `app/identity.py`
- `app/router.py`
- `app/events.py`
- `app/judge.py`
- `systemd/` canonical units
- health check endpoint
- startup validation

### Rules
- services may point only to real importable modules
- one production venv only
- app imports must pass in clean shell and service context

### Exit criteria
- main API boots cleanly
- service files load cleanly
- health endpoint passes
- app imports pass
- no `brain.server:app` ghost references remain

---

## Phase 2 - Module system and feature migration
### Goal
Make Jarvis grow by modules, not by patch debris.

### Deliverables
- `modules/` package
- module registry JSON or YAML
- module lifecycle hooks: enable, disable, health, deps
- migrated modules for:
  - actions
  - legal ops
  - memory
  - audit
  - voice
  - ideas
  - recon
  - dashboard bridge
- compatibility wrappers where needed

### Rules
- no module can hard-crash the app on disable
- every module declares config, routes, tasks, deps, and health checks
- module add/remove must be reversible

### Exit criteria
- modules mount from registry
- disabled modules do not break boot
- route map is generated from registry

---

## Phase 3 - Dashboard rebuild
### Goal
Create a reliable visual shell for Jarvis and Delaney.

### Deliverables
- stable dashboard frontend
- websocket event bus
- module cards
- activity stream
- command panel
- memory panel
- legal panel
- voice panel
- ideas panel
- system health panel
- animated Jarvis avatar state machine
- dual persona switcher for Jarvis / Delaney routing
- dashboard persistence for layout and enabled widgets

### Rules
- dashboard may fail soft; it must not take down backend
- frontend modules must read from registry, not hard-coded guesses
- animation layer must degrade gracefully on low-power systems

### Exit criteria
- dashboard survives reloads
- websocket reconnect works
- module cards reflect real module state
- command and voice controls function from dashboard

---

## Phase 4 - Voice, sight, command, and screen guidance
### Goal
Let Jarvis be seen, heard, and useful on-screen.

### Deliverables
- microphone pipeline
- speech-to-text
- text-to-speech
- wake pipeline only when real, not placeholder
- command execution with allowlist and dry-run mode
- screenshot analysis pipeline
- screen pointer / overlay protocol
- "show me" mode for highlighting UI regions
- safe command planner with confirmation thresholds

### Rules
- voice and command execution must log intent, action, result
- no unrestricted shell access by default
- screen guidance must be reversible and disable-able

### Exit criteria
- speech round-trip works
- command planner works with confirmation
- screen overlay can highlight coordinates and regions

---

## Phase 5 - Grounding, judge, and anti-hallucination layer
### Goal
Make Jarvis challenge himself before making claims.

### Deliverables
- evidence retrieval layer
- source tagging
- response judge
- confidence labels
- unsupported-claim blocker
- web/doc/local source adapter framework
- factuality mode flags: draft, grounded, execute-ready

### Rules
- execution suggestions require stronger grounding than casual chat
- unsupported claims must be marked as tentative
- source traces must be inspectable from dashboard

### Exit criteria
- judge can reject unsupported output
- dashboard shows evidence and confidence
- action plans require source-backed rationale

---

## Phase 6 - Native client foundation for Mac and Android
### Goal
Keep one backend, many clients.

### Deliverables
- client API contract
- auth/session model
- Mac native shell plan
- Android native shell plan
- shared design tokens
- module-driven UI schema
- offline/online sync rules
- push/event routing

### Rules
- native clients are shells around the same backend contract
- no client-specific hacks in core module logic
- mobile must degrade gracefully when features are unavailable

### Exit criteria
- dashboard features represented as backend-driven schema
- Mac and Android clients can consume same status and module APIs

---

## Phase 7 - Knowledge base, wiki, and evolution ledger
### Goal
Make the project understandable even when tired, pissed off, or months later.

### Deliverables
- wiki or notebook-ready export pack
- module docs
- service map
- architecture map
- migration ledger
- change log
- prompt packs for external AI helpers
- "what changed and why" snapshots

### Rules
- no code merge without docs update
- every structural change updates the ledger
- notebook export excludes secrets and junk

### Exit criteria
- current architecture visible in one place
- new contributor can understand system from docs alone

---

## Phase 8 - Monetization, grants, and strategic growth
### Goal
Point Jarvis toward sustainable growth without turning him into spamware.

### Deliverables
- idea scoring module
- monetization lead tracker
- grant/research lead tracker
- hardware wish list
- opportunity intake workflow
- evidence-backed recommendation lane

### Rules
- no fake certainty
- opportunities must be tagged with source and risk
- strategy suggestions stay advisory until approved

### Exit criteria
- Jarvis can track opportunities and suggest next actions
- growth ideas show sources, effort, and risk

---

## Recommended execution order
1. Phase 0
2. Phase 1
3. Phase 2
4. Phase 3
5. Phase 5
6. Phase 4
7. Phase 6
8. Phase 7
9. Phase 8

Reason: without spine and module control, the rest becomes another patch graveyard.
