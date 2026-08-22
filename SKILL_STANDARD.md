# ðŸ“ Agent Skill Standard â€” EspecificaciÃ³n Oficial

> **Referencia canÃ³nica para la creaciÃ³n, validaciÃ³n y mantenimiento de cualquier `*-agent-skill`** dentro del ecosistema `Agent-Rules-Ecosystem`.  
> Toda skill existente o futura debe cumplir con esta especificaciÃ³n para ser considerada vÃ¡lida.

**VersiÃ³n**: 1.0 Â· **Fecha**: 2026-08-21 Â· **Repositorio**: `agent-rules-ecosystem`

---

## ðŸ“Œ Â¿QuÃ© es una Skill?

Una **skill** (`*-agent-skill`) es un repositorio Git independiente que inyecta **conocimiento especializado y comportamiento operativo** en un agente de IA. Se distingue de una **rule** (`*-agent-rules`) en que:

| | `*-agent-rules` | `*-agent-skill` |
|---|---|---|
| **Define** | CÃ“MO trabaja la IA (rituales, gobernanza, estado) | QUÃ‰ sabe hacer la IA (dominio tÃ©cnico) |
| **Contiene** | `$boot`, `$work`, `$close`, `overview/`, session tracking | Patrones, guÃ­as, snippets, comandos de dominio |
| **Alcance** | Global para el proyecto | Inyectable puntualmente segÃºn necesidad |
| **InstalaciÃ³n** | `.agents/` en raÃ­z del proyecto | `.agents/skills/<nombre>/` |

---

## ðŸ—‚ï¸ Estructura de Directorios Obligatoria

Todo repositorio `*-agent-skill` **debe** respetar exactamente la siguiente estructura:

```
<nombre>-agent-skill/
â”‚
â”œâ”€â”€ README.md                   â† [OBLIGATORIO] PresentaciÃ³n pÃºblica del repositorio
â”œâ”€â”€ AGENTS.md                   â† [OBLIGATORIO] Directiva de bootstrap multi-agente
â”œâ”€â”€ SKILL.md                    â† [OBLIGATORIO] Matriz de capacidades y protocolos de auditorÃ­a
â”‚
â”œâ”€â”€ adapters/                   â† [OBLIGATORIO] Adaptadores por herramienta de IA
â”‚   â”œâ”€â”€ GEMINI.md               â† Adaptador para Google Gemini / Antigravity
â”‚   â”œâ”€â”€ CLAUDE.md               â† Adaptador para Anthropic Claude
â”‚   â”œâ”€â”€ AGENTS.md               â† Adaptador universal OpenAI / Codex
â”‚   â”œâ”€â”€ cursor-rule.mdc         â† Regla de integraciÃ³n para Cursor IDE
â”‚   â””â”€â”€ README.md               â† Ãndice de adaptadores disponibles
â”‚
â”œâ”€â”€ core/                       â† [OBLIGATORIO] NÃºcleo operativo de la habilidad
â”‚   â”œâ”€â”€ commands.md             â† Registro de $-comandos de dominio
â”‚   â”œâ”€â”€ brain.md                â† Motor de decisiones y matrices de diagnÃ³stico
â”‚   â””â”€â”€ path_map.md             â† Mapa canÃ³nico de rutas relevantes del proyecto
â”‚
â”œâ”€â”€ knowledge/                  â† [OBLIGATORIO] GuÃ­as tÃ©cnicas de dominio (mÃ­n. 2 archivos)
â”‚   â””â”€â”€ <tema>.md               â† Una guÃ­a por tema o Ã¡rea de conocimiento
â”‚
â”œâ”€â”€ resources/                  â† [RECOMENDADO] Plantillas, templates y cÃ³digo listo para usar
â”‚   â””â”€â”€ <recurso>.md            â† Plantillas, fragmentos de cÃ³digo y configs en formato Markdown
â”‚
â””â”€â”€ scripts/                    â† [RECOMENDADO] Scripts de diagnÃ³stico o automatizaciÃ³n
    â””â”€â”€ <script>.md             â† Scripts explicados en bloques de cÃ³digo dentro de Markdown
```

> âš ï¸ **Regla de Formato 100% Markdown**: Todo el contenido de una skill (incluyendo `resources/` y `scripts/`) **DEBE ser 100% archivos `.md`** (Markdown con bloques de cÃ³digo explÃ­citos). **NO SE PERMITEN** archivos fuente ejecutable crudos (`.dart`, `.py`, `.sh`, `.yml`, `.json`, etc.). Esto previene falsos positivos en los analizadores de cÃ³digo/IDEs y mantiene el ecosistema totalmente declarativo y documental.

