# JarvisOS - Dashboard Spec

## Purpose
The dashboard is the living face of JarvisOS.

It should be:
- reliable
- quick to load
- visually clean
- event-driven
- resilient when modules fail
- easy to expand
- easy to trim back

## Required dashboard zones
1. Header bar
   - persona state
   - backend health
   - current model/provider
   - mic state
   - websocket state
2. Main avatar panel
   - animated Jarvis / Delaney avatar
   - status expression states
   - speaking / listening / thinking / warning / idle states
3. Chat and command panel
   - text input
   - command planner output
   - execution confirmation
4. Module cards grid
   - one card per enabled module
   - health, quick actions, latest events
5. Activity stream
   - recent commands, suggestions, errors, reminders
6. Evidence and judge panel
   - confidence
   - sources
   - warnings
7. System panel
   - CPU / RAM / disk / services / logs
8. Memory panel
   - recent memories
   - pinned facts
   - case/project context
9. Screen guidance panel
   - overlay status
   - pointer/highlight mode
10. Settings panel
   - module toggles
   - provider toggles
   - voice controls
   - dashboard preferences

## Reliability principles
- dashboard renders from state snapshot first, websocket updates second
- every widget may fail independently
- stale widgets show degraded state, not white screen death
- backend remains healthy if frontend is down
- frontend reconnects automatically

## Animation model
Do not weld animation logic into business logic.

Use:
- avatar state machine
- event-driven transitions
- fallback static mode
- asset pack abstraction so visuals can evolve later

### Suggested avatar states
- idle
- greeting
- listening
- transcribing
- reasoning
- speaking
- warning
- success
- error
- sleep

## UI module contract
Each module can optionally expose:
- `widget_id`
- `title`
- `priority`
- `health_endpoint`
- `quick_actions`
- `event_topics`
- `settings_schema`

The dashboard reads the registry and renders only enabled widgets.

## Mac and Android future-proofing
Use a shared UI schema:
- cards
- events
- controls
- state flags
- theme tokens

That lets native apps mirror the dashboard without rewriting feature meaning from scratch.
