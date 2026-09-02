# Protocolo de Revisión de Trabajo (`overview/work/`)

> **Propósito único:** define los pasos que el agente ejecuta al final de `$boot`.
> El archivo `overview/work_review.md` del proyecto **no es una copia de este template**;
> es el **reporte mutable** que el agente escribe después de cada `$boot` (resultado, no protocolo).

## Pasos de Revisión (Orden Prioritario Obligatorio)

1. **Prioridad 1 — Revisar `overview/work/tasks.md`**:
   - Verificar si existe una tarea activa en progreso, su clasificación (`problema`/`mejora`/`refactor`) y las rutas elegidas.
2. **Prioridad 2 — Revisar `overview/work/pendientes.md`**:
   - Identificar ítems de seguimiento pendientes dejados por cierres anteriores (`$close`).
3. **Prioridad 3 — Revisar `overview/work/deuda_tecnica.md`**:
   - Evaluar elementos de prioridad **Alta**, **Media** o **Baja** que afecten el área a trabajar o que se hayan detectado por archivos >250L.
4. **Índice Maestro — Revisar `overview/work.md`**:
   - Confirmar estado en el backlog maestro y revisar el Historial de Intentos previo para evitar soluciones fallidas repetidas. Respetar la sección `## ✅ Completados (Historial)`.

## Reporte Sintético al Final de `$boot`

Escribir el resultado en `overview/work_review.md` del proyecto con este formato:

```
Work Review Status — [YYYY-MM-DD] [Firma Agente]
- Tarea Activa  : [ID / Descripción en tasks.md | Ninguna]
- Pendientes    : [N pendientes en pendientes.md]
- Deuda Técnica : [N alta, N media en deuda_tecnica.md]
- Backlog Master: [N tareas abiertas en work.md]
- Próximo paso  : [nodo o tarea a ejecutar]
```
