# Mapa canónico de rutas

## Reglas globales: submódulo `.agents/`

| Recurso | Ruta | Carga |
|---|---|---|
| Comunicación | `.agents/core/communication.md` | Obligatoria — **leer primero** |
| Router | `.agents/AGENTS.md` | Obligatoria |
| Brain | `.agents/core/brain.md` | Obligatoria |
| Comandos | `.agents/core/commands.md` | Obligatoria |
| Protocolo de Aprendizaje | `.agents/core/learning_protocol.md` | Obligatoria |
| Adaptadores (Codex / Cursor / etc) | `.agents/adapters/` (`AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `cursor-rule.mdc`, `README.md`) | Al instalar |
| Guías del Framework | `.agents/knowledge/` | Discovery / Bajo demanda |
| Plantillas `overview/` | `.agents/templates/` | `$boot` / Inicio |
| Catálogo de Skills | `.agents/skills/README.md` | Bajo demanda |
| Skills del Ecosistema | `.agents/skills/<skill_name>/` | Bajo demanda |

> **Gobernanza de Skills por Proyecto**: Skills específicas de un proyecto deben gestionarse como submódulo independiente en `.skill/<skill_name>/` (raíz del repo huésped, **fuera** de `.agents/`).

## Estado local: raíz del proyecto

| Recurso | Ruta | Carga |
|---|---|---|
| Sesión | `overview/session.md` | Inicio/cierre |
| Trabajo (Índice Maestro) | `overview/work.md` | Inicio/cierre |
| Tarea Activa | `overview/work/tasks.md` | Inicio/en ejecución |
| Pendientes | `overview/work/pendientes.md` | Cierre/bajo demanda |
| Deuda Técnica | `overview/work/deuda_tecnica.md` | Inicio/bajo demanda |
| Protocolo Revisión Work | `overview/work_review.md` | Fin de `$boot` |
| Aprendizajes | `overview/learning.md` | Al cerrar |
| Arquitectura real (Hub) | `overview/architecture.md` | Inicio / `$archi` / `$close` |
| Arquitectura modular (Spoke) | `overview/architecture/` | Inicio / `$archi` / `$close` |
| Tracker Progreso | `overview/trackers/progress.md` | Inicio/cierre |
| Historial | `overview/history/` | Al resumir |
| Contexto de dominio | `overview/context/` | Inicio/bajo demanda |
| Flujos de dominio | `overview/workflows/` | Bajo demanda |