---

## ðŸ“„ EspecificaciÃ³n de Archivos Obligatorios

### 1. `README.md` â€” PresentaciÃ³n PÃºblica

**PropÃ³sito**: Primer punto de contacto. Debe permitir a un desarrollador entender en 30 segundos quÃ© hace la skill y cÃ³mo activarla.

**Estructura requerida** (en este orden):

```markdown
# <emoji> <Nombre Human-Readable> Agent Skill

> **DescripciÃ³n** â€” Una lÃ­nea describiendo el dominio y la cobertura de la skill.
> Debe indicar explÃ­citamente si es **Transversal** (agnÃ³stica) o **Especializada** (ej. Flutter).

---

## ðŸ“Œ PropÃ³sito y Alcance
Lista numerada de 3â€“6 capacidades clave con emoji por Ã­tem.

## âš¡ $-Comandos de <Dominio>
Tabla Markdown con columnas: Comando | AcciÃ³n | DescripciÃ³n

## ðŸ§© Arquitectura / Diagrama de Flujo
Diagrama Mermaid (graph TD o graph LR) ilustrando el flujo principal de la skill.

## ðŸ“¦ InstalaciÃ³n como SubmÃ³dulo
Bloque de cÃ³digo bash con el comando git submodule add.
Seguido del trigger de activaciÃ³n de sesiÃ³n.
```

---

### 2. `AGENTS.md` â€” Directiva de Bootstrap Multi-Agente

**PropÃ³sito**: El agente lo carga primero. Define cuÃ¡ndo y cÃ³mo arrancar la skill, y cuÃ¡les son las reglas canÃ³nicas no negociables.

**Estructura requerida**:

```markdown
---
name: <nombre-exacto-del-repo>
description: <DescripciÃ³n breve en inglÃ©s â€” una lÃ­nea>
---

# <emoji> <Nombre> Skill Directive

## Bootstrap de la Habilidad

Lista numerada de archivos a cargar en orden, con flecha â† y descripciÃ³n.

## Reglas CanÃ³nicas [de <Dominio>] [AgnÃ³sticas]

Lista de 4â€“6 reglas absolutas e inviolables para esta skill.
Cada regla debe ser prescriptiva (evitar lenguaje vago).
```

**Reglas de redacciÃ³n**:
- El bloque YAML frontmatter (`---`) es **obligatorio**.
- El campo `name` debe coincidir exactamente con el nombre del directorio del repo.
- Las reglas canÃ³nicas deben ser prohibiciones o afirmaciones fuertes (ej. "Nunca X", "Todo Y debe Z").

---

### 3. `SKILL.md` â€” Matriz de Capacidades y Protocolos

**PropÃ³sito**: El documento mÃ¡s denso tÃ©cnicamente. Contiene la lÃ³gica operativa de la skill que el agente usa durante una tarea activa.

**Estructura requerida**:

```markdown
# <emoji> <Nombre> Skill Matrix & Directives

## ðŸŽ¯ Capacidades de la Habilidad
Diagrama Mermaid (graph LR) mostrando las sub-habilidades que convergen en el core.

## ðŸ“‹ Protocolo de AuditorÃ­a de <Dominio> (`$<cmd>:audit`)
Lista jerarquizada con las verificaciones que realiza la auditorÃ­a automÃ¡tica.

## <SecciÃ³n TÃ©cnica Central>
Plantilla de cÃ³digo, matriz de decisiÃ³n o tabla comparativa del dominio principal.
MÃ­nimo 1 bloque de cÃ³digo o tabla con el patrÃ³n canÃ³nico de la skill.
```

---

### 4. `adapters/` â€” Adaptadores por Herramienta de IA

**PropÃ³sito**: Permite que cualquier herramienta de IA lea la skill en su formato nativo.

| Archivo | Herramienta | Contenido MÃ­nimo |
|---|---|---|
| `GEMINI.md` | Google Gemini / Antigravity | 2â€“4 lÃ­neas: trigger + rutas a AGENTS.md y SKILL.md |
| `CLAUDE.md` | Anthropic Claude | 2â€“4 lÃ­neas: trigger + rutas a AGENTS.md y SKILL.md |
| `AGENTS.md` | OpenAI / Codex | 2â€“4 lÃ­neas: trigger + ruta a AGENTS.md |
| `cursor-rule.mdc` | Cursor IDE | Frontmatter YAML con `description` y `globs` + regla de 1 lÃ­nea |
| `README.md` | Humanos | Ãndice de los 4 adaptadores disponibles |

