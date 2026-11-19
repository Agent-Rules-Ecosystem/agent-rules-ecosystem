# 📐 Agent Skill Standard — Especificación Oficial

> **Referencia canónica para la creación, validación y mantenimiento de cualquier `*-agent-skill`** dentro del ecosistema `Agent-Rules-Ecosystem`.  
> Toda skill existente o futura debe cumplir con esta especificación para ser considerada válida.

**Versión**: 1.0 · **Fecha**: 2026-08-21 · **Repositorio**: `agent-rules-ecosystem`

---

## 📌 ¿Qué es una Skill?

Una **skill** (`*-agent-skill`) es un repositorio Git independiente que inyecta **conocimiento especializado y comportamiento operativo** en un agente de IA. Se distingue de una **rule** (`*-agent-rules`) en que:

| | `*-agent-rules` | `*-agent-skill` |
|---|---|---|
| **Define** | CÓMO trabaja la IA (rituales, gobernanza, estado) | QUÉ sabe hacer la IA (dominio técnico) |
| **Contiene** | `$boot`, `$work`, `$close`, `overview/`, session tracking | Patrones, guías, snippets, comandos de dominio |
| **Alcance** | Global para el proyecto | Inyectable puntualmente según necesidad |
| **Instalación** | `.agents/` en raíz del proyecto | `.skill/<nombre>-agent-skill/` |

---

## 🗂️ Estructura de Directorios Obligatoria

Todo repositorio `*-agent-skill` **debe** respetar exactamente la siguiente estructura:

```
<nombre>-agent-skill/
│
├── README.md                   ← [OBLIGATORIO] Presentación pública del repositorio
├── AGENTS.md                   ← [OBLIGATORIO] Directiva de bootstrap multi-agente
├── SKILL.md                    ← [OBLIGATORIO] Matriz de capacidades y protocolos de auditoría
│
├── adapters/                   ← [OBLIGATORIO] Adaptadores por herramienta de IA
│   ├── GEMINI.md               ← Adaptador para Google Gemini / Antigravity
│   ├── CLAUDE.md               ← Adaptador para Anthropic Claude
│   ├── AGENTS.md               ← Adaptador universal OpenAI / Codex
│   ├── cursor-rule.mdc         ← Regla de integración para Cursor IDE
│   └── README.md               ← Índice de adaptadores disponibles
│
├── core/                       ← [OBLIGATORIO] Núcleo operativo de la habilidad
│   ├── commands.md             ← Registro de $-comandos de dominio
│   ├── brain.md                ← Motor de decisiones y matrices de diagnóstico
│   └── path_map.md             ← Mapa canónico de rutas relevantes del proyecto
│
├── knowledge/                  ← [OBLIGATORIO] Guías técnicas de dominio (mín. 2 archivos)
│   └── <tema>.md               ← Una guía por tema o área de conocimiento
│
├── resources/                  ← [RECOMENDADO] Plantillas, templates y código listo para usar
│   └── <recurso>.md            ← Plantillas, fragmentos de código y configs en formato Markdown
│
└── scripts/                    ← [RECOMENDADO] Scripts de diagnóstico o automatización
    └── <script>.md             ← Scripts explicados en bloques de código dentro de Markdown
```

> ⚠️ **Regla de Formato 100% Markdown**: Todo el contenido de una skill (incluyendo `resources/` y `scripts/`) **DEBE ser 100% archivos `.md`** (Markdown con bloques de código explícitos). **NO SE PERMITEN** archivos fuente ejecutable crudos (`.dart`, `.py`, `.sh`, `.yml`, `.json`, etc.). Esto previene falsos positivos en los analizadores de código/IDEs y mantiene el ecosistema totalmente declarativo y documental.

---

## 📄 Especificación de Archivos Obligatorios

### 1. `README.md` — Presentación Pública

**Propósito**: Primer punto de contacto. Debe permitir a un desarrollador entender en 30 segundos qué hace la skill y cómo activarla.

**Estructura requerida** (en este orden):

