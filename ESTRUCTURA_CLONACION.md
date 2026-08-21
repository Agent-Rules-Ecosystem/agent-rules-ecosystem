# 📂 Protocolo e Instrucciones de Estructuración y Clonación (`03 CORES`)

Este documento contiene las **instrucciones canónicas para que cualquier Agente de IA o desarrollador** cree la estructura de carpetas local y clone todos los repositorios del ecosistema [xolotl-hub](https://github.com/xolotl-hub).

---

## 🌳 Árbol Canónico de Directorios

La raíz del espacio de trabajo de cores debe organizarse estrictamente bajo el directorio `03 CORES` con el siguiente esquema:

```text
03 CORES/
├── agent-rules-ecosystem/       # Repositorio Núcleo y Manifiesto Maestro
├── Backend/
│   ├── backend-agent-rules/     # Gobernanza y protocolos Backend
│   └── backend-agent-skill/     # Habilidades y patrones Backend
├── Flutter/
│   ├── flutter-agent-rules/     # Gobernanza y protocolos Flutter
│   └── flutter-agent-skill/     # Habilidades y patrones Flutter
├── Game/
│   ├── game-agent-rules/        # Gobernanza y protocolos Game Dev
│   └── game-agent-skill/        # Habilidades y patrones Game Dev
├── Transversal/
│   ├── infra-agent-skill/       # Habilidades de Docker, CI/CD e Infraestructura
│   ├── monitoring-agent-skill/  # Habilidades de Logging y Telemetría
│   └── security-agent-skill/    # Habilidades de Seguridad y OWASP
└── Web/
    ├── web-agent-rules/         # Gobernanza y protocolos Web (React/Next/Vite)
    └── web-agent-skill/         # Habilidades y patrones Web
```

---

## 🤖 Instrucciones para el Agente de IA

Cuando el usuario pida: **"Inicializa o sincroniza la estructura de CORES"**, el Agente de IA debe ejecutar las siguientes acciones:

1. **Ubicación Base**: Validar que la ejecución ocurra en el directorio padre de `03 CORES`.
2. **Verificación de Carpetas**: Garantizar la existencia de los 5 bloques principales (`Backend`, `Flutter`, `Game`, `Transversal`, `Web`, `agent-rules-ecosystem`).
3. **Clonación / Verificación Git**:
   - Para cada submódulo o repositorio, verificar si la carpeta existe y si contiene un repositorio Git válido.
   - Si la carpeta existe pero está vacía o no es un repositorio Git, intentar clonar desde GitHub (`https://github.com/xolotl-hub/<repo-name>.git`).
   - Si el repositorio remoto aún no existe en GitHub, inicializar `git init` localmente para dejar la estructura lista para recibir push.

---

## ⚡ Script de Automatización Bash (Ejecutable)

El siguiente script puede ser ejecutado directamente por la terminal o por el agente para automatizar la clonación completa:

```bash
#!/usr/bin/env bash
set -e

# Nombre de usuario / Organización GitHub
GH_ORG="xolotl-hub"
BASE_DIR="$(pwd)"

echo "🚀 Iniciando sincronización del ecosistema 03 CORES para: $GH_ORG"

# Mapa de Directorios y Repositorios [Directorio_Padre:Nombre_Repo]
REPOS=(
  "Backend:backend-agent-rules"
  "Backend:backend-agent-skill"
  "Flutter:flutter-agent-rules"
  "Flutter:flutter-agent-skill"
  "Game:game-agent-rules"
  "Game:game-agent-skill"
  "Transversal:infra-agent-skill"
  "Transversal:monitoring-agent-skill"
  "Transversal:security-agent-skill"
  "Web:web-agent-rules"
  "Web:web-agent-skill"
)

# 1. Crear carpetas principales
mkdir -p "$BASE_DIR/Backend" "$BASE_DIR/Flutter" "$BASE_DIR/Game" "$BASE_DIR/Transversal" "$BASE_DIR/Web"

# 2. Clonar o Inicializar cada repositorio
for ENTRY in "${REPOS[@]}"; do
  PARENT_DIR="${ENTRY%%:*}"
  REPO_NAME="${ENTRY##*:}"
  TARGET_PATH="$BASE_DIR/$PARENT_DIR/$REPO_NAME"
  REPO_URL="https://github.com/$GH_ORG/$REPO_NAME.git"

  echo "------------------------------------------------"
  echo "🔍 Procesando: $PARENT_DIR/$REPO_NAME"

  if [ -d "$TARGET_PATH/.git" ]; then
    echo "✅ Repositorio ya clonado en $TARGET_PATH. Actualizando..."
    (cd "$TARGET_PATH" && git pull origin main 2>/dev/null || true)
  else
    echo "📥 Clonando $REPO_NAME desde $REPO_URL..."
    git clone "$REPO_URL" "$TARGET_PATH"
  fi
done

echo "------------------------------------------------"
echo "🎉 Estructura 03 CORES completada y sincronizada correctamente."
```

---

## 📋 Lista de Repositorios Oficiales (`xolotl-hub`)

| Categoría | Directorio Local | Nombre de Repositorio GitHub | URL Remota |
|---|---|---|---|
| **Ecosistema Base** | `agent-rules-ecosystem` | `agent-rules-ecosystem` | `https://github.com/xolotl-hub/agent-rules-ecosystem.git` |
| **Flutter** | `Flutter/flutter-agent-rules` | `flutter-agent-rules` | `https://github.com/xolotl-hub/flutter-agent-rules.git` |
| **Flutter** | `Flutter/flutter-agent-skill` | `flutter-agent-skill` | `https://github.com/xolotl-hub/flutter-agent-skill.git` |
| **Web** | `Web/web-agent-rules` | `web-agent-rules` | `https://github.com/xolotl-hub/web-agent-rules.git` |
| **Web** | `Web/web-agent-skill` | `web-agent-skill` | `https://github.com/xolotl-hub/web-agent-skill.git` |
| **Backend** | `Backend/backend-agent-rules` | `backend-agent-rules` | `https://github.com/xolotl-hub/backend-agent-rules.git` |
| **Backend** | `Backend/backend-agent-skill` | `backend-agent-skill` | `https://github.com/xolotl-hub/backend-agent-skill.git` |
| **Game** | `Game/game-agent-rules` | `game-agent-rules` | `https://github.com/xolotl-hub/game-agent-rules.git` |
| **Game** | `Game/game-agent-skill` | `game-agent-skill` | `https://github.com/xolotl-hub/game-agent-skill.git` |
| **Transversal** | `Transversal/infra-agent-skill` | `infra-agent-skill` | `https://github.com/xolotl-hub/infra-agent-skill.git` |
| **Transversal** | `Transversal/monitoring-agent-skill` | `monitoring-agent-skill` | `https://github.com/xolotl-hub/monitoring-agent-skill.git` |
| **Transversal** | `Transversal/security-agent-skill` | `security-agent-skill` | `https://github.com/xolotl-hub/security-agent-skill.git` |