**Formato de cursor-rule.mdc**:
```yaml
---
description: <DescripciÃ³n concisa de cuÃ¡ndo aplica>
globs: ["<patrÃ³n-glob-1>", "<patrÃ³n-glob-2>"]
---

<Regla en 1â€“2 lÃ­neas referenciando el SKILL.md>
```

---

### 5. `core/` â€” NÃºcleo Operativo

#### `core/commands.md`
Lista de todos los `$-comandos` de la skill con su sintaxis y descripciÃ³n breve.  
Formato: lista markdown, un Ã­tem por comando.

#### `core/brain.md`
Motor de decisiones. Responde la pregunta: **"Â¿CÃ³mo decide el agente quÃ© hacer ante X situaciÃ³n?"**  
Estructura: matrices `Si X â†’ Entonces Y`, Ã¡rboles de decisiÃ³n o tablas de triaje.

#### `core/path_map.md`
Mapa de rutas canÃ³nicas del proyecto que la skill monitorea o modifica.  
Formato: lista markdown con la ruta y su descripciÃ³n en una lÃ­nea.

---

### 6. `knowledge/` â€” GuÃ­as de Dominio

**PropÃ³sito**: Contexto tÃ©cnico de referencia. El agente lee estos documentos cuando necesita profundidad en un subtema.

**Reglas**:
- MÃ­nimo **2 archivos** de conocimiento.
- MÃ¡ximo recomendado: **6 archivos** (si necesitas mÃ¡s, considera dividir la skill).
- Cada archivo cubre **un solo tema** de forma autocontenida.
- Nombrar en `snake_case` describiendo el tema: `docker_containerization.md`, `owasp_mitigation.md`.
- Los archivos de `knowledge/` **no son directivas operativas** â€” son referencias consultivas.

---

## ðŸ·ï¸ Naming Convention

```
<dominio>-agent-skill            â† Skill especializada (ej. flutter-bloc-patterns-agent-skill)
<tecnologia>-agent-skill         â† Skill transversal (ej. infra-agent-skill, security-agent-skill)
<plataforma>-<tech>-agent-skill  â† Skill de integraciÃ³n (ej. flutter-firebase-auth-agent-skill)
```

**Reglas de nombres**:
- Todo en `kebab-case` en minÃºsculas.
- Siempre terminar en `-agent-skill`.
- El prefijo describe el dominio o plataforma objetivo.
- Si es Transversal: nombre corto sin prefijo de plataforma (ej. `security-agent-skill`).
- Si es Especializada: prefijo de plataforma (ej. `flutter-bloc-patterns-agent-skill`).

---

## âš¡ Comandos de Dominio â€” EstÃ¡ndar de $-Comandos

Toda skill debe exponer sus operaciones como **$-comandos** siguiendo el patrÃ³n:

```
$<skill-alias>                   â† Bootstrap / activaciÃ³n de la skill
$<skill-alias>:audit             â† DiagnÃ³stico y auditorÃ­a del dominio
$<skill-alias>:<accion> [param]  â† OperaciÃ³n especÃ­fica
```

**Ejemplos correctos**:
```
$infra                           â† Activar skill de infraestructura
$infra:check                     â† AuditorÃ­a completa
$infra:docker [target]           â† GeneraciÃ³n de Dockerfile
$bloc                            â† Activar skill de BLoC
$bloc:create [FeatureName]       â† Generar BLoC completo
$auth:audit                      â† AuditorÃ­a de autenticaciÃ³n
$security:secrets                â† Escaneo de llaves hardcodeadas
```

**Reglas**:
- El alias base debe coincidir con el dominio central de la skill (corto y memorable).
- Siempre debe existir un comando base sin sufijo (`$alias`) que haga el bootstrap.
- Siempre debe existir un `$alias:audit` que dispare el diagnÃ³stico del dominio.

---

## ðŸ”„ Checklist de ValidaciÃ³n de una Skill

Antes de hacer commit o publicar una skill, verificar:

