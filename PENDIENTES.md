# 📋 Pendientes del Ecosistema de Agent Rules & Skills

> **Referencia de estado del ecosistema `xolotl-hub`**
> Actualizado: 2026-08-21 · Sesión: Auditoría y Normalización del Ecosistema

---

## ✅ Completado en esta sesión

| Repositorio | Corrección Aplicada |
|---|---|
| `web-agent-rules` | Identidad corregida (era clon literal de `flutter-agent-rules`). `knowledge/` reescrito para Web (Svelte, React, Vue, Astro). |
| `backend-agent-rules` | Identidad corregida. `knowledge/` reescrito para Backend (Node.js, Python, APIs, DBs). |
| `game-agent-rules` | `AGENTS.md` reparado (tenía conflictos de merge sin resolver). `knowledge/` ampliado con guías nativas de Godot 4. |
| `web-svelte-patterns-agent-skill` | Transformado de clon de `flutter-agent-rules` a estructura canónica de **skill**. `SKILL.md`, `AGENTS.md`, `core/`, `knowledge/`, `resources/` correctos. |
| `web-realtime-agent-skill` | Idem. Skill canónica de WebSockets/SSE con `$realtime:audit` y `$realtime:fix`. |
| `three-js-agent-skills` | Idem. Skill canónica de Three.js/WebGL con gestión de memoria GPU y optimización de render. |
| `backend-auth-oauth-agent-skill` | Transformado a skill canónica. OAuth2/JWT con `$auth:audit`, `$auth:fix`, `$auth:secrets`. |
| `backend-graphql-agent-skill` | Transformado a skill canónica. GraphQL N+1, schema design, seguridad con `$gql:audit`, `$gql:n1`. |
| `backend-stripe-agent-skill` | Transformado a skill canónica. Stripe webhooks, pagos, suscripciones con `$stripe:audit`, `$stripe:webhooks`. |
| `game-agent-skill/` | Directorio vacío — pendiente de definición (ver sección abajo). |

---

## 🔴 Alta Prioridad

### P1 — `game-agent-skill/` — Crear repositorios de Skills para Godot

El directorio `Game/game-agent-skill/` existe localmente pero está vacío. Definir y crear los repositorios de skills para Godot según la discusión de esta sesión:

> **Criterio**: Las skills de Godot son para SDKs/subsistemas específicos que no todo juego necesita.
> Los estándares universales (patrones base, arquitectura de nodos, convenciones GDScript) **ya están en `game-agent-rules/knowledge/`**.

| Skill candidata | Alias | Propósito | Estado |
|---|---|---|---|
| `godot-steamworks-agent-skill` | `$steam` | Integración GodotSteam (Logros, Cloud, Workshop, Matchmaking) | ⬜ Sin crear |
| `godot-firebase-agent-skill` | `$godotfire` | Auth de jugadores + Firestore/RTDB + Cloud Save en Godot | ⬜ Sin crear |
| `godot-mobile-monetization-agent-skill` | `$mobile` | AdMob, IAP, Google Play Games, Game Center iOS/Android | ⬜ Sin crear |
| `godot-dialogue-plugin-agent-skill` | `$dialogue` | Integración con Dialogue Manager (Nathan Hoad) o Yarn Spinner | ⬜ Sin crear |
| `godot-nakama-agent-skill` | `$nakama` | Servidor multiplayer open-source (Heroic Labs Nakama) | ⬜ Sin crear |

**Acción**: Crear repositorios en `xolotl-hub` → crear estructura canónica local → push.

---

### P2 — Flutter Skills — Auditar estructura canónica

Las 3 skills Flutter existentes aún tienen estructura de `flutter-agent-rules` (con `templates/`, `skills/`) en lugar de la estructura canónica de skill (`SKILL.md`, `knowledge/`, `resources/`). Requieren el mismo tratamiento que las skills Web y Backend.

| Skill | Alias actual | Revisión requerida |
|---|---|---|
| `flutter-bloc-patterns-agent-skill` | `$bloc` | Verificar presencia de `SKILL.md`, eliminar `templates/` y `skills/` si existen. Enriquecer `knowledge/` con patrones BLoC específicos. |
| `flutter-firebase-auth-agent-skill` | `$auth` | Ídem. Knowledge específico de Firebase Auth flows. |
| `flutter-firebase-odoo-agent-skill` | `$odoo` | ✅ Ya tiene estructura de skill correcta — verificar completitud de `knowledge/`. |

**Acción**: Abrir sesión dedicada para auditar y normalizar las 3 skills Flutter.

---

## 🟡 Media Prioridad

### P3 — `SKILL_STANDARD.md` — Actualizar tabla de skills disponibles

La tabla `### Tabla de skills disponibles` en `SKILL_STANDARD.md` (líneas 317-326) no lista las skills Web, Backend ni Game. Actualizar con el inventario completo.

**Archivo**: `agent-rules-ecosystem/SKILL_STANDARD.md`

### P4 — `agent-rules-ecosystem` README.md — Crear o actualizar

El `agent-rules-ecosystem` no tiene un README.md principal que sirva como índice del ecosistema completo. Crear un README que documente todos los repositorios `*-agent-rules` y `*-agent-skill` disponibles en `xolotl-hub`.

