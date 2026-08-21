# 🌐 Agent Rules Ecosystem

**Ecosistema Central de Gobernanza y Habilidades para Agentes de IA**  
Organización y Repositorios Oficiales: [xolotl-hub](https://github.com/xolotl-hub)

---

## 📌 Visión General

`agent-rules-ecosystem` es el manifiesto maestro, especificación estándar y orquestador del ecosistema `xolotl-hub`. Está diseñado para estandarizar la arquitectura de gobernanza, la gestión de sesiones, la estructura local de carpetas y la inyección de habilidades especializadas en cualquier entorno (Flutter, Web, Backend, Game Dev y Transversal).

### 📐 Filosofía del Ecosistema

El ecosistema se divide en dos capas fundamentales:

1. **Gobernanza (`*-agent-rules`)**: Define **CÓMO trabaja la IA** (Rituales `$boot`, `$work`, `$archi`, `$close`, gestión de estado en `overview/`, economía de tokens, handoffs y firma de modelos).
2. **Habilidades (`*-agent-skill`)**: Define **QUÉ sabe hacer la IA** en dominios técnicos específicos (patrones de código, integraciones, snippets comprobados y guías técnicas en formato 100% Markdown).

---

## 🌳 Árbol Canónico del Ecosistema

```text
<tu-directorio-raiz>/
├── agent-rules-ecosystem/       # Repositorio Núcleo y Manifiesto Maestro
├── Backend/
│   ├── backend-agent-rules/     # Gobernanza Backend
│   └── backend-agent-skill/     # Habilidades Backend
│       ├── backend-auth-oauth-agent-skill/
│       ├── backend-graphql-agent-skill/
│       └── backend-stripe-agent-skill/
├── Flutter/
│   ├── flutter-agent-rules/     # Gobernanza Flutter
│   └── flutter-agent-skill/     # Habilidades Flutter
│       ├── flutter-bloc-patterns-agent-skill/
│       ├── flutter-firebase-auth-agent-skill/
│       └── flutter-firebase-odoo-agent-skill/
├── Game/
│   ├── game-agent-rules/        # Gobernanza Game Dev
│   └── game-agent-skill/        # Habilidades Game Dev (Godot)
│       ├── godot-steamworks-agent-skill/
│       ├── godot-firebase-agent-skill/
│       ├── godot-mobile-monetization-agent-skill/
│       ├── godot-dialogue-plugin-agent-skill/
│       └── godot-nakama-agent-skill/
├── Transversal/
│   ├── infra-agent-skill/       # Habilidades de Docker, CI/CD e Infraestructura
│   ├── monitoring-agent-skill/  # Habilidades de Telemetría y Logging
│   └── security-agent-skill/    # Habilidades de Seguridad y OWASP
└── Web/
    ├── web-agent-rules/         # Gobernanza Web (React/Next/Svelte/Vite)
    └── web-agent-skill/         # Habilidades Web
        ├── web-svelte-patterns-agent-skill/
        ├── web-realtime-agent-skill/
        └── three-js-agent-skills/
```

---

## 🗺️ Matriz de Repositorios Oficiales (`xolotl-hub`)

### 📱 1. Flutter
- 🛡️ **Gobernanza**: `flutter-agent-rules` → `https://github.com/xolotl-hub/flutter-agent-rules`
- ⚡ **Skills** (`Flutter/flutter-agent-skill/`):
  - `flutter-bloc-patterns-agent-skill` (`$bloc`)
  - `flutter-firebase-auth-agent-skill` (`$auth`)
  - `flutter-firebase-odoo-agent-skill` (`$odoo`)

### 🌐 2. Web
- 🛡️ **Gobernanza**: `web-agent-rules` → `https://github.com/xolotl-hub/web-agent-rules`
- ⚡ **Skills** (`Web/web-agent-skill/`):
  - `web-svelte-patterns-agent-skill` (`$svelte`)
  - `web-realtime-agent-skill` (`$realtime`)
  - `three-js-agent-skills` (`$threejs`)

### ⚙️ 3. Backend
- 🛡️ **Gobernanza**: `backend-agent-rules` → `https://github.com/xolotl-hub/backend-agent-rules`
- ⚡ **Skills** (`Backend/backend-agent-skill/`):
  - `backend-auth-oauth-agent-skill` (`$auth`)
  - `backend-graphql-agent-skill` (`$gql`)
  - `backend-stripe-agent-skill` (`$stripe`)

### 🎮 4. Game Dev (Godot 4)
- 🛡️ **Gobernanza**: `game-agent-rules` → `https://github.com/xolotl-hub/game-agent-rules`
- ⚡ **Skills** (`Game/game-agent-skill/`):
  - `godot-steamworks-agent-skill` (`$steam`)
  - `godot-firebase-agent-skill` (`$godotfire`)
  - `godot-mobile-monetization-agent-skill` (`$mobile`)
  - `godot-dialogue-plugin-agent-skill` (`$dialogue`)
  - `godot-nakama-agent-skill` (`$nakama`)

### 🔄 5. Transversal Skills
Skills agnósticas componibles e inyectables en cualquier proyecto:
- 🏗️ **Infraestructura & CI/CD**: `infra-agent-skill` (`$infra`)
- 📊 **Monitoreo & Telemetría**: `monitoring-agent-skill` (`$monitoring`)
- 🛡️ **Seguridad & OWASP**: `security-agent-skill` (`$security`)

---

## ⚡ Scripts de Sincronización Automática

Este repositorio incluye scripts ejecutables de referencia en `scripts/` para que **cualquier agente de IA o desarrollador** pueda inicializar la estructura local completa en cualquier máquina sin margen de error:

### En Linux / macOS (Bash)
```bash
bash scripts/sync_ecosystem.sh
```

### En Windows (PowerShell)
```powershell
powershell -ExecutionPolicy Bypass -File scripts/sync_ecosystem.ps1
```

---

## 📚 Documentos de Referencia

- 👉 **[Guía de Estructura y Clonación (`ESTRUCTURA_CLONACION.md`)](./ESTRUCTURA_CLONACION.md)** — Protocolo e instrucciones detalladas de clonación.
- 👉 **[Estándar Canónico de Skills (`SKILL_STANDARD.md`)](./SKILL_STANDARD.md)** — Especificación técnica agnóstica para crear y validar skills.

---

## 🔒 Regla de Inviolabilidad y Contribución

1. **Aislamiento**: Los submódulos `.agents/` en proyectos cliente nunca se modifican directamente desde el proyecto.
2. **Propuestas de Mejora**: Todo aprendizaje candidato se registra en `overview/learning.md` del proyecto huésped.
3. **Promoción**: Las mejoras aprobadas se fusionan hacia el repositorio oficial correspondiente en `xolotl-hub`.
