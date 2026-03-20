#!/usr/bin/env bash
set -euo pipefail

SITE_DIR="${1:-$HOME/JarvisOS-Wiki}"
REPO_NAME="${2:-jarvisos-wiki}"
BRANCH="${3:-main}"

mkdir -p "$SITE_DIR/docs"
cd "$SITE_DIR"

cat > requirements.txt <<'REQ'
mkdocs>=1.6
mkdocs-material>=9.5
mkdocs-git-revision-date-localized-plugin>=1.4
mkdocs-minify-plugin>=0.8
REQ

cat > mkdocs.yml <<'YAML'
site_name: JarvisOS Wiki
site_description: Canonical living documentation for JarvisOS
site_url: https://USERNAME.github.io/REPO_NAME/
repo_name: USERNAME/REPO_NAME
repo_url: https://github.com/USERNAME/REPO_NAME
edit_uri: edit/main/docs/
use_directory_urls: true

theme:
  name: material
  features:
    - navigation.tabs
    - navigation.sections
    - navigation.expand
    - navigation.instant
    - navigation.top
    - search.suggest
    - search.highlight
    - content.code.copy
  palette:
    - scheme: slate
      primary: black
      accent: blue
  icon:
    repo: fontawesome/brands/github

plugins:
  - search
  - git-revision-date-localized:
      enable_creation_date: true
  - minify:
      minify_html: true

markdown_extensions:
  - admonition
  - attr_list
  - def_list
  - footnotes
  - md_in_html
  - tables
  - toc:
      permalink: true
  - pymdownx.details
  - pymdownx.superfences
  - pymdownx.highlight:
      anchor_linenums: true
  - pymdownx.inlinehilite
  - pymdownx.snippets
  - pymdownx.tabbed:
      alternate_style: true

nav:
  - Home: index.md
  - Read First: 00_READ_FIRST.md
  - Phase Plan: 01_PHASE_PLAN.md
  - System Map: 02_SYSTEM_MAP.md
  - Dashboard Spec: 03_DASHBOARD_SPEC.md
  - Native App Plan: 04_NATIVE_APP_PLAN.md
  - AI Collaboration Prompts: 05_AI_COLLAB_PROMPTS.md
  - Change Control: 06_CHANGE_CONTROL.md
  - Module Registry: 07_MODULE_REGISTRY_EXAMPLE.md
  - Migration Ledger: 08_MIGRATION_LEDGER_TEMPLATE.md
YAML

cat > docs/index.md <<'MD'
# JarvisOS Wiki

This is the live documentation site for JarvisOS.

## Rules
- Read this wiki before changing code.
- Quarantine before delete.
- Update the migration ledger for every non-trivial change.
- Keep the spine stable; make features modular.

## Sections
- **Phase Plan**: what gets built, and in what order
- **System Map**: canonical structure and runtime map
- **Dashboard Spec**: UI rules and module boundaries
- **Native App Plan**: Mac and Android shells over the same core
- **AI Collaboration Prompts**: prompts for GPT, Gemini, Copilot
- **Change Control**: mutation rules and rollback policy
MD

for f in 00_READ_FIRST 01_PHASE_PLAN 02_SYSTEM_MAP 03_DASHBOARD_SPEC 04_NATIVE_APP_PLAN 05_AI_COLLAB_PROMPTS 06_CHANGE_CONTROL 08_MIGRATION_LEDGER_TEMPLATE; do
  cat > "docs/${f}.md" <<MD
# ${f//_/ }

Replace this page with the corresponding content from your JarvisOS roadmap/wiki pack.
MD
done

cat > docs/07_MODULE_REGISTRY_EXAMPLE.md <<'MD'
# Module Registry Example

```json
{
  "modules": {
    "dashboard": true,
    "voice": true,
    "memory": true,
    "legal_ops": true,
    "recon": false,
    "training": false,
    "delaney": true
  }
}
```
MD

mkdir -p .github/workflows
cat > .github/workflows/deploy-pages.yml <<'YAML'
name: deploy-pages
on:
  push:
    branches: [main]
  workflow_dispatch:
permissions:
  contents: read
  pages: write
  id-token: write
concurrency:
  group: pages
  cancel-in-progress: true
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.11'
      - run: pip install -r requirements.txt
      - run: mkdocs build --strict
      - uses: actions/upload-pages-artifact@v3
        with:
          path: site
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    needs: build
    runs-on: ubuntu-latest
    steps:
      - id: deployment
        uses: actions/deploy-pages@v4
YAML

cat > push_to_github.sh <<'EOF2'
#!/usr/bin/env bash
set -euo pipefail
REPO_URL="$1"
BRANCH="${2:-main}"

git init
git checkout -b "$BRANCH"
git add .
git commit -m "Initial JarvisOS wiki"
git remote add origin "$REPO_URL"
git push -u origin "$BRANCH"
EOF2
chmod +x push_to_github.sh

cat > local_preview.sh <<'EOF3'
#!/usr/bin/env bash
set -euo pipefail
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve -a 127.0.0.1:8001
EOF3
chmod +x local_preview.sh

echo "Created site scaffold at: $SITE_DIR"
echo "Next:"
echo "  1) replace placeholder docs with your real roadmap/wiki markdown"
echo "  2) run ./local_preview.sh"
echo "  3) create GitHub repo and run ./push_to_github.sh <repo-url>"
echo "  4) in GitHub: Settings > Pages > Source = GitHub Actions"
