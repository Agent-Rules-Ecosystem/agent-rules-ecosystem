# 📂 Protocolo e Instrucciones de Estructuración y Clonación

Este documento contiene las **instrucciones canónicas para que cualquier Agente de IA o desarrollador** cree la estructura de carpetas local y clone todos los repositorios del ecosistema [xolotl-hub](https://github.com/xolotl-hub).

---

## 🌳 Árbol Canónico de Directorios

La raíz del espacio de trabajo se puede ubicar en cualquier directorio local elegido por el usuario y se organiza con el siguiente esquema:

```text
<tu-directorio-raiz>/
├── agent-rules-ecosystem/       # Repositorio Núcleo y Manifiesto Maestro
├── Backend/
│   ├── backend-agent-rules/     # Gobernanza y protocolos Backend
│   └── backend-agent-skill/     # Habilidades y patrones Backend
│       ├── backend-auth-oauth-agent-skill/
│       ├── backend-graphql-agent-skill/
│       └── backend-stripe-agent-skill/
├── Flutter/
│   ├── flutter-agent-rules/     # Gobernanza y protocolos Flutter
│   └── flutter-agent-skill/     # Habilidades y patrones Flutter
│       ├── flutter-bloc-patterns-agent-skill/
│       ├── flutter-firebase-auth-agent-skill/
│       └── flutter-firebase-odoo-agent-skill/
├── Game/
│   ├── game-agent-rules/        # Gobernanza y protocolos Game Dev
│   └── game-agent-skill/        # Habilidades y patrones Game Dev
│       ├── godot-steamworks-agent-skill/
│       ├── godot-firebase-agent-skill/
│       ├── godot-mobile-monetization-agent-skill/
│       ├── godot-dialogue-plugin-agent-skill/
│       └── godot-nakama-agent-skill/
├── Transversal/
│   ├── infra-agent-skill/       # Habilidades de Docker, CI/CD e Infraestructura
│   ├── monitoring-agent-skill/  # Habilidades de Logging y Telemetría
│   └── security-agent-skill/    # Habilidades de Seguridad y OWASP
└── Web/
    ├── web-agent-rules/         # Gobernanza y protocolos Web (React/Next/Vite)
    └── web-agent-skill/         # Habilidades y patrones Web
        ├── web-svelte-patterns-agent-skill/
        ├── web-realtime-agent-skill/
        └── three-js-agent-skills/
```

---

## 🤖 Instrucciones para el Agente de IA

Cuando el usuario pida: **"Inicializa o sincroniza la estructura del ecosistema"**, el Agente de IA debe ejecutar las siguientes acciones:

1. **Ubicación Base**: Validar que la ejecución ocurra en el directorio raíz elegido para el ecosistema.
2. **Verificación de Carpetas**: Garantizar la existencia de los 5 bloques principales (`Backend`, `Flutter`, `Game`, `Transversal`, `Web`, `agent-rules-ecosystem`).
3. **Clonación / Verificación Git**:
   - Para cada submódulo o repositorio de gobernanza (`*-agent-rules`), clonar en la raíz de su categoría (`<Dominio>/<dominio>-agent-rules`).
   - Para las skills especializadas, clonar dentro del subdirectorio contenedor `<Dominio>/<dominio>-agent-skill/<nombre-skill>/`.
   - Para las skills transversales, clonar directamente en `Transversal/<nombre-skill>/`.
   - Si el repositorio remoto aún no existe en GitHub, inicializar `git init` localmente para dejar la estructura lista.

---

## ⚡ Script de Automatización Bash (Ejecutable)

El siguiente script puede ser ejecutado directamente por la terminal o por el agente para automatizar la clonación completa:

```bash
#!/usr/bin/env bash
set -e

# Nombre de usuario / Organización GitHub
GH_ORG="xolotl-hub"
BASE_DIR="$(pwd)"

echo "🚀 Iniciando sincronización del ecosistema para: $GH_ORG"

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

# 2. Clonar o Inicializar cada repositorio
for ENTRY in "${REPOS[@]}"; do
  IFS=":" read -r PARENT_DIR SUB_DIR REPO_NAME <<< "$ENTRY"
  if [ -n "$SUB_DIR" ]; then
    TARGET_PATH="$BASE_DIR/$PARENT_DIR/$SUB_DIR/$REPO_NAME"
    mkdir -p "$BASE_DIR/$PARENT_DIR/$SUB_DIR"
  else
    TARGET_PATH="$BASE_DIR/$PARENT_DIR/$REPO_NAME"
  fi
  REPO_URL="https://github.com/$GH_ORG/$REPO_NAME.git"

  echo "------------------------------------------------"
  echo "🔍 Procesando: $TARGET_PATH"

  if [ -d "$TARGET_PATH/.git" ]; then
    echo "✅ Repositorio ya clonado en $TARGET_PATH. Actualizando..."
    (cd "$TARGET_PATH" && git pull origin main 2>/dev/null || true)
  else
    echo "📥 Clonando $REPO_NAME desde $REPO_URL..."
    if ! git clone "$REPO_URL" "$TARGET_PATH"; then
      echo "⚠️ El remoto no existe aún. Inicializando repositorio Git local..."
      mkdir -p "$TARGET_PATH"
      (cd "$TARGET_PATH" && git init)
    fi
  fi
done

echo "------------------------------------------------"
echo "🎉 Estructura completada y sincronizada correctamente."
```

---

## 📋 Lista de Repositorios Oficiales (`xolotl-hub`)

| Categoría | Directorio Local | Nombre de Repositorio GitHub | URL Remota |
|---|---|---|---|
| **Ecosistema Base** | `agent-rules-ecosystem` | `agent-rules-ecosystem` | `https://github.com/xolotl-hub/agent-rules-ecosystem.git` |
| **Flutter Core** | `Flutter/flutter-agent-rules` | `flutter-agent-rules` | `https://github.com/xolotl-hub/flutter-agent-rules.git` |
| **Flutter Skill** | `Flutter/flutter-agent-skill/flutter-bloc-patterns-agent-skill` | `flutter-bloc-patterns-agent-skill` | `https://github.com/xolotl-hub/flutter-bloc-patterns-agent-skill.git` |
| **Flutter Skill** | `Flutter/flutter-agent-skill/flutter-firebase-auth-agent-skill` | `flutter-firebase-auth-agent-skill` | `https://github.com/xolotl-hub/flutter-firebase-auth-agent-skill.git` |
| **Flutter Skill** | `Flutter/flutter-agent-skill/flutter-firebase-odoo-agent-skill` | `flutter-firebase-odoo-agent-skill` | `https://github.com/xolotl-hub/flutter-firebase-odoo-agent-skill.git` |
| **Web Core** | `Web/web-agent-rules` | `web-agent-rules` | `https://github.com/xolotl-hub/web-agent-rules.git` |
| **Web Skill** | `Web/web-agent-skill/web-svelte-patterns-agent-skill` | `web-svelte-patterns-agent-skill` | `https://github.com/xolotl-hub/web-svelte-patterns-agent-skill.git` |
| **Web Skill** | `Web/web-agent-skill/web-realtime-agent-skill` | `web-realtime-agent-skill` | `https://github.com/xolotl-hub/web-realtime-agent-skill.git` |
| **Web Skill** | `Web/web-agent-skill/three-js-agent-skills` | `three-js-agent-skills` | `https://github.com/xolotl-hub/three-js-agent-skills.git` |
| **Backend Core** | `Backend/backend-agent-rules` | `backend-agent-rules` | `https://github.com/xolotl-hub/backend-agent-rules.git` |
| **Backend Skill** | `Backend/backend-agent-skill/backend-auth-oauth-agent-skill` | `backend-auth-oauth-agent-skill` | `https://github.com/xolotl-hub/backend-auth-oauth-agent-skill.git` |
| **Backend Skill** | `Backend/backend-agent-skill/backend-graphql-agent-skill` | `backend-graphql-agent-skill` | `https://github.com/xolotl-hub/backend-graphql-agent-skill.git` |
| **Backend Skill** | `Backend/backend-agent-skill/backend-stripe-agent-skill` | `backend-stripe-agent-skill` | `https://github.com/xolotl-hub/backend-stripe-agent-skill.git` |
| **Game Core** | `Game/game-agent-rules` | `game-agent-rules` | `https://github.com/xolotl-hub/game-agent-rules.git` |
| **Game Skill** | `Game/game-agent-skill/godot-steamworks-agent-skill` | `godot-steamworks-agent-skill` | `https://github.com/xolotl-hub/godot-steamworks-agent-skill.git` |
| **Game Skill** | `Game/game-agent-skill/godot-firebase-agent-skill` | `godot-firebase-agent-skill` | `https://github.com/xolotl-hub/godot-firebase-agent-skill.git` |
| **Game Skill** | `Game/game-agent-skill/godot-mobile-monetization-agent-skill` | `godot-mobile-monetization-agent-skill` | `https://github.com/xolotl-hub/godot-mobile-monetization-agent-skill.git` |
| **Game Skill** | `Game/game-agent-skill/godot-dialogue-plugin-agent-skill` | `godot-dialogue-plugin-agent-skill` | `https://github.com/xolotl-hub/godot-dialogue-plugin-agent-skill.git` |
| **Game Skill** | `Game/game-agent-skill/godot-nakama-agent-skill` | `godot-nakama-agent-skill` | `https://github.com/xolotl-hub/godot-nakama-agent-skill.git` |
| **Transversal** | `Transversal/infra-agent-skill` | `infra-agent-skill` | `https://github.com/xolotl-hub/infra-agent-skill.git` |
| **Transversal** | `Transversal/monitoring-agent-skill` | `monitoring-agent-skill` | `https://github.com/xolotl-hub/monitoring-agent-skill.git` |
| **Transversal** | `Transversal/security-agent-skill` | `security-agent-skill` | `https://github.com/xolotl-hub/security-agent-skill.git` |