```markdown
# <emoji> <Nombre Human-Readable> Agent Skill

> **Descripción** — Una línea describiendo el dominio y la cobertura de la skill.
> Debe indicar explícitamente si es **Transversal** (agnóstica) o **Especializada** (ej. Flutter).

---

## 📌 Propósito y Alcance
Lista numerada de 3–6 capacidades clave con emoji por ítem.

## ⚡ $-Comandos de <Dominio>
Tabla Markdown con columnas: Comando | Acción | Descripción

## 🧩 Arquitectura / Diagrama de Flujo
Diagrama Mermaid (graph TD o graph LR) ilustrando el flujo principal de la skill.

## 📦 Instalación como Submódulo
Bloque de código bash con el comando git submodule add.
Seguido del trigger de activación de sesión.
```

---

### 2. `AGENTS.md` — Directiva de Bootstrap Multi-Agente

**Propósito**: El agente lo carga primero. Define cuándo y cómo arrancar la skill, y cuáles son las reglas canónicas no negociables.

**Estructura requerida**:

```markdown
---
name: <nombre-exacto-del-repo>
description: <Descripción breve en inglés — una línea>
---

# <emoji> <Nombre> Skill Directive

## Bootstrap de la Habilidad

Lista numerada de archivos a cargar en orden, con flecha ← y descripción.

## Reglas Canónicas [de <Dominio>] [Agnósticas]

Lista de 4–6 reglas absolutas e inviolables para esta skill.
Cada regla debe ser prescriptiva (evitar lenguaje vago).
```

**Reglas de redacción**:
- El bloque YAML frontmatter (`---`) es **obligatorio**.
- El campo `name` debe coincidir exactamente con el nombre del directorio del repo.
- Las reglas canónicas deben ser prohibiciones o afirmaciones fuertes (ej. "Nunca X", "Todo Y debe Z").

---

### 3. `SKILL.md` — Matriz de Capacidades y Protocolos

**Propósito**: El documento más denso técnicamente. Contiene la lógica operativa de la skill que el agente usa durante una tarea activa.

**Estructura requerida**:

```markdown
# <emoji> <Nombre> Skill Matrix & Directives

## 🎯 Capacidades de la Habilidad
Diagrama Mermaid (graph LR) mostrando las sub-habilidades que convergen en el core.

## 📋 Protocolo de Auditoría de <Dominio> (`$<cmd>:audit`)
Lista jerarquizada con las verificaciones que realiza la auditoría automática.

## <Sección Técnica Central>
Plantilla de código, matriz de decisión o tabla comparativa del dominio principal.
Mínimo 1 bloque de código o tabla con el patrón canónico de la skill.
```

---

### 4. `adapters/` — Adaptadores por Herramienta de IA

**Propósito**: Permite que cualquier herramienta de IA lea la skill en su formato nativo.

| Archivo | Herramienta | Contenido Mínimo |
|---|---|---|
| `GEMINI.md` | Google Gemini / Antigravity | 2–4 líneas: trigger + rutas a AGENTS.md y SKILL.md |
| `CLAUDE.md` | Anthropic Claude | 2–4 líneas: trigger + rutas a AGENTS.md y SKILL.md |
| `AGENTS.md` | OpenAI / Codex | 2–4 líneas: trigger + ruta a AGENTS.md |
| `cursor-rule.mdc` | Cursor IDE | Frontmatter YAML con `description` y `globs` + regla de 1 línea |
| `README.md` | Humanos | Índice de los 4 adaptadores disponibles |

**Formato de cursor-rule.mdc**:
```yaml
---
description: <Descripción concisa de cuándo aplica>
globs: ["<patrón-glob-1>", "<patrón-glob-2>"]
---

<Regla en 1–2 líneas referenciando el SKILL.md>
```

---

### 5. `core/` — Núcleo Operativo

#### `core/commands.md`
Lista de todos los `$-comandos` de la skill con su sintaxis y descripción breve.  
Formato: lista markdown, un ítem por comando.

