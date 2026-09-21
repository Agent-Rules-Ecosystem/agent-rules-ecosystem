# Tareas Ecosistémicas (`tasks.md`)

## Tarea Activa: [w6] Generalización de `multicore-agent-rules` a Modelo de Nodos y Roles Topológicos Agnósticos

- **Tipo**: Core Architecture / Topologic Refactor
- **Prioridad**: Alta
- **Cores Afectados**: MultiCore / agent-rules-ecosystem / Todos
- **Hipótesis / Objetivo**:
  1. Desacoplar `multicore-agent-rules` de la dicotomía fija "Frontend vs Backend".
  2. Implementar el Modelo de Nodos y Roles Topológicos Universales: `Provider`, `Consumer`, `Bridge/Interop` y `Contract`.
  3. Adaptar plantillas Hub & Spoke (`overview/architecture/`) para soportar cualquier topología (Game+FFI, AI+Gateway, Microservicios, IoT+CLI, Web+Mobile+API).
  4. Actualizar guías de `knowledge/`, core de gobernanza y sincronizar estado.



