# 📐 Agent Skill Standard — Especificación Oficial

> **Referencia canónica para la creación, validación y mantenimiento de cualquier `*-agent-skill`** dentro del ecosistema `xolotl-hub`.  
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
| **Instalación** | `.agents/` en raíz del proyecto | `.agents/skills/<nombre>/` |

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
│   └── <recurso>               ← Archivos, código, configuraciones de ejemplo
│
└── scripts/                    ← [RECOMENDADO] Scripts ejecutables de diagnóstico o automatización
    └── <script>                ← Scripts bash, python, etc.
```

> **Nota**: Los directorios `resources/` y `scripts/` son opcionales pero **altamente recomendados**. Una skill sin recursos prácticos es incompleta.

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
<plataforma>-<tech>-agent-skill  ← Skill de integración (ej. flutter-firebase-auth-agent-skill)
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
- [ ] Los adaptadores apuntan a la ruta `.agents/skills/<alias>/` (no rutas absolutas)
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

```bash
# Añadir una skill como submódulo en la carpeta .agents/skills/
git submodule add https://github.com/xolotl-hub/<nombre>-agent-skill.git .agents/skills/<alias>
```

| Skill | Alias recomendado | Comando de activación |
|---|---|---|
| `infra-agent-skill` | `infra` | `$infra` |
| `monitoring-agent-skill` | `monitoring` | `$monitoring` |
| `security-agent-skill` | `security` | `$security` |
| `flutter-bloc-patterns-agent-skill` | `flutter-bloc` | `$bloc` |
| `flutter-firebase-auth-agent-skill` | `flutter-auth` | `$auth` |
| `flutter-firebase-odoo-agent-skill` | `flutter-odoo` | `$odoo` |

---

## 🔒 Inviolabilidades del Estándar

1. **Los archivos de skill son de solo lectura en el proyecto huésped.** Nunca modificar directamente una skill desde un proyecto cliente.
2. **El aprendizaje candidato va a `overview/learning.md`.** Si una skill requiere mejora, registrar la propuesta en el proyecto huésped y promoverla al repo oficial.
3. **Una skill no duplica reglas de gobernanza.** Las reglas `$boot`, `$work`, `$close` pertenecen a `*-agent-rules`, no a una skill.
4. **Una skill no asume el stack del proyecto.** Sus reglas canónicas deben funcionar en cualquier contexto de uso definido por su alcance (transversal o especializado).