#### `core/brain.md`
Motor de decisiones. Responde la pregunta: **"¿Cómo decide el agente qué hacer ante X situación?"**  
Estructura: matrices `Si X → Entonces Y`, árboles de decisión o tablas de triaje.

#### `core/path_map.md`
Mapa de rutas canónicas del proyecto que la skill monitorea o modifica.  
Formato: lista markdown con la ruta y su descripción en una línea.

---

### 6. `knowledge/` — Guías de Dominio

**Propósito**: Contexto técnico de referencia. El agente lee estos documentos cuando necesita profundidad en un subtema.

**Reglas**:
- Mínimo **2 archivos** de conocimiento.
- Máximo recomendado: **6 archivos** (si necesitas más, considera dividir la skill).
- Cada archivo cubre **un solo tema** de forma autocontenida.
- Nombrar en `snake_case` describiendo el tema: `docker_containerization.md`, `owasp_mitigation.md`.
- Los archivos de `knowledge/` **no son directivas operativas** — son referencias consultivas.

---

## 🏷️ Naming Convention

```
<dominio>-agent-skill            ← Skill especializada (ej. flutter-bloc-patterns-agent-skill)
<tecnologia>-agent-skill         ← Skill transversal (ej. infra-agent-skill, security-agent-skill)
<plataforma>-<tech>-agent-skill  ← Skill de integración (ej. flutter-firebase-odoo-agent-skill)
```

**Reglas de nombres**:
- Todo en `kebab-case` en minúsculas.
- Siempre terminar en `-agent-skill`.
- El prefijo describe el dominio o plataforma objetivo.
- Si es Transversal: nombre corto sin prefijo de plataforma (ej. `security-agent-skill`).
- Si es Especializada: prefijo de plataforma (ej. `flutter-bloc-patterns-agent-skill`).

---

## ⚡ Comandos de Dominio — Estándar de $-Comandos

Toda skill debe exponer sus operaciones como **$-comandos** siguiendo el patrón:

```
$<skill-alias>                   ← Bootstrap / activación de la skill
$<skill-alias>:audit             ← Diagnóstico y auditoría del dominio
$<skill-alias>:<accion> [param]  ← Operación específica
```

**Ejemplos correctos**:
```
$infra                           ← Activar skill de infraestructura
$infra:check                     ← Auditoría completa
$infra:docker [target]           ← Generación de Dockerfile
$bloc                            ← Activar skill de BLoC
$bloc:create [FeatureName]       ← Generar BLoC completo
$auth:audit                      ← Auditoría de autenticación
$security:secrets                ← Escaneo de llaves hardcodeadas
```

**Reglas**:
- El alias base debe coincidir con el dominio central de la skill (corto y memorable).
- Siempre debe existir un comando base sin sufijo (`$alias`) que haga el bootstrap.
- Siempre debe existir un `$alias:audit` que dispare el diagnóstico del dominio.

---

## 🔄 Checklist de Validación de una Skill

Antes de hacer commit o publicar una skill, verificar:

### ✅ Estructura
- [ ] `README.md` presente y con las 4 secciones requeridas
- [ ] `AGENTS.md` con frontmatter YAML válido y reglas canónicas
- [ ] `SKILL.md` con diagrama Mermaid de capacidades y protocolo de auditoría
- [ ] `adapters/GEMINI.md` con trigger y rutas correctas
- [ ] `adapters/CLAUDE.md` con trigger y rutas correctas
- [ ] `adapters/AGENTS.md` con trigger y rutas correctas
- [ ] `adapters/cursor-rule.mdc` con frontmatter `description` y `globs`
- [ ] `adapters/README.md` con índice de los adaptadores
- [ ] `core/commands.md` con lista de $-comandos
- [ ] `core/brain.md` con matrices de decisión
- [ ] `core/path_map.md` con rutas canónicas del dominio
- [ ] `knowledge/` con mínimo 2 archivos de guías técnicas