### P5 — `game-agent-rules` — Enriquecer `core/commands.md`

El `core/commands.md` de `game-agent-rules` es el mismo que `flutter-agent-rules` (con `flutter analyze` en `$close`). Debe adaptarse para Godot:
- Reemplazar `flutter analyze` por equivalente Godot (verificación de errores de script, warnings de escena).
- Adaptar discovery dinámico para identificar `project.godot` en lugar de `pubspec.yaml`.
- Agregar triggers de lore (`docs/lore/`) al protocolo de `$boot`.

### P6 — `game-agent-rules` — `core/path_map.md` actualizar rutas Godot

El `path_map.md` referencia rutas de Flutter (`pubspec.yaml`, `lib/`, etc.). Actualizar para reflejar rutas canónicas de Godot 4 (`project.godot`, `scenes/`, `scripts/`, `addons/`, `docs/lore/`).

---

## 🟢 Baja Prioridad

### P7 — Adaptadores de todas las skills Web/Backend

Los archivos en `adapters/` de las skills Web y Backend corregidas tienen contenido mínimo (heredado). Enriquecer:
- `adapters/GEMINI.md`, `adapters/CLAUDE.md`, `adapters/AGENTS.md` con triggers específicos del dominio.
- `adapters/cursor-rule.mdc` con `globs` correctos para cada skill.

### P8 — `web-agent-rules` — Agregar `core/brain.md` específico para Web

El `core/brain.md` de `web-agent-rules` referencia `flutter analyze` en el protocolo de cierre. Adaptar para proyectos Web:
- Reemplazar por `npm run lint` / `tsc --noEmit` / `pnpm check` según framework detectado.
- Adaptar discovery dinámico para identificar `package.json` como trigger de proyecto Web.

### P9 — `backend-agent-rules` — Adaptar `core/brain.md` para Backend

Similar al P8 pero para Backend:
- Discovery por `package.json` (Node) o `pyproject.toml` / `requirements.txt` (Python).
- Cierre: ejecutar `npm test` / `pytest` / `jest` según el stack detectado.

---

## 🗂️ Inventario Completo del Ecosistema (Estado Actual)

### `*-agent-rules` (Gobernanza por dominio)

| Repositorio | Estado | URL |
|---|---|---|
| `flutter-agent-rules` | ✅ Referencia canónica | `xolotl-hub/flutter-agent-rules` |
| `web-agent-rules` | ✅ Corregido (2026-08-21) | `xolotl-hub/web-agent-rules` |
| `backend-agent-rules` | ✅ Corregido (2026-08-21) | `xolotl-hub/backend-agent-rules` |
| `game-agent-rules` | ✅ Corregido (2026-08-21) | `xolotl-hub/game-agent-rules` |

### `*-agent-skill` Transversal (Aplican a todos los dominios)

| Repositorio | Alias | Estado |
|---|---|---|
| `infra-agent-skill` | `$infra` | ✅ Completo |
| `monitoring-agent-skill` | `$monitoring` | ✅ Completo |
| `security-agent-skill` | `$security` | ✅ Completo |

### `*-agent-skill` Flutter (Especializadas)

| Repositorio | Alias | Estado |
|---|---|---|
| `flutter-bloc-patterns-agent-skill` | `$bloc` | ⚠️ Pendiente auditoría estructura (P2) |
| `flutter-firebase-auth-agent-skill` | `$auth` | ⚠️ Pendiente auditoría estructura (P2) |
| `flutter-firebase-odoo-agent-skill` | `$odoo` | ✅ Estructura correcta |

### `*-agent-skill` Web (Especializadas)

| Repositorio | Alias | Estado |
|---|---|---|
| `web-svelte-patterns-agent-skill` | `$svelte` | ✅ Corregido (2026-08-21) |
| `web-realtime-agent-skill` | `$realtime` | ✅ Corregido (2026-08-21) |
| `three-js-agent-skills` | `$threejs` | ✅ Corregido (2026-08-21) |

### `*-agent-skill` Backend (Especializadas)

| Repositorio | Alias | Estado |
|---|---|---|
| `backend-auth-oauth-agent-skill` | `$auth` | ✅ Corregido (2026-08-21) |
| `backend-graphql-agent-skill` | `$gql` | ✅ Corregido (2026-08-21) |
| `backend-stripe-agent-skill` | `$stripe` | ✅ Corregido (2026-08-21) |

### `*-agent-skill` Game (Especializadas — Pendientes)

| Repositorio | Alias | Estado |
|---|---|---|
| `godot-steamworks-agent-skill` | `$steam` | ⬜ Sin crear (P1) |
| `godot-firebase-agent-skill` | `$godotfire` | ⬜ Sin crear (P1) |
| `godot-mobile-monetization-agent-skill` | `$mobile` | ⬜ Sin crear (P1) |
| `godot-dialogue-plugin-agent-skill` | `$dialogue` | ⬜ Sin crear (P1) |
| `godot-nakama-agent-skill` | `$nakama` | ⬜ Sin crear (P1) |