### âœ… Estructura
- [ ] `README.md` presente y con las 4 secciones requeridas
- [ ] `AGENTS.md` con frontmatter YAML vÃ¡lido y reglas canÃ³nicas
- [ ] `SKILL.md` con diagrama Mermaid de capacidades y protocolo de auditorÃ­a
- [ ] `adapters/GEMINI.md` con trigger y rutas correctas
- [ ] `adapters/CLAUDE.md` con trigger y rutas correctas
- [ ] `adapters/AGENTS.md` con trigger y rutas correctas
- [ ] `adapters/cursor-rule.mdc` con frontmatter `description` y `globs`
- [ ] `adapters/README.md` con Ã­ndice de los adaptadores
- [ ] `core/commands.md` con lista de $-comandos
- [ ] `core/brain.md` con matrices de decisiÃ³n
- [ ] `core/path_map.md` con rutas canÃ³nicas del dominio
- [ ] `knowledge/` con mÃ­nimo 2 archivos de guÃ­as tÃ©cnicas

### âœ… Contenido
- [ ] El campo `name` de `AGENTS.md` coincide exactamente con el nombre del directorio
- [ ] Existe al menos 1 diagrama Mermaid (en README.md o SKILL.md)
- [ ] Los $-comandos en `core/commands.md` coinciden con los listados en `README.md`
- [ ] Las rutas en `core/path_map.md` son rutas genÃ©ricas (no hardcodeadas a un proyecto)
- [ ] Los adaptadores apuntan a la ruta `.skill/<nombre-repo>/` (no rutas absolutas ni rutas dentro de `.agents/`)
- [ ] `resources/` contiene al menos 1 template o ejemplo de cÃ³digo

### âœ… Calidad AgnÃ³stica (para Skills Transversales)
- [ ] No contiene referencias a lenguajes o plataformas especÃ­ficas en reglas canÃ³nicas
- [ ] Los ejemplos de cÃ³digo usan comentarios genÃ©ricos (`<install-command>`, `<build-command>`)
- [ ] El `AGENTS.md` no menciona rutas de archivos propias de un framework especÃ­fico

### âœ… Calidad Especializada (para Skills de Plataforma)
- [ ] El prefijo de nombre refleja la plataforma (ej. `flutter-`)
- [ ] El `README.md` menciona explÃ­citamente la plataforma objetivo
- [ ] Los snippets de cÃ³digo estÃ¡n en el lenguaje de la plataforma

---

## ðŸ”— InstalaciÃ³n EstÃ¡ndar en un Proyecto

### âš ï¸ Regla de Aislamiento â€” `.agents/` es Intocable

`.agents/` contiene **Ãºnicamente** el repositorio oficial de gobernanza (`*-agent-rules`). **Nunca** se aÃ±ade nada dentro de `.agents/`. Las skills van en una carpeta separada `.skill/` al mismo nivel.

### Estructura de instalaciÃ³n canÃ³nica

```
proyecto-huÃ©sped/
â”œâ”€â”€ .agents/                                   â† submÃ³dulo *-agent-rules (SOLO LECTURA)
â”‚   â”œâ”€â”€ core/
â”‚   â”œâ”€â”€ adapters/
â”‚   â”œâ”€â”€ knowledge/
â”‚   â””â”€â”€ templates/
â”‚
â””â”€â”€ .skill/                                    â† directorio de skills (creado manualmente)
    â”œâ”€â”€ <nombre-skill-1>-agent-skill/          â† git submodule add ...
    â””â”€â”€ <nombre-skill-2>-agent-skill/          â† git submodule add ...
```

### Comandos de instalaciÃ³n

```bash
# 1. Crear la carpeta .skill/ si no existe
mkdir -p .skill

# 2. AÃ±adir cada skill requerida como submÃ³dulo usando el nombre completo del repositorio
git submodule add https://github.com/Agent-Rules-Ecosystem/<nombre>-agent-skill.git .skill/<nombre>-agent-skill
# (repetir para cada skill requerida por el proyecto)
```

> **Importante**: El nombre del directorio dentro de `.skill/` debe ser el nombre **completo** del repositorio, no un alias corto. Esto garantiza trazabilidad directa entre la carpeta local y el repo de origen.

### Tabla de Skills Disponibles e InstalaciÃ³n

