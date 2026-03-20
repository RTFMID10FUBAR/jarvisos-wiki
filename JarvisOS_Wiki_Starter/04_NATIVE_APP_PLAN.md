# JarvisOS - Mac and Android Native App Plan

## Principle
Do not build separate brains.

Build:
- one backend
- one event contract
- one module registry
- many clients

## Backend contract
Required API surfaces:
- `/api/health`
- `/api/session`
- `/api/persona`
- `/api/modules`
- `/api/widgets`
- `/api/chat`
- `/api/command/plan`
- `/api/command/execute`
- `/api/memory/search`
- `/api/voice/state`
- `/api/judge/explain`
- websocket event stream

## Mac client
### Best path
Native shell with local webview or native UI around backend APIs.

### Mac priorities
- menu bar quick actions
- desktop overlay
- mic controls
- drag/drop ingest
- keyboard shortcuts
- screenshot/screen region handoff
- local notifications

## Android client
### Best path
Native shell around backend APIs with optional local capabilities.

### Android priorities
- push-to-talk
- notifications
- task cards
- command approval
- camera/screenshot handoff
- local file ingest
- voice shortcut intents

## Shared design requirements
- same module schema
- same event stream
- same persona model
- same evidence display pattern
- same command approval semantics

## Stability rules
- clients must tolerate unavailable modules
- clients must show feature unavailable rather than crash
- backend feature flags drive visibility