### ✅ Contenido
- [ ] El campo `name` de `AGENTS.md` coincide exactamente con el nombre del directorio
- [ ] Existe al menos 1 diagrama Mermaid (en README.md o SKILL.md)
- [ ] Los $-comandos en `core/commands.md` coinciden con los listados en `README.md`
- [ ] Las rutas en `core/path_map.md` son rutas genéricas (no hardcodeadas a un proyecto)
- [ ] Los adaptadores apuntan a la ruta `.skill/<nombre-repo>/` (no rutas absolutas ni rutas dentro de `.agents/`)
- [ ] `resources/` contiene al menos 1 template o ejemplo de código

### ✅ Calidad Agnóstica (para Skills Transversales)
- [ ] No contiene referencias a lenguajes o plataformas específicas en reglas canónicas
- [ ] Los ejemplos de código usan comentarios genéricos (`<install-command>`, `<build-command>`)
- [ ] El `AGENTS.md` no menciona rutas de archivos propias de un framework específico

### ✅ Calidad Especializada (para Skills de Plataforma)
- [ ] El prefijo de nombre refleja la plataforma (ej. `flutter-`)
- [ ] El `README.md` menciona explícitamente la plataforma objetivo
- [ ] Los snippets de código están en el lenguaje de la plataforma

---

## 🔗 Instalación Estándar en un Proyecto

### ⚠️ Regla de Aislamiento — `.agents/` es Intocable

`.agents/` contiene **únicamente** el repositorio oficial de gobernanza (`*-agent-rules`). **Nunca** se añade nada dentro de `.agents/`. Las skills van en una carpeta separada `.skill/` al mismo nivel.

### Estructura de instalación canónica

```
proyecto-huésped/
├── .agents/                                   ← submódulo *-agent-rules (SOLO LECTURA)
│   ├── core/
│   ├── adapters/
│   ├── knowledge/
│   └── templates/
│
└── .skill/                                    ← directorio de skills (creado manualmente)
    ├── <nombre-skill-1>-agent-skill/          ← git submodule add ...
    └── <nombre-skill-2>-agent-skill/          ← git submodule add ...
```

### Comandos de instalación

```bash
# Añadir cada skill requerida como submódulo usando el nombre completo del repositorio
git submodule add git@github.com:Agent-Rules-Ecosystem/<nombre>-agent-skill.git .skill/<nombre>-agent-skill
# (repetir para cada skill requerida por el proyecto)
```

> **Importante**: El nombre del directorio dentro de `.skill/` debe ser el nombre **completo** del repositorio, no un alias corto. Esto garantiza trazabilidad directa entre la carpeta local y el repo de origen.

### Tabla de Skills Disponibles e Instalación

