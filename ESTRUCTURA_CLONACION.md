# ðŸ“‚ Protocolo e Instrucciones de EstructuraciÃ³n y ClonaciÃ³n

Este documento contiene las **instrucciones canÃ³nicas para que cualquier Agente de IA o desarrollador** cree la estructura de carpetas local y clone todos los repositorios del ecosistema [Agent-Rules-Ecosystem](https://github.com/Agent-Rules-Ecosystem).

---

## ðŸŒ³ Ãrbol CanÃ³nico de Directorios

La raÃ­z del espacio de trabajo se puede ubicar en cualquier directorio local elegido por el usuario y se organiza con el siguiente esquema:

```text
<tu-directorio-raiz>/
â”œâ”€â”€ agent-rules-ecosystem/       # Repositorio NÃºcleo y Manifiesto Maestro
â”œâ”€â”€ Backend/
â”‚   â”œâ”€â”€ backend-agent-rules/     # Gobernanza y protocolos Backend
â”‚   â””â”€â”€ backend-agent-skill/     # Habilidades y patrones Backend
â”‚       â”œâ”€â”€ backend-auth-oauth-agent-skill/
â”‚       â”œâ”€â”€ backend-graphql-agent-skill/
â”‚       â””â”€â”€ backend-stripe-agent-skill/
â”œâ”€â”€ Flutter/
â”‚   â”œâ”€â”€ flutter-agent-rules/     # Gobernanza y protocolos Flutter
â”‚   â””â”€â”€ flutter-agent-skill/     # Habilidades y patrones Flutter
â”‚       â”œâ”€â”€ flutter-bloc-patterns-agent-skill/
â”‚       â”œâ”€â”€ flutter-firebase-auth-agent-skill/
â”‚       â””â”€â”€ flutter-firebase-odoo-agent-skill/
â”œâ”€â”€ Game/
â”‚   â”œâ”€â”€ game-agent-rules/        # Gobernanza y protocolos Game Dev
â”‚   â””â”€â”€ game-agent-skill/        # Habilidades y patrones Game Dev
â”‚       â”œâ”€â”€ godot-steamworks-agent-skill/
â”‚       â”œâ”€â”€ godot-firebase-agent-skill/
â”‚       â”œâ”€â”€ godot-mobile-monetization-agent-skill/
â”‚       â”œâ”€â”€ godot-dialogue-plugin-agent-skill/
â”‚       â””â”€â”€ godot-nakama-agent-skill/
â”œâ”€â”€ Transversal/
â”‚   â”œâ”€â”€ infra-agent-skill/       # Habilidades de Docker, CI/CD e Infraestructura
â”‚   â”œâ”€â”€ monitoring-agent-skill/  # Habilidades de Logging y TelemetrÃ­a
â”‚   â””â”€â”€ security-agent-skill/    # Habilidades de Seguridad y OWASP
â””â”€â”€ Web/
    â”œâ”€â”€ web-agent-rules/         # Gobernanza y protocolos Web (React/Next/Vite)
    â””â”€â”€ web-agent-skill/         # Habilidades y patrones Web
        â”œâ”€â”€ web-svelte-patterns-agent-skill/
        â”œâ”€â”€ web-realtime-agent-skill/
        â””â”€â”€ three-js-agent-skills/
```

---

## ðŸ¤– Instrucciones para el Agente de IA

Cuando el usuario pida: **"Inicializa o sincroniza la estructura del ecosistema"**, el Agente de IA debe ejecutar las siguientes acciones:

1. **UbicaciÃ³n Base**: Validar que la ejecuciÃ³n ocurra en el directorio raÃ­z elegido para el ecosistema.
2. **VerificaciÃ³n de Carpetas**: Garantizar la existencia de los 5 bloques principales (`Backend`, `Flutter`, `Game`, `Transversal`, `Web`, `agent-rules-ecosystem`).
3. **ClonaciÃ³n / VerificaciÃ³n Git**:
   - Para cada submÃ³dulo o repositorio de gobernanza (`*-agent-rules`), clonar en la raÃ­z de su categorÃ­a (`<Dominio>/<dominio>-agent-rules`).
   - Para las skills especializadas, clonar dentro del subdirectorio contenedor `<Dominio>/<dominio>-agent-skill/<nombre-skill>/`.
   - Para las skills transversales, clonar directamente en `Transversal/<nombre-skill>/`.
   - Si el repositorio remoto aÃºn no existe en GitHub, inicializar `git init` localmente para dejar la estructura lista.

---

## âš¡ Script de AutomatizaciÃ³n Bash (Ejecutable)

El siguiente script puede ser ejecutado directamente por la terminal o por el agente para automatizar la clonaciÃ³n completa:

```bash
#!/usr/bin/env bash
set -e

# Nombre de usuario / OrganizaciÃ³n GitHub
GH_ORG="Agent-Rules-Ecosystem"
BASE_DIR="$(pwd)"

echo "ðŸš€ Iniciando sincronizaciÃ³n del ecosistema para: $GH_ORG"

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
  echo "ðŸ” Procesando: $TARGET_PATH"

  if [ -d "$TARGET_PATH/.git" ]; then
    echo "âœ… Repositorio ya clonado en $TARGET_PATH. Actualizando..."
    (cd "$TARGET_PATH" && git pull origin main 2>/dev/null || true)
  else
    echo "ðŸ“¥ Clonando $REPO_NAME desde $REPO_URL..."
    if ! git clone "$REPO_URL" "$TARGET_PATH"; then
      echo "âš ï¸ El remoto no existe aÃºn. Inicializando repositorio Git local..."
      mkdir -p "$TARGET_PATH"
      (cd "$TARGET_PATH" && git init)
    fi
  fi
done

echo "------------------------------------------------"
echo "ðŸŽ‰ Estructura completada y sincronizada correctamente."
```

---

## ðŸ“‹ Lista de Repositorios Oficiales (`Agent-Rules-Ecosystem`)

| CategorÃ­a | Directorio Local | Nombre de Repositorio GitHub | URL Remota |
|---|---|---|---|
| **Ecosistema Base** | `agent-rules-ecosystem` | `agent-rules-ecosystem` | `https://github.com/Agent-Rules-Ecosystem/agent-rules-ecosystem.git` |
| **Flutter Core** | `Flutter/flutter-agent-rules` | `flutter-agent-rules` | `https://github.com/Agent-Rules-Ecosystem/flutter-agent-rules.git` |
| **Flutter Skill** | `Flutter/flutter-agent-skill/flutter-bloc-patterns-agent-skill` | `flutter-bloc-patterns-agent-skill` | `https://github.com/Agent-Rules-Ecosystem/flutter-bloc-patterns-agent-skill.git` |
| **Flutter Skill** | `Flutter/flutter-agent-skill/flutter-firebase-auth-agent-skill` | `flutter-firebase-auth-agent-skill` | `https://github.com/Agent-Rules-Ecosystem/flutter-firebase-auth-agent-skill.git` |
| **Flutter Skill** | `Flutter/flutter-agent-skill/flutter-firebase-odoo-agent-skill` | `flutter-firebase-odoo-agent-skill` | `https://github.com/Agent-Rules-Ecosystem/flutter-firebase-odoo-agent-skill.git` |
| **Web Core** | `Web/web-agent-rules` | `web-agent-rules` | `https://github.com/Agent-Rules-Ecosystem/web-agent-rules.git` |
| **Web Skill** | `Web/web-agent-skill/web-svelte-patterns-agent-skill` | `web-svelte-patterns-agent-skill` | `https://github.com/Agent-Rules-Ecosystem/web-svelte-patterns-agent-skill.git` |
| **Web Skill** | `Web/web-agent-skill/web-realtime-agent-skill` | `web-realtime-agent-skill` | `https://github.com/Agent-Rules-Ecosystem/web-realtime-agent-skill.git` |
| **Web Skill** | `Web/web-agent-skill/three-js-agent-skills` | `three-js-agent-skills` | `https://github.com/Agent-Rules-Ecosystem/three-js-agent-skills.git` |
| **Backend Core** | `Backend/backend-agent-rules` | `backend-agent-rules` | `https://github.com/Agent-Rules-Ecosystem/backend-agent-rules.git` |
| **Backend Skill** | `Backend/backend-agent-skill/backend-auth-oauth-agent-skill` | `backend-auth-oauth-agent-skill` | `https://github.com/Agent-Rules-Ecosystem/backend-auth-oauth-agent-skill.git` |
| **Backend Skill** | `Backend/backend-agent-skill/backend-graphql-agent-skill` | `backend-graphql-agent-skill` | `https://github.com/Agent-Rules-Ecosystem/backend-graphql-agent-skill.git` |
| **Backend Skill** | `Backend/backend-agent-skill/backend-stripe-agent-skill` | `backend-stripe-agent-skill` | `https://github.com/Agent-Rules-Ecosystem/backend-stripe-agent-skill.git` |
| **Game Core** | `Game/game-agent-rules` | `game-agent-rules` | `https://github.com/Agent-Rules-Ecosystem/game-agent-rules.git` |
| **Game Skill** | `Game/game-agent-skill/godot-steamworks-agent-skill` | `godot-steamworks-agent-skill` | `https://github.com/Agent-Rules-Ecosystem/godot-steamworks-agent-skill.git` |
| **Game Skill** | `Game/game-agent-skill/godot-firebase-agent-skill` | `godot-firebase-agent-skill` | `https://github.com/Agent-Rules-Ecosystem/godot-firebase-agent-skill.git` |
| **Game Skill** | `Game/game-agent-skill/godot-mobile-monetization-agent-skill` | `godot-mobile-monetization-agent-skill` | `https://github.com/Agent-Rules-Ecosystem/godot-mobile-monetization-agent-skill.git` |
| **Game Skill** | `Game/game-agent-skill/godot-dialogue-plugin-agent-skill` | `godot-dialogue-plugin-agent-skill` | `https://github.com/Agent-Rules-Ecosystem/godot-dialogue-plugin-agent-skill.git` |
| **Game Skill** | `Game/game-agent-skill/godot-nakama-agent-skill` | `godot-nakama-agent-skill` | `https://github.com/Agent-Rules-Ecosystem/godot-nakama-agent-skill.git` |
| **Transversal** | `Transversal/infra-agent-skill` | `infra-agent-skill` | `https://github.com/Agent-Rules-Ecosystem/infra-agent-skill.git` |
| **Transversal** | `Transversal/monitoring-agent-skill` | `monitoring-agent-skill` | `https://github.com/Agent-Rules-Ecosystem/monitoring-agent-skill.git` |
| **Transversal** | `Transversal/security-agent-skill` | `security-agent-skill` | `https://github.com/Agent-Rules-Ecosystem/security-agent-skill.git` |

