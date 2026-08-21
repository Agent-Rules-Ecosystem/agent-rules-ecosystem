#!/usr/bin/env bash
# ==============================================================================
# 🌐 Agent Rules Ecosystem — Script de Sincronización Canónica (Bash)
# Organización: xolotl-hub (https://github.com/xolotl-hub)
#
# Uso:
#   cd /ruta/hacia/tu-directorio-raiz
#   bash agent-rules-ecosystem/scripts/sync_ecosystem.sh
# ==============================================================================

set -e

GH_ORG="xolotl-hub"

# Detectar directorio raíz (si se ejecuta dentro de agent-rules-ecosystem, subir un nivel)
CURRENT_DIR="$(pwd)"
if [ "$(basename "$CURRENT_DIR")" = "agent-rules-ecosystem" ]; then
  BASE_DIR="$(dirname "$CURRENT_DIR")"
else
  BASE_DIR="$CURRENT_DIR"
fi

echo "========================================================"
echo "🚀 Sincronizando Ecosistema xolotl-hub"
echo "📂 Directorio Raíz: $BASE_DIR"
echo "========================================================"

# Mapa de Directorios y Repositorios [Directorio_Padre:Subcarpeta:Nombre_Repo]
REPOS=(
  # Cores de Gobernanza
  "Backend::backend-agent-rules"
  "Flutter::flutter-agent-rules"
  "Game::game-agent-rules"
  "Web::web-agent-rules"

  # Transversales
  "Transversal::infra-agent-skill"
  "Transversal::monitoring-agent-skill"
  "Transversal::security-agent-skill"

  # Skills Flutter
  "Flutter:flutter-agent-skill:flutter-bloc-patterns-agent-skill"
  "Flutter:flutter-agent-skill:flutter-firebase-auth-agent-skill"
  "Flutter:flutter-agent-skill:flutter-firebase-odoo-agent-skill"

  # Skills Web
  "Web:web-agent-skill:web-svelte-patterns-agent-skill"
  "Web:web-agent-skill:web-realtime-agent-skill"
  "Web:web-agent-skill:three-js-agent-skills"

  # Skills Backend
  "Backend:backend-agent-skill:backend-auth-oauth-agent-skill"
  "Backend:backend-agent-skill:backend-graphql-agent-skill"
  "Backend:backend-agent-skill:backend-stripe-agent-skill"

  # Skills Game (Godot)
  "Game:game-agent-skill:godot-steamworks-agent-skill"
  "Game:game-agent-skill:godot-firebase-agent-skill"
  "Game:game-agent-skill:godot-mobile-monetization-agent-skill"
  "Game:game-agent-skill:godot-dialogue-plugin-agent-skill"
  "Game:game-agent-skill:godot-nakama-agent-skill"
)

# 1. Crear carpetas principales
mkdir -p "$BASE_DIR/Backend" "$BASE_DIR/Flutter" "$BASE_DIR/Game" "$BASE_DIR/Transversal" "$BASE_DIR/Web"

# 2. Procesar cada repositorio
for ENTRY in "${REPOS[@]}"; do
  IFS=":" read -r PARENT_DIR SUB_DIR REPO_NAME <<< "$ENTRY"
  
  if [ -n "$SUB_DIR" ]; then
    PARENT_PATH="$BASE_DIR/$PARENT_DIR/$SUB_DIR"
  else
    PARENT_PATH="$BASE_DIR/$PARENT_DIR"
  fi
  
  mkdir -p "$PARENT_PATH"
  TARGET_PATH="$PARENT_PATH/$REPO_NAME"
  REPO_URL="https://github.com/$GH_ORG/$REPO_NAME.git"

  echo "--------------------------------------------------------"
  echo "🔍 Procesando: $PARENT_DIR/${SUB_DIR:+$SUB_DIR/}$REPO_NAME"

  if [ -d "$TARGET_PATH/.git" ]; then
    echo "✅ Repositorio presente en $TARGET_PATH."
    if (cd "$TARGET_PATH" && git remote | grep -q "origin" 2>/dev/null); then
      echo "   Actualizando desde origin..."
      (cd "$TARGET_PATH" && git pull origin main 2>/dev/null || true)
    fi
  else
    echo "📥 Clonando desde $REPO_URL ..."
    if ! git clone "$REPO_URL" "$TARGET_PATH" 2>/dev/null; then
      echo "⚠️  Remoto no disponible o sin publicar. Inicializando repositorio Git local..."
      mkdir -p "$TARGET_PATH"
      (cd "$TARGET_PATH" && git init)
    fi
  fi
done

echo "========================================================"
echo "🎉 Estructura completada y sincronizada correctamente."
echo "========================================================"
