# 🌐 Agent Rules Ecosystem (`03 CORES`)

**Ecosistema Central de Gobernanza y Habilidades para Agentes de IA**  
Organización y Repositorios Oficiales: [xolotl-hub](https://github.com/xolotl-hub)

---

## 📌 Visión General

`agent-rules-ecosystem` es el manifiesto y núcleo orquestador de la arquitectura de **03 CORES**. Está diseñado para estandarizar el flujo de trabajo, la economía de tokens, la gobernanza de sesiones y la inyección de habilidades especializadas en cualquier tipo de proyecto (Mobile, Web, Backend, Game, Infrastructure).

### 📐 Filosofía de los 03 CORES

El ecosistema se divide en dos capas fundamentales:

1. **Gobernanza (`*-agent-rules`)**: Define **CÓMO trabaja la IA** (Rituales `$boot`, `$work`, `$archi`, `$close`, gestión de estado en `overview/`, economía de tokens, handoffs y firma de modelos).
2. **Habilidades (`*-agent-skill`)**: Define **QUÉ sabe hacer la IA** en dominios específicos (patrones de código, integraciones, snippets comprobados y guías técnicas).

---

## 🗺️ Mapa de Cores y Habilidades (`xolotl-hub`)

A continuación se detalla la matriz de repositorios oficiales en GitHub para cada entorno:

### 📱 1. Flutter Core
- 🛡️ **Gobernanza**: `flutter-agent-rules` → `https://github.com/xolotl-hub/flutter-agent-rules`
- ⚡ **Habilidades**: `flutter-agent-skill` → `https://github.com/xolotl-hub/flutter-firebase-odoo-agent-skill` *(o `flutter-agent-skill`)*

### 🌐 2. Web Core
- 🛡️ **Gobernanza**: `web-agent-rules` → `https://github.com/xolotl-hub/web-agent-rules`
- ⚡ **Habilidades**: `web-agent-skill` → `https://github.com/xolotl-hub/web-agent-skill`

### ⚙️ 3. Backend Core
- 🛡️ **Gobernanza**: `backend-agent-rules` → `https://github.com/xolotl-hub/backend-agent-rules`
- ⚡ **Habilidades**: `backend-agent-skill` → `https://github.com/xolotl-hub/backend-agent-skill`

### 🎮 4. Game Core
- 🛡️ **Gobernanza**: `game-agent-rules` → `https://github.com/xolotl-hub/game-agent-rules`
- ⚡ **Habilidades**: `game-agent-skill` → `https://github.com/xolotl-hub/game-agent-skill`

### 🔄 5. Transversal Skills (Cross-Cutting)
Skills universales componibles e inyectables en cualquier proyecto:
- 🛡️ **Seguridad**: `security-agent-skill` → `https://github.com/xolotl-hub/security-agent-skill`
- 🏗️ **Infraestructura & CI/CD**: `infra-agent-skill` → `https://github.com/xolotl-hub/infra-agent-skill`
- 📊 **Monitoreo & Telemetría**: `monitoring-agent-skill` → `https://github.com/xolotl-hub/monitoring-agent-skill`

---

## 🚀 Guía de Instalación y Clonación

Para inicializar la estructura local completa de carpetas y clonar o verificar todos los repositorios en sus rutas canónicas, consulta la guía de instrucciones:

👉 **[Guía de Estructura y Clonación (`ESTRUCTURA_CLONACION.md`)](./ESTRUCTURA_CLONACION.md)**

---

## 🔒 Regla de Inviolabilidad y Contribución

1. **Aislamiento**: Los submódulos `.agents/` en proyectos cliente nunca se modifican directamente desde el proyecto.
2. **Propuestas de Mejora**: Todo aprendizaje candidato se registra en `overview/learning.md` del proyecto huésped.
3. **Promoción**: Las mejoras aprobadas se fusionan hacia el repositorio oficial correspondiente en `xolotl-hub`.
