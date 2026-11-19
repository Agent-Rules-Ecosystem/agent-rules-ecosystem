# 🎯 Tracker de Gobernanza y Congruencia Ecosistémica (3 Capas)

> **Propósito**: Registro agéntico y persistente del estado de cumplimiento de los 12 Cores de Dominio + Master (`agent-rules-ecosystem`) y Skills del ecosistema a través de 3 capas de validación.

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

1. **Capa 1: Base Estructural** — Templates, comandos `$boot`/`$work`/`$archi`, estructura de carpetas (`architecture/`, `architecture.md`, etc.).
2. **Capa 2: Congruencia Agéntica** — Verificación manual/agéntica de tono, consistencia lógica, usabilidad y sin obsolescencia.
3. **Capa 3: Congruencia de Skill** — Validación de acoplamiento y congruencia entre `*-agent-skill` y su `*-agent-rules` heredador.

---

## 📊 Matriz de Gobernanza: Cores (Master + 12 Cores de Dominio)

| Core Repository | Capa 1 (Base/Arqui) | Capa 2 (Congruencia) | Capa 3 (Skill Sync) | Notas / Hallazgos |
| :--- | :---: | :---: | :---: | :--- |
| `agent-rules-ecosystem` (Master) | 🟢 | 🟢 | 🟢 | Estándar Maestro saneado y alineado (`AGENTS.md`, `adapters/`, `core/`, `knowledge/`, `skills/`, `templates/`, `$audit:cores`/`$audit:skills`) |
| `backend-agent-rules` | 🟢 | 🟢 | ⚪ | Prioridad 1 propagada + auditoría 1-a-1 subagente aplicada y verificada |
| `flutter-agent-rules` | 🟢 | 🟢 | ⚪ | Prioridad 1 propagada + auditoría 1-a-1 subagente aplicada y verificada |
| `game-agent-rules` | 🟢 | 🟢 | ⚪ | Prioridad 1 & 2 propagadas + fugas Flutter/Dart purgadas + `adapters/ENGINES.md` separado |
| `go-agent-rules` | 🟢 | 🟢 | ⚪ | Prioridad 1 propagada + `adapters/` + tablas `deuda_tecnica.md` y 3 Capas verificadas |
| `kotlin-agent-rules` | 🟢 | 🟢 | ⚪ | Prioridad 1 propagada + auditoría 1-a-1 subagente aplicada y verificada |
| `multicore-agent-rules` | 🟢 | 🟢 | ⚪ | Prioridad 1 & 2 (grafo Lore↔Gameplay) + auditoría 1-a-1 subagente aplicada y verificada |
| `python-agent-rules` | 🟢 | 🟢 | ⚪ | Prioridad 1 + `templates/architecture/` + auditoría 1-a-1 subagente aplicada y verificada |
| `rust-agent-rules` | 🟢 | 🟢 | ⚪ | Prioridad 1 propagada + `adapters/` + tablas `deuda_tecnica.md` y 3 Capas verificadas |
| `second-brain-agent-rules` | 🟢 | 🟢 | ⚪ | Prioridad 1 & 2 (auditoría incremental) + auditoría 1-a-1 subagente aplicada y verificada |
| `solidity-agent-rules` | 🟢 | 🟢 | ⚪ | Prioridad 1 + `routes_map.md` + auditoría 1-a-1 subagente aplicada y verificada |
| `swift-agent-rules` | 🟢 | 🟢 | ⚪ | Prioridad 1 propagada + auditoría 1-a-1 subagente aplicada y verificada |
| `web-agent-rules` | 🟢 | 🟢 | ⚪ | Prioridad 1 & 2 (ergonomía UI + `file://` ESM) + auditoría 1-a-1 subagente aplicada y verificada |

---

## 🧩 Matriz de Gobernanza: Skills (`*-agent-skill`)

| Skill Repository | Core Heredador | Capa 1 (Base/Arqui) | Capa 2 (Congruencia) | Capa 3 (Rules Sync) | Notas / Hallazgos |
| :--- | :--- | :---: | :---: | :---: | :--- |
| `lore-agent-skill` | `second-brain-agent-rules` / `game-agent-rules` | 🟢 | 🟢 | 🟢 | Auditado y verificado: 100% congruente con `second-brain-agent-rules` y `game-agent-rules` |
| `performance-agent-skill` | `Transversal (Agnóstica)` | 🟢 | 🟢 | 🟢 | Creado y validado contra `SKILL_STANDARD.md` (100% Markdown, adaptadores por plataforma, core y knowledge) |
| ~`second-brain-agent-skill`~ (Deprecado) | `second-brain-agent-rules` | ⚪ | ⚪ | ⚪ | Deprecado [w11]: Transición canónica a Spoke Knowledge (bóveda persistente / rol topológico) |
| `grapho-agent-skill` | `Transversal (Agnóstica)` | 🟢 | 🟢 | 🟢 | Auditado y verificado: motor de grafos AST/código y grafos de conocimiento SQLite FTS5 (`scan_knowledge.py`) |

---

## 📌 Hallazgos Críticos Iniciales (Capa 1)
- [x] `python-agent-rules`: Crear estructura `architecture/` y sync con `architecture.md`.
- [x] `second-brain-agent-rules`: Estructura `architecture/` y `trackers/` creadas y sincronizadas.