| Dominio | Repositorio | Ruta de instalación | Comando |
|---|---|---|---|
| **Transversal** | `firebase-auth-agent-skill` | `.skill/firebase-auth-agent-skill/` | `$firebaseauth` |
| **Transversal** | `grapho-agent-skill` | `.skill/grapho-agent-skill/` | `$grapho` |
| **Transversal** | `grapho-3d-visualizer-agent-skill` | `.skill/grapho-3d-visualizer-agent-skill/` | `$grapho3d` |
| **Transversal** | `i18n-agent-skill` | `.skill/i18n-agent-skill/` | `$i18n` |
| **Transversal** | `infra-agent-skill` | `.skill/infra-agent-skill/` | `$infra` |
| **Transversal** | `monitoring-agent-skill` | `.skill/monitoring-agent-skill/` | `$monitoring` |
| **Transversal** | `performance-agent-skill` | `.skill/performance-agent-skill/` | `$perf` |
| **Transversal** | `security-agent-skill` | `.skill/security-agent-skill/` | `$security` |
| **Transversal** | `telemetry-agent-skill` | `.skill/telemetry-agent-skill/` | `$telemetry` |
| **Flutter** | `flutter-bloc-patterns-agent-skill` | `.skill/flutter-bloc-patterns-agent-skill/` | `$bloc` |
| **Flutter** | `flutter-firebase-odoo-agent-skill` | `.skill/flutter-firebase-odoo-agent-skill/` | `$odoo` |
| **Flutter** | `flutter-payments-agent-skill` | `.skill/flutter-payments-agent-skill/` | `$pay` |
| **Web** | `web-react-agent-skill` | `.skill/web-react-agent-skill/` | `$react` |
| **Web** | `web-svelte-agent-skill` | `.skill/web-svelte-agent-skill/` | `$svelte` |
| **Web** | `web-realtime-agent-skill` | `.skill/web-realtime-agent-skill/` | `$realtime` |
| **Web** | `three-js-agent-skills` | `.skill/three-js-agent-skills/` | `$threejs` |
| **Web** | `wordpress-agent-skill` | `.skill/wordpress-agent-skill/` | `$wp` |
| **Backend** | `backend-auth-oauth-agent-skill` | `.skill/backend-auth-oauth-agent-skill/` | `$auth` |
| **Backend** | `backend-graphql-agent-skill` | `.skill/backend-graphql-agent-skill/` | `$gql` |
| **Backend** | `backend-stripe-agent-skill` | `.skill/backend-stripe-agent-skill/` | `$stripe` |
| **Game** | `godot-steamworks-agent-skill` | `.skill/godot-steamworks-agent-skill/` | `$steam` |
| **Game** | `godot-firebase-agent-skill` | `.skill/godot-firebase-agent-skill/` | `$godotfire` |
| **Game** | `godot-mobile-monetization-agent-skill` | `.skill/godot-mobile-monetization-agent-skill/` | `$mobile` |
| **Game** | `godot-dialogue-plugin-agent-skill` | `.skill/godot-dialogue-plugin-agent-skill/` | `$dialogue` |
| **Game** | `godot-nakama-agent-skill` | `.skill/godot-nakama-agent-skill/` | `$nakama` |
| **Go** | `go-plc-modbus-agent-skill` | `.skill/go-plc-modbus-agent-skill/` | `$goplc` |
| **Kotlin** | `kotlin-jetpack-compose-agent-skill` | `.skill/kotlin-jetpack-compose-agent-skill/` | `$compose` |
| **Kotlin** | `kotlin-coroutines-flow-agent-skill` | `.skill/kotlin-coroutines-flow-agent-skill/` | `$coroutines` |
| **Kotlin** | `kotlin-room-sqlite-agent-skill` | `.skill/kotlin-room-sqlite-agent-skill/` | `$room` |
| **Python** | `python-fastapi-pydantic-agent-skill` | `.skill/python-fastapi-pydantic-agent-skill/` | `$fastapi` |
| **Python** | `python-langchain-agents-agent-skill` | `.skill/python-langchain-agents-agent-skill/` | `$langchain` |
| **Python** | `python-pandas-data-agent-skill` | `.skill/python-pandas-data-agent-skill/` | `$pandas` |
| **Python** | `python-blender-addon-agent-skill` | `.skill/python-blender-addon-agent-skill/` | `$blender` |
| **Rust** | `rust-plc-modbus-agent-skill` | `.skill/rust-plc-modbus-agent-skill/` | `$rustplc` |
| **SecondBrain** | `lore-agent-skill` | `.skill/lore-agent-skill/` | `$lore` |
| **Swift** | `swiftui-navigation-state-agent-skill` | `.skill/swiftui-navigation-state-agent-skill/` | `$swiftui` |
| **Swift** | `swift-async-concurrency-agent-skill` | `.skill/swift-async-concurrency-agent-skill/` | `$async` |
| **Swift** | `swift-swiftdata-realm-agent-skill` | `.skill/swift-swiftdata-realm-agent-skill/` | `$swiftdata` |

---

## ⚡ Registro Activo de Tareas de Skills (`overview/work/skill/`)

Una skill no debe limitarse a actuar como un visor pasivo o dar respuestas efímeras en el chat. Al ejecutarse o auditar el proyecto (`$skill:audit` o `$skill`), cada skill **debe persistir sus hallazgos y tareas accionables** en el proyecto dentro de la carpeta `overview/work/skill/`.

