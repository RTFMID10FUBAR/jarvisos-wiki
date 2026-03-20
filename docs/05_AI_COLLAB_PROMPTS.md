# JarvisOS - AI Collaborator Prompts

Use these prompts before asking Gemini, Copilot, GPT, Claude, or anything else to touch JarvisOS.

## Master instruction
Read the following before proposing or changing code:
- phase plan
- system map
- dashboard spec
- change control
- module registry
- service map

Do not invent architecture that conflicts with those files.

## Prompt 1 - understand the current code before editing
You are assisting on JarvisOS. Before proposing code, analyze the supplied files and answer:
1. what this code currently does
2. what it claims to do but does not actually do
3. what parts are production-critical
4. what parts appear stale, duplicate, or deprecated
5. what dependencies and services this code actually requires
6. what exact migration path would preserve current behavior while moving toward the canonical JarvisOS architecture

Constraints:
- do not propose placeholders
- do not remove working features
- do not invent ghost module paths
- keep one canonical backend spine
- quarantine before delete
- call out uncertain assumptions explicitly

## Prompt 2 - propose a safe refactor
Refactor the supplied JarvisOS code into the canonical structure defined by the docs.
Requirements:
- preserve existing working behavior
- separate app spine from feature modules
- keep dashboard functionality
- produce a migration list
- produce exact file move list
- produce exact imports to update
- produce exact service changes
- no placeholders
- no silent feature deletions

## Prompt 3 - dashboard repair
Analyze the current dashboard and API code. Produce:
- a route map
- missing endpoints
- broken assumptions
- websocket needs
- UI state model
- exact steps to rebuild the dashboard into a reliable modular shell
Do not remove existing useful features. Fix and preserve them.

## Prompt 4 - service cleanup
Given the current systemd units and code tree:
- identify every stale path
- identify every ghost import target
- propose one canonical service map
- output corrected service files
- list which services should be disabled, merged, or retired

## Prompt 5 - native client extraction
Given the backend and dashboard code:
- define the shared API contract for Mac and Android
- define reusable state and event schemas
- separate backend-driven widgets from client shell implementation
- do not create a second brain

## Prompt 6 - notebook/wiki export
Analyze the repository and generate a notebook-ready architecture digest:
- system overview
- modules
- services
- dependencies
- change history
- current risks
- migration plan
Exclude secrets, caches, venv, backups, and archive debris.

## Always include this warning
If you are uncertain whether a file is live, stale, or historically important, say so plainly and recommend quarantine, not deletion.
