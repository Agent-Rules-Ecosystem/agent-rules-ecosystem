# Tareas Ecosistémicas (`tasks.md`)

## Tarea: [w11] Transición Canónica de SecondBrain a Spoke Knowledge y Protocolo de Enlace Hub-Spokes (Completada ✅)

- **Tipo**: Architecture Evolution / Monorepo Hub-Spoke / Knowledge Systems
- **Prioridad**: Alta
- **Estado**: ✅ Completada (2026-10-14)
- **Confianza**: Alta
- **Cores/Skills Afectados**: `second-brain-agent-rules`, `multicore-agent-rules`, `agent-rules-ecosystem` (Master)
- **Resultado**:
  1. `multicore-agent-rules`: Incorporados comandos `$knowledge:sync` y `$knowledge:query`, jerarquía cognitiva (`Knowledge -> Contracts -> Código`) en `brain.md`, ingesta en `$close`, consolidación dinámica de comandos en `$boot`, plantilla `knowledge_contract.md` y directiva de aislamiento Dual-Tier en staging.
  2. `second-brain-agent-rules`: Gobernanza Dual-Mode (Stand-Alone vs Spoke federado) en `brain.md` y `commands.md`, Bóveda Activa `vault/{domain,specs,algorithms,learnings}` en `path_map.md` con 4 plantillas canónicas de ingeniería en `templates/vault/`.
  3. `ARCHITECTURE_STANDARD.md`: Estándar de Interoperabilidad Nativa Zero-Panic & Caller Buffers para Providers C-ABI, Teardown Simétrico LIFO para extensiones de runtimes anfitriones y Aislamiento Dual-Tier.
  4. `RULES_STANDARD.md`: Reglas canónicas para Spokes de Conocimiento (`Knowledge`) y Desacople Semántico en localización (`i18n`).
  5. Saneamiento: `ESTRUCTURA_CLONACION.md`, `README.md` maestro y `tracker.md` actualizados con la deprecación formal de `second-brain-agent-skill`.

---

## Tarea: [w10] Estándar de Ciclo de Vida en `overview/` y Protocolo de Carga de Contexto en 3 Capas (Completada ✅)

- **Tipo**: Core Governance / Token Optimization / Architecture Standards
- **Prioridad**: Alta
- **Estado**: ✅ Completada (2026-09-26)
- **Cores Afectados**: `agent-rules-ecosystem` (Master)
- **Resultado**:
  1. `RULES_STANDARD.md`: Estandarizado ciclo de vida (`Estado: activo | draft | en_revision | superseded`) y confianza (`alta | media | baja | no_verificada`). Agregada especificación del comando estándar opcional `$audit`.
  2. `core/brain.md`: Incorporado Protocolo de Carga de Contexto en 3 Capas (Índice → Categoría → Nodo Específico) y Regla de Confianza en la Carga.
  3. `templates/work/tasks.md` y `templates/work/deuda_tecnica.md`: Actualizadas plantillas canónicas con campos de estado, confianza y reglas de transición de ciclo de vida.

---

## Tarea: [w9] Refuerzo de Verdad Estructurada y Optimización de Tokens (Completada ✅)

- **Tipo**: Core Architecture / Skill Enhancement / Data Consistency
- **Prioridad**: Alta
- **Estado**: ✅ Completada (2026-09-26)
- **Cores/Skills Afectados**: `second-brain-agent-rules`, `lore-agent-skill`, `grapho-agent-skill`
- **Resultado**:
  1. `second-brain-agent-rules`: Frontmatter canónico enriquecido en plantillas y soporte de contratos paramétricos.
  2. `lore-agent-skill`: Tipado epistemológico (`canon`, `creencia`, `propaganda`, `mito`), matriz de relaciones semánticas puras y plantilla `template_events_log.md` (`events.log.md`).
  3. `grapho-agent-skill`: Creado script `scripts/scan_knowledge.py` con motor SQLite y FTS5, comandos `$grapho:index`, `$grapho:query` y `$grapho:audit-knowledge`. Tracker actualizado a 🟢 100%.

---

## Tarea: [w8] Actualización y Alineación Completa de `README.md` Maestro (Completada ✅)

- **Tipo**: Documentation / Manifest Update
- **Prioridad**: Alta
- **Estado**: ✅ Completada (2026-09-21)
- **Cores Afectados**: `agent-rules-ecosystem` (Master)
- **Resultado**:
  1. Agregado `MultiCore/multicore-agent-rules` al Árbol Canónico y a la Matriz de Repositorios (sección 11).
  2. Agregado `Web3/solidity-agent-rules` al Árbol Canónico y a la Matriz de Repositorios (sección 12).
  3. Agregado `performance-agent-skill` al Árbol Canónico (`Transversal/`) y a la lista de Skills Transversales (sección 13).
  4. Manifiesto maestro [README.md](file:///home/xolotl/dev/03%20CORES/agent-rules-ecosystem/README.md) 100% sincronizado con el estado real del ecosistema.




