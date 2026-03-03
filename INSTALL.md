# Installing SchwarzWorker

## One-command install (recommended)

From any directory:

```bash
npx schwarz-worker
```

You'll be prompted: **Install globally (~/.config/opencode/) or locally (./.opencode/)? (g/l)**

- **Global** — All projects use the same install. Target: `~/.config/opencode/` (or `%USERPROFILE%\.config\opencode` on Windows).
- **Local** — Current project only. Target: `./.opencode/`.

### Non-interactive

```bash
# Global
npx schwarz-worker --global
npx schwarz-worker -g

# Local (current project)
npx schwarz-worker --local
npx schwarz-worker -l
```

### Reinstall / overwrite

```bash
npx schwarz-worker --global --force
npx schwarz-worker -g -f
```

### Verify installation

```bash
npx schwarz-worker --check
npx schwarz-worker --check --local   # check .opencode/ in cwd
```

### Custom config directory

Set `OPENCODE_CONFIG_DIR` before running the installer (e.g. for Docker or custom paths):

```bash
# Linux / macOS
OPENCODE_CONFIG_DIR=/path/to/opencode npx schwarz-worker --global

# Windows (PowerShell)
$env:OPENCODE_CONFIG_DIR = "C:\path\to\opencode"; npx schwarz-worker -g
```

---

## What gets installed

| From package     | To (under target)   |
|------------------|----------------------|
| `commands/szw/`  | `commands/szw/`      |
| `workflows/`     | `workflows/`         |
| `agents/`        | `agents/`            |
| `references/`    | `references/`        |
| `templates/`     | `templates/`        |
| `docs/`          | `docs/`              |
| (version)        | `VERSION`            |

Paths like `@workflows/phase-flow.md` and `@agents/szw-verifier.md` are resolved relative to this target. Use a single install root so OpenCode finds all assets.

---

## After install

1. **Restart OpenCode** so it loads the new commands.
2. Run **`/szw-help`** to see the SchwarzWorker command list.
3. In a project directory, run **`/szw-new-project`** to create `.planning/` and confirm the system works.

---

## Manual install (no npm)

If you prefer not to use npx, copy the same directories from the repo into your OpenCode config:

- **Global:** copy into `~/.config/opencode/` (or your `OPENCODE_CONFIG_DIR`).
- **Local:** copy into `./.opencode/` in the project root.

See the table above for which folders to copy. Commands live under `commands/szw/`.
