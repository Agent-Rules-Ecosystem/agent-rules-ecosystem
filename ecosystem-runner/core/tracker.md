# 🎯 Tracker de Gobernanza y Congruencia Ecosistémica (3 Capas)

> **Propósito**: Registro agentico y persistente del estado de cumplimiento de los 11 Cores y Skills del ecosistema a través de 3 capas de validación.

---

## 🎨 Leyenda de Estados

| Simbolo | Estado | Descripción |
| :---: | :--- | :--- |
| 🔴 | **PENDIENTE** | No auditado o con fallas estructurales detectadas |
| 🟡 | **EN PROGRESO** | Auditoría agéntica en curso / correcciones pendientes |
| 🟢 | **COMPLETADO** | Validado y conforme con los estándares de gobernanza |
| ⚪ | **N/A** | No aplica (ej. Capa 3 para Cores principales) |

---

## 🏗️ Capas de Auditoría

1. **Capa 1: Base Estructural** — Templates, comandos `$boot`/`$work`/`$archi`, estructura de carpetas (`arquitectura/`, `architecture.md`, etc.).
2. **Capa 2: Congruencia Agéntica** — Verificación manual/agéntica de tono, consistencia lógica, usabilidad y sin obsolescencia.
3. **Capa 3: Congruencia de Skill** — Validación de acoplamiento y congruencia entre `*-agent-skill` y su `*-agent-rules` heredador.

---

## 📊 Matriz de Gobernanza: Cores (11 Main Cores)

| Core Repository | Capa 1 (Base/Arqui) | Capa 2 (Congruencia) | Capa 3 (Skill Sync) | Notas / Hallazgos |
| :--- | :---: | :---: | :---: | :--- |
| `agent-rules-ecosystem` (Master) | 🟢 | 🟢 | 🟢 | Estándar Maestro 100% verificado (`AGENTS.md`, `adapters/`, `core/`, `knowledge/`, `skills/`, `templates/`) |
| `backend-agent-rules` | 🔴 | 🔴 | ⚪ | Pendiente revisión Capa 1 y 2 |
| `flutter-agent-rules` | 🟢 | 🟢 | 🟢 | Auditado contra Estándar Maestro: 100% verificado (`skills/README.md` creado, `$laconico` agregado) |
| `game-agent-rules` | 🔴 | 🔴 | ⚪ | Pendiente revisión Capa 1 y 2 |
| `go-agent-rules` | 🔴 | 🔴 | ⚪ | Pendiente revisión Capa 1 y 2 |
| `kotlin-agent-rules` | 🔴 | 🔴 | ⚪ | Pendiente revisión Capa 1 y 2 |
| `python-agent-rules` | 🔴 | 🔴 | ⚪ | **Falta carpeta `arquitectura/` y adjuntos** |
| `rust-agent-rules` | 🔴 | 🔴 | ⚪ | Pendiente revisión Capa 1 y 2 |
| `second-brain-agent-rules` | 🟢 | 🟢 | 🟢 | Re-auditado contra Estándar Maestro: 100% verificado (`templates/architecture/{core,modules,routes_map.md}` y `templates/trackers/`) |
| `swift-agent-rules` | 🔴 | 🔴 | ⚪ | Pendiente revisión Capa 1 y 2 |
| `transversal-agent-rules` | 🔴 | 🔴 | ⚪ | Pendiente revisión Capa 1 y 2 |
| `web-agent-rules` | 🔴 | 🔴 | ⚪ | Pendiente revisión Capa 1 y 2 |

---

## 🧩 Matriz de Gobernanza: Skills (`*-agent-skill`)

| Skill Repository | Core Heredador | Capa 1 (Base/Arqui) | Capa 2 (Congruencia) | Capa 3 (Rules Sync) | Notas / Hallazgos |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `lore-agent-skill` | `second-brain-agent-rules` / `game-agent-rules` | 🔴 | 🔴 | 🔴 | Pendiente validación de herencia |
| `second-brain-agent-skill` | `second-brain-agent-rules` | 🔴 | 🔴 | 🔴 | Pendiente validación de herencia |
| `grapho-agent-skill` | `transversal-agent-rules` | 🔴 | 🔴 | 🔴 | Auditado previo (firmas AST ok) |

---

## 📌 Hallazgos Críticos Iniciales (Capa 1)
- [ ] `python-agent-rules`: Crear estructura `arquitectura/` y sync con `architecture.md`.
- [x] `second-brain-agent-rules`: Estructura `architecture/` y `trackers/` creadas y sincronizadas.
