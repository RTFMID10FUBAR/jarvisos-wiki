# JarvisOS - System Map

## Canonical target tree

```text
/opt/JarvisOS
├── app/                # canonical runtime package
│   ├── __init__.py
│   ├── server.py       # FastAPI app entrypoint
│   ├── bootstrap.py    # startup sequence and validation
│   ├── router.py       # router mounting
│   ├── state.py        # global app state
│   ├── events.py       # event bus / websocket broker
│   ├── identity.py     # Jacob-first config and persona policy
│   ├── judge.py        # grounding and confidence checks
│   └── deps.py         # common dependencies
├── modules/            # feature modules
│   ├── actions/
│   ├── audit/
│   ├── legal_ops/
│   ├── memory/
│   ├── voice/
│   ├── ideas/
│   ├── recon/
│   ├── screen/
│   └── ui_bridge/
├── ui/                 # dashboard frontend
│   ├── web/
│   ├── assets/
│   ├── widgets/
│   └── avatar/
├── clients/
│   ├── mac/
│   └── android/
├── memory/             # data stores
├── config/             # env, yaml, json, persona, registry
├── docs/               # source of truth docs
├── systemd/            # only canonical units
├── scripts/            # install, migrate, export, smoke test
├── tests/              # smoke + integration tests
├── archive/            # fossils, old backups, retired modules
└── venv/               # single production venv
```

## Runtime responsibilities
### app/
Owns the production boot path, health, app state, event bus, shared deps, and grounding rules.

### modules/
Owns business capabilities. Every module declares:
- routes
- settings
- dependencies
- background tasks
- health checks
- UI widgets
- command capabilities
- whether Delaney, Jarvis, or both may use it

### ui/
Owns the dashboard only. No core business logic here.

### clients/
Owns native shells that consume backend APIs and event streams.

### memory/
Owns stores and retrieval, not business logic routing.

### config/
Owns declarative truth:
- enabled modules
- persona config
- service ports
- provider routing
- policy thresholds

### archive/
Owns dead and retired material. Live runtime never imports from here.

## High-level data flow
1. Client sends event or prompt.
2. `app/server.py` receives request.
3. `app/identity.py` and `app/judge.py` determine routing and policy.
4. `app/router.py` routes to a module.
5. Module performs work.
6. Event/result is published to dashboard and logs.
7. Judge annotates confidence, evidence, and execution risk.
8. UI reflects state.

## Persona model
### Jarvis
- operator
- calm planner
- execution and diagnostics heavy
- system guidance first

### Delaney
- companion / relational mode
- softer interaction
- still respects same grounding and safety gates

Both personas share:
- same memory spine
- same module registry
- same judge
- same action policy