| Dominio | Repositorio | Ruta de instalaciÃ³n | Comando |
|---|---|---|---|
| **Transversal** | `infra-agent-skill` | `.skill/infra-agent-skill/` | `$infra` |
| **Transversal** | `monitoring-agent-skill` | `.skill/monitoring-agent-skill/` | `$monitoring` |
| **Transversal** | `security-agent-skill` | `.skill/security-agent-skill/` | `$security` |
| **Flutter** | `flutter-bloc-patterns-agent-skill` | `.skill/flutter-bloc-patterns-agent-skill/` | `$bloc` |
| **Flutter** | `flutter-firebase-auth-agent-skill` | `.skill/flutter-firebase-auth-agent-skill/` | `$auth` |
| **Flutter** | `flutter-firebase-odoo-agent-skill` | `.skill/flutter-firebase-odoo-agent-skill/` | `$odoo` |
| **Flutter** | `flutter-payments-agent-skill` | `.skill/flutter-payments-agent-skill/` | `$pay` |
| **Web** | `web-svelte-patterns-agent-skill` | `.skill/web-svelte-patterns-agent-skill/` | `$svelte` |
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

---

## ⚡ Registro Activo de Tareas de Skills (`overview/work/skill/`)

Una skill no debe limitarse a actuar como un visor pasivo o dar respuestas efímeras en el chat. Al ejecutarse o auditar el proyecto (`$skill:audit` o `$skill`), cada skill **debe persistir sus hallazgos y tareas accionables** en el proyecto dentro de la carpeta `overview/work/skill/`.

### Reglas del Contrato de Interacción Activa:
1. **Creación Automática**: Si la carpeta `overview/work/skill/` no existe en el proyecto cliente, la skill la crea automáticamente al ejecutarse.
2. **Nomenclatura Obligatoria de Archivos (`overview/work/skill/<skill-name>.md`)**: Cada skill escribe exclusivamente en su propio archivo Markdown dentro de dicha carpeta, utilizando el nombre canónico del dominio de la skill:
   - `.skill/flutter-firebase-auth-agent-skill` → `overview/work/skill/flutter-firebase-auth.md`
   - `.skill/monitoring-agent-skill` → `overview/work/skill/monitoring.md`
   - `.skill/security-agent-skill` → `overview/work/skill/security.md`
3. **Tabla Estandarizada de Actividades**: Todo archivo `overview/work/skill/<skill-name>.md` debe contener obligatoriamente una tabla estructurada con las columnas: `ID`, `Tipo`, `Estado`, `Resumen`, `Evidencia/Ruta` y `Acción Requerida`.
4. **Consolidación en `*-agent-rules`**: El agente core de gobernanza (`.agents`) escanea `overview/work/skill/` durante `$boot`, `$work` y `$close` e integra estas tareas al índice maestro `overview/work.md` para su ejecución directa en el proyecto.

### Plantilla Oficial de Reporte de Skill (`overview/work/skill/<skill-name>.md`):

```markdown
# 📋 Registro Activo de Tareas — <Skill Name>

> **Generado por**: `<skill-name>-agent-skill` (`$<skill-alias>:audit`)  
> **Última actualización**: YYYY-MM-DD  

## 🎯 Tareas Pendientes Accionables

| ID | Tipo | Estado | Resumen | Evidencia/Ruta | Acción Requerida |
|---|---|---|---|---|---|
| SEC-01 | Fix | Pendiente | API Key hardcodeada en fuente | `lib/core/config.dart:L14` | Mover secreto a `.env` / gestor de secretos |

## 📝 Observaciones y Notas
- Contexto adicional o hallazgos relevantes de la auditoría.
```

---

## 🔒 Inviolabilidades del Estándar

1. **`.agents/` es intocable.** Contiene exclusivamente el repositorio oficial `*-agent-rules`. Nunca se crea ni modifica nada dentro de `.agents/` desde el proyecto local.
2. **Las skills van en `.skill/`, nunca dentro de `.agents/`.** La carpeta `.skill/` vive al mismo nivel que `.agents/` en la raÃ­z del proyecto huÃ©sped.
3. **El nombre del directorio en `.skill/` es el nombre completo del repositorio.** Ejemplo: `.skill/<nombre>-agent-skill/`, no alias simplificados como `.skill/auth/` o `.skill/firebase/`.
4. **Los archivos de skill son de solo lectura en el proyecto huÃ©sped.** Nunca modificar directamente una skill desde un proyecto cliente.
5. **El aprendizaje candidato va a `overview/learning.md`.** Si una skill requiere mejora, registrar la propuesta en el proyecto huÃ©sped y promoverla al repo oficial.
6. **Una skill no duplica reglas de gobernanza.** Las reglas `$boot`, `$work`, `$close` pertenecen a `*-agent-rules`, no a una skill.
7. **Una skill no asume el stack del proyecto.** Sus reglas canÃ³nicas deben funcionar en cualquier contexto de uso definido por su alcance (transversal o especializado).

