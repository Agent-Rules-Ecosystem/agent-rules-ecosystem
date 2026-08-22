# 📋 Estado y Pendientes del Ecosistema Agent Rules & Skills

> **Referencia de estado del ecosistema `xolotl-hub`**  
> Actualizado: 2026-08-21 · Sesión: Auditoría, Creación de Skills Game y Sincronización Git

---

## ✅ Completado en esta sesión

| Repositorio / Documento | Estado | Detalles de la Acción |
|---|---|---|
| `game-agent-rules` | ✅ Corregido | Conflictos de merge resueltos en `core/commands.md` y `core/path_map.md`. |
| `godot-steamworks-agent-skill` | ✅ Creado | Estructura canónica ($steam) para GodotSteam (Achievements, Cloud Save, Workshop, Lobbies). |
| `godot-firebase-agent-skill` | ✅ Creado | Estructura canónica ($godotfire) para Firebase Auth, Firestore, RTDB y Cloud Save. |
| `godot-mobile-monetization-agent-skill` | ✅ Creado | Estructura canónica ($mobile) para AdMob, IAP, Google Play Games y Game Center. |
| `godot-dialogue-plugin-agent-skill` | ✅ Creado | Estructura canónica ($dialogue) para Dialogue Manager y Yarn Spinner. |
| `godot-nakama-agent-skill` | ✅ Creado | Estructura canónica ($nakama) para servidor multiplayer Nakama. |
| `SKILL_STANDARD.md` | ✅ Actualizado | Tabla de skills e instalación expandida con las 17 skills del ecosistema. |
| **Push General a GitHub** | ✅ Sincronizado | Todos los 21 repositorios del ecosistema agregados, commiteados y empujados a `xolotl-hub`. |

---

## 🗂️ Inventario Completo del Ecosistema (100% Sincronizado)

### 1. Gobernanza por Dominio (`*-agent-rules`)

| Repositorio | Dominio | Estado |
|---|---|---|
| `flutter-agent-rules` | Flutter / Mobile | ✅ Referencia Canónica |
| `web-agent-rules` | Web (Svelte/React/Vue/Astro) | ✅ Completo |
| `backend-agent-rules` | Backend (Node/Python/DBs) | ✅ Completo |
| `game-agent-rules` | Godot 4 / Game Dev | ✅ Completo y Sin Conflictos |

### 2. Skills Transversales (`*-agent-skill`)

| Repositorio | Alias | Cobertura |
|---|---|---|
| `infra-agent-skill` | `$infra` | Docker, Kubernetes, CI/CD |
| `monitoring-agent-skill` | `$monitoring` | Logging, APM, Métricas |
| `security-agent-skill` | `$security` | Auditoría OWASP, Secretos |

### 3. Skills Especializadas por Dominio (`*-agent-skill`)

#### Flutter
- `flutter-bloc-patterns-agent-skill` (`$bloc`)
- `flutter-firebase-auth-agent-skill` (`$auth`)
- `flutter-firebase-odoo-agent-skill` (`$odoo`)

#### Web
- `web-svelte-patterns-agent-skill` (`$svelte`)
- `web-realtime-agent-skill` (`$realtime`)
- `three-js-agent-skills` (`$threejs`)
- `wordpress-agent-skill` (`$wp`) — ✅ Creado y Sincronizado

#### Backend
- `backend-auth-oauth-agent-skill` (`$auth`)
- `backend-graphql-agent-skill` (`$gql`)
- `backend-stripe-agent-skill` (`$stripe`)

#### Game Dev (Godot 4)
- `godot-steamworks-agent-skill` (`$steam`)
- `godot-firebase-agent-skill` (`$godotfire`)
- `godot-mobile-monetization-agent-skill` (`$mobile`)
- `godot-dialogue-plugin-agent-skill` (`$dialogue`)
- `godot-nakama-agent-skill` (`$nakama`)