### Reglas del Contrato de Interacción Activa:
1. **Creación Automática**: Si la carpeta `overview/work/skill/` no existe en el proyecto cliente, la skill la crea automáticamente al ejecutarse.
2. **Nomenclatura Obligatoria de Archivos (`overview/work/skill/<skill-name>.md`)**: Cada skill escribe exclusivamente en su propio archivo Markdown dentro de dicha carpeta, utilizando el nombre canónico del dominio de la skill:
   - `.skill/firebase-auth-agent-skill` → `overview/work/skill/firebase-auth.md`
   - `.skill/monitoring-agent-skill` → `overview/work/skill/monitoring.md`
   - `.skill/security-agent-skill` → `overview/work/skill/security.md`
3. **Tabla Estandarizada de Actividades**: Todo archivo `overview/work/skill/<skill-name>.md` debe contener obligatoriamente una tabla estructurada con las columnas: `ID`, `Tipo`, `Estado`, `Resumen`, `Evidencia/Ruta` y `Acción Requerida`.
4. **Consolidación y Triaje en `*-agent-rules`**: El agente core de gobernanza (`.agents`) escanea `overview/work/skill/` durante `$boot`, `$work` y `$close` e integra las tareas identificadas por las skills a los rastreadores principales del proyecto según su tipo:
   - 🛠️ **Deuda Técnica** (`overview/work/deuda_tecnica.md`): Refactorizaciones, mejoras de arquitectura o problemas de calidad.
   - 📋 **Pendientes** (`overview/work/pendientes.md`): Requerimientos secundarios, configuraciones a futuro o tareas de media/baja prioridad.
   - 🎯 **Tasks / Tareas Inmediatas** (`overview/work/tasks.md` e índice maestro `overview/work.md`): Bugs críticos, fallos de seguridad o parches urgentes.
   - El archivo `overview/work/skill/<skill-name>.md` se conserva de forma permanente como la fuente de detalle, respuesta completa y evidencia técnica provista por la skill.

### Plantilla Oficial de Reporte de Skill (`overview/work/skill/<skill-name>.md`):

```markdown
# 📋 Registro Activo de Tareas — <Skill Name>

> **Generado por**: `<skill-name>-agent-skill` (`$<skill-alias>:audit`)  
> **Última actualización**: YYYY-MM-DD  

## 🎯 Tareas Pendientes Accionables

| ID | Tipo | Estado | Resumen | Evidencia/Ruta | Acción Requerida |
|---|---|---|---|---|---|
| SEC-01 | Fix | Pendiente | API Key hardcodeada en fuente | `src/core/config.<ext>:L14` | Mover secreto a `.env` / gestor de secretos |

## 📝 Observaciones y Notas
- Contexto adicional o hallazgos relevantes de la auditoría.
```

---

## 🔒 Inviolabilidades del Estándar

1. **`.agents/` es intocable.** Contiene exclusivamente el repositorio oficial `*-agent-rules`. Nunca se crea ni modifica nada dentro de `.agents/` desde el proyecto local.
2. **Las skills van en `.skill/`, nunca dentro de `.agents/`.** La carpeta `.skill/` vive al mismo nivel que `.agents/` en la raíz del proyecto huésped.
3. **El nombre del directorio en `.skill/` es el nombre completo del repositorio.** Ejemplo: `.skill/<nombre>-agent-skill/`, no alias simplificados como `.skill/auth/` o `.skill/firebase/`.
4. **Los archivos de skill son de solo lectura en el proyecto huésped.** Nunca modificar directamente una skill desde un proyecto cliente.
5. **El aprendizaje candidato va a `overview/learning.md`.** Si una skill requiere mejora, registrar la propuesta en el proyecto huésped y promoverla al repo oficial.
6. **Una skill no duplica reglas de gobernanza.** Las reglas `$boot`, `$work`, `$close` pertenecen a `*-agent-rules`, no a una skill.
7. **Una skill no asume el stack del proyecto.** Sus reglas canónicas deben funcionar en cualquier contexto de uso definido por su alcance (transversal o especializado).

