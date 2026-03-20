# File Quarantine Rules

1. Quarantine before delete.
2. Snapshot before structural change.
3. No service may point to a nonexistent module.
4. Old modules move to `archive/` first.
5. Unknown files are marked `unknown`, not deleted.
