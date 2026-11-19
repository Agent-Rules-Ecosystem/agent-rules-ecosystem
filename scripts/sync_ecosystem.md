# 🌐 Sincronización Canónica del Ecosistema (`sync_ecosystem`)

> **Formato 100% Declarativo Markdown**. Especificación multiplataforma (Bash / PowerShell) para clonar o actualizar los 12 Cores (`*-agent-rules`) y las 30 Skills (`*-agent-skill`) de [`Agent-Rules-Ecosystem`](https://github.com/Agent-Rules-Ecosystem) usando SSH.
> Fuente de verdad del árbol de directorios: [`ESTRUCTURA_CLONACION.md`](../ESTRUCTURA_CLONACION.md).

## 📜 Referencia Bash (`sync_ecosystem.sh`)

```bash
#!/usr/bin/env bash
set -e

GH_ORG="Agent-Rules-Ecosystem"
CURRENT_DIR="$(pwd)"
if [ "$(basename "$CURRENT_DIR")" = "agent-rules-ecosystem" ]; then
  BASE_DIR="$(dirname "$CURRENT_DIR")"
else
  BASE_DIR="$CURRENT_DIR"
fi

REPOS=(
  # Cores de Gobernanza (*-agent-rules)
  "Backend::backend-agent-rules"
  "Flutter::flutter-agent-rules"
  "Game::game-agent-rules"
  "Go::go-agent-rules"
  "Kotlin::kotlin-agent-rules"
  "MultiCore::multicore-agent-rules"
  "Python::python-agent-rules"
  "Rust::rust-agent-rules"
  "SecondBrain::second-brain-agent-rules"
  "Swift::swift-agent-rules"
  "Web::web-agent-rules"
  "Web3::solidity-agent-rules"

  # Transversales
  "Transversal::firebase-auth-agent-skill"
  "Transversal::grapho-agent-skill"
  "Transversal::grapho-3d-visualizer-agent-skill"
  "Transversal::i18n-agent-skill"
  "Transversal::infra-agent-skill"
  "Transversal::monitoring-agent-skill"
  "Transversal::performance-agent-skill"
  "Transversal::security-agent-skill"
  "Transversal::telemetry-agent-skill"

  # Skills por Dominio
  "Flutter:flutter-agent-skill:flutter-bloc-patterns-agent-skill"
  "Flutter:flutter-agent-skill:flutter-firebase-odoo-agent-skill"
  "Flutter:flutter-agent-skill:flutter-payments-agent-skill"
  "Web:web-agent-skill:browser-extensions-agent-skill"
  "Web:web-agent-skill:web-react-agent-skill"
  "Web:web-agent-skill:web-svelte-agent-skill"
  "Web:web-agent-skill:web-realtime-agent-skill"
  "Web:web-agent-skill:three-js-agent-skills"
  "Web:web-agent-skill:wordpress-agent-skill"
  "Backend:backend-agent-skill:backend-auth-oauth-agent-skill"
  "Backend:backend-agent-skill:backend-graphql-agent-skill"
  "Backend:backend-agent-skill:backend-stripe-agent-skill"
  "Game:game-agent-skill:godot-steamworks-agent-skill"
  "Game:game-agent-skill:godot-firebase-agent-skill"
  "Game:game-agent-skill:godot-mobile-monetization-agent-skill"
  "Game:game-agent-skill:godot-dialogue-plugin-agent-skill"
  "Game:game-agent-skill:godot-nakama-agent-skill"
  "Go:go-agent-skill:go-plc-modbus-agent-skill"
  "Python:python-agent-skill:python-blender-addon-agent-skill"
  "Rust:rust-agent-skill:rust-plc-modbus-agent-skill"
  "SecondBrain:second-brain-agent-skill:lore-agent-skill"
)

for ENTRY in "${REPOS[@]}"; do
  IFS=":" read -r PARENT_DIR SUB_DIR REPO_NAME <<< "$ENTRY"
  if [ -n "$SUB_DIR" ]; then
    TARGET_PATH="$BASE_DIR/$PARENT_DIR/$SUB_DIR/$REPO_NAME"
    mkdir -p "$BASE_DIR/$PARENT_DIR/$SUB_DIR"
  else
    TARGET_PATH="$BASE_DIR/$PARENT_DIR/$REPO_NAME"
    mkdir -p "$BASE_DIR/$PARENT_DIR"
  fi
  REPO_URL="git@github.com:$GH_ORG/$REPO_NAME.git"

  if [ -d "$TARGET_PATH/.git" ]; then
    (cd "$TARGET_PATH" && git pull origin main 2>/dev/null || true)
  else
    if ! git clone "$REPO_URL" "$TARGET_PATH" 2>/dev/null; then
      mkdir -p "$TARGET_PATH"
      (cd "$TARGET_PATH" && git init)
    fi
  fi
done
```

## 📜 Equivalente PowerShell (`sync_ecosystem.ps1`)

```powershell
$GH_ORG = "Agent-Rules-Ecosystem"
$currentPath = Get-Location
$baseDir = if ((Split-Path -Leaf $currentPath) -eq "agent-rules-ecosystem") { Split-Path -Parent $currentPath } else { $currentPath.Path }

# Replicar el mismo listado de 12 Cores + 30 Skills que en el bloque Bash anterior
# usando clonación SSH: git@github.com:$GH_ORG/<repo>.git
```
