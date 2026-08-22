# ðŸ“‹ Estado y Pendientes del Ecosistema Agent Rules & Skills

> **Referencia de estado del ecosistema `Agent-Rules-Ecosystem`**  
> Actualizado: 2026-08-21 Â· SesiÃ³n: AuditorÃ­a, CreaciÃ³n de Skills Game y SincronizaciÃ³n Git

---

## âœ… Completado en esta sesiÃ³n

| Repositorio / Documento | Estado | Detalles de la AcciÃ³n |
|---|---|---|
| `game-agent-rules` | âœ… Corregido | Conflictos de merge resueltos en `core/commands.md` y `core/path_map.md`. |
| `godot-steamworks-agent-skill` | âœ… Creado | Estructura canÃ³nica ($steam) para GodotSteam (Achievements, Cloud Save, Workshop, Lobbies). |
| `godot-firebase-agent-skill` | âœ… Creado | Estructura canÃ³nica ($godotfire) para Firebase Auth, Firestore, RTDB y Cloud Save. |
| `godot-mobile-monetization-agent-skill` | âœ… Creado | Estructura canÃ³nica ($mobile) para AdMob, IAP, Google Play Games y Game Center. |
| `godot-dialogue-plugin-agent-skill` | âœ… Creado | Estructura canÃ³nica ($dialogue) para Dialogue Manager y Yarn Spinner. |
| `godot-nakama-agent-skill` | âœ… Creado | Estructura canÃ³nica ($nakama) para servidor multiplayer Nakama. |
| `SKILL_STANDARD.md` | âœ… Actualizado | Tabla de skills e instalaciÃ³n expandida con las 17 skills del ecosistema. |
| **Push General a GitHub** | âœ… Sincronizado | Todos los 21 repositorios del ecosistema agregados, commiteados y empujados a `Agent-Rules-Ecosystem`. |

---

## ðŸ—‚ï¸ Inventario Completo del Ecosistema (100% Sincronizado)

### 1. Gobernanza por Dominio (`*-agent-rules`)

| Repositorio | Dominio | Estado |
|---|---|---|
| `flutter-agent-rules` | Flutter / Mobile | âœ… Referencia CanÃ³nica |
| `web-agent-rules` | Web (Svelte/React/Vue/Astro) | âœ… Completo |
| `backend-agent-rules` | Backend (Node/Python/DBs) | âœ… Completo |
| `game-agent-rules` | Godot 4 / Game Dev | âœ… Completo y Sin Conflictos |

### 2. Skills Transversales (`*-agent-skill`)

| Repositorio | Alias | Cobertura |
|---|---|---|
| `infra-agent-skill` | `$infra` | Docker, Kubernetes, CI/CD |
| `monitoring-agent-skill` | `$monitoring` | Logging, APM, MÃ©tricas |
| `security-agent-skill` | `$security` | AuditorÃ­a OWASP, Secretos |

### 3. Skills Especializadas por Dominio (`*-agent-skill`)

#### Flutter
- `flutter-bloc-patterns-agent-skill` (`$bloc`)
- `flutter-firebase-auth-agent-skill` (`$auth`)
- `flutter-firebase-odoo-agent-skill` (`$odoo`)
- `flutter-payments-agent-skill` (`$pay`) â€” âœ… Creado localmente

#### Web
- `web-svelte-patterns-agent-skill` (`$svelte`)
- `web-realtime-agent-skill` (`$realtime`)
- `three-js-agent-skills` (`$threejs`)
- `wordpress-agent-skill` (`$wp`) â€” âœ… Creado y Sincronizado

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


