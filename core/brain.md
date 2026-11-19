# Core Brain

## Ciclo

```mermaid
graph TD
    A[Trigger arranque] --> B{Existe overview/}
    B -- No --> C[Crear desde .agents/templates/]
    B -- Sí --> D[Cargar estado]
    C --> E[Discovery de proyecto]
    D --> E
    E --> F[Trabajar]
    F --> M{Autocheck Modo Lacónico}
    M -- Falla --> R[Reescribir respuesta]
    R --> G[Validar]
    M -- OK --> G
    G --> H[Actualizar trackers y sesión]
    H --> F
```

## Triggers de arranque

Las siguientes señales disparan el protocolo completo de bootstrap (discovery + crear `overview/` si falta + mapear archivos existentes):

- Frase **"ejecuta .agents"** → dispara el Protocolo de Auditoría de Learning (ver abajo).
- Inicio de sesión en cualquier proyecto con `.agents/` presente.
- Mensaje del usuario que mencione "nuevo proyecto", "inicializar", "bootstrap" o similar.
- Ausencia de `overview/session.md` al comenzar cualquier tarea de código.
- Primer mensaje de una conversación cuando el proyecto tiene `.agents/` pero no tiene `overview/`.
- **Mensaje que comienza con `$`** → reconocer como $-comando y ejecutar protocolo definido en `core/commands.md` sin bootstrap completo previo.

## Protocolo "ejecuta .agents"

Cuando el usuario escribe **"ejecuta .agents"** (o variante como "corre .agents", "bootstrap .agents"):

1. **Leer el core completo**: `path_map.md`, `communication.md`, `brain.md`, `commands.md` y `AGENTS.md`.
2. **Auditar y comparar `overview/learning.md` contra `.agents/core/` (Evaluación de 3 Vías)**:
   Por cada bullet en `## 📌 Propuestas de mejora`, evaluar si la propuesta fue:
   - ✅ **Aplicada**: Ya está implementada o integrada en la gobernanza/core actual → promover al final de `## 📜 Histórico de mejoras aplicadas` con formato `- [YYYY-MM-DD] Descripción breve` y eliminar el bullet activo.
   - ❌ **Rechazada**: Viola el **Filtro Agnóstico (Escudo Anti-parches)** (contiene código fuente específico, propiedades UI o comandos CLI rígidos) o es inviable → eliminar o registrar motivo de rechazo.
   - ⚠️ **En Conflicto**: Entra en conflicto directo con una regla existente en `.agents/core/` → marcar con el flag `[conflicto learning: regla X]` en `work.md` para aclaración del usuario.
   - ⏳ **Pendiente**: Cumple el filtro agnóstico y no está aplicada ni en conflicto → conservar en `## 📌 Propuestas de mejora`.
3. **Continuar con el flujo normal del core**: Inicio → Discovery → verificar `overview/` → trabajar.

## Inicio

- Verificar `.git/` (si falta en un proyecto nuevo/ZIP, ejecutar `git init` antes de agregar submódulos) y ejecutar `git submodule status`.
- Leer core y aplicar el **Protocolo de Carga de Contexto en 3 Capas**: cargar inicialmente **Capa 1** (`overview/session.md`, `overview/work.md`), y luego **Capa 2/3** (`tasks.md`, `pendientes.md`, `deuda_tecnica.md`, `trackers/progress.md`, `overview/work/skill/`) solo según la tarea activa y el paso `work_review.md`.
- Si falta `overview/` o archivos base, crearlos desde `.agents/templates/`.
- Si falta `overview/architecture.md`, crearlo desde plantilla antes de trabajar.
- **Orden de prioridad de atención en `$work`**: 
  1. `overview/work/tasks.md` (tarea activa en ejecución)
  2. `overview/work/pendientes.md` (ítems de seguimiento identificados)
  3. `overview/work/deuda_tecnica.md` (deuda ordenada por prioridad **Alta**, **Media** y **Baja**)
- **Histórico de completados (traslado físico inmediato)**: Al resolver cualquier ítem (tarea, bug o deuda) proveniente de `work/tasks.md`, `work/pendientes.md` o `work/deuda_tecnica.md`, retirar inmediatamente la fila de la tabla activa y moverla físicamente a `## ✅ Completados (Historial)` en `work.md`, `deuda_tecnica.md` y `pendientes.md` conservando su ID (`[w1]`, `[d2]`, `[p1]`).
- **Registro preventivo previo a ejecución (Pre-execution Work Logging)**: Al recibir un requerimiento o bug, actualizar de forma automática y simultánea los archivos de control de `overview/` (`work.md`, `work/tasks.md`, `session.md`, `pendientes.md`, `deuda_tecnica.md`, `work_review.md` y `architecture.md`) INMEDIATAMENTE antes de ejecutar cualquier acción.
- **Triaje e Integración Activa de Skills (`overview/work/skill/`)**: Durante `$boot`, `$work` y `$close`, escanear `overview/work/skill/*.md` e integrar sus hallazgos en `deuda_tecnica.md` (refactores/arquitectura), `pendientes.md` (secundarios) o `tasks.md` (bugs/urgentes), conservando el archivo de la skill como evidencia de detalle.
- **Historial de Intentos firmado por Agente**: En `overview/work.md`, mantener registro incremental sin borrar intentos previos: mismo día → actualizar fila existente; diferente día → nueva fila con firma del Agente; al resolver → registrar causa raíz y solución aplicada.
- **Protocolo de Revisión de Trabajo (`work_review.md`)**: Al finalizar `$boot`, ejecutar obligatoriamente el protocolo definido en `templates/work_review.md`.

## Protocolo de Carga de Contexto en 3 Capas

> **Regla de Ahorro de Tokens**: El agente **nunca** carga el directorio `overview/` completo de una vez. Sigue este orden estricto para minimizar consumo:

1. **Capa 1 — Índice**: Cargar solo `overview/session.md` + `overview/work.md` (índice maestro de IDs y estados). Suficiente para responder "¿en qué estamos?".
2. **Capa 2 — Categoría**: Si la tarea activa lo requiere, cargar el archivo de categoría correspondiente: `overview/work/tasks.md` (tarea activa) **o** `overview/work/deuda_tecnica.md` **o** `overview/work/pendientes.md`. No los tres a la vez.
3. **Capa 3 — Nodo Específico**: Solo si el trabajo lo exige, cargar archivos de arquitectura (`overview/architecture/`) o skill reports (`overview/work/skill/`). Cargar únicamente el subdocumento del módulo o skill relevante, no toda la carpeta.

> **Regla de Confianza en la Carga**: Si un archivo de `overview/` tiene campo `Confianza: baja` o `no_verificada`, el agente debe notificarlo antes de actuar sobre esa información y priorizar verificación.
>
> **Principio *Overview-First* y Consulta $O(1)$**: Leer primero los índices/trackers en `overview/` antes de abrir archivos hermanos de código o documentación. Ante preguntas de avance o estado de archivos/ítems, consultar exclusivamente `overview/trackers/progress.md` (o tracker equivalente) en $O(1)$, prohibiendo escaneos especulativos de carpetas.

## Discovery Progresivo y Jurisdicción de `overview/`

- **Guardrail de tokens en discovery inicial**: Leer máximo **5 archivos** de código fuente en el primer barrido; expandir solo cuando la tarea lo requiera explícitamente.
- **Localidad Horizontal**: `overview/` tiene jurisdicción exclusiva sobre sus directorios hermanos (mismo directorio padre); el agente nunca aplica reglas de un `overview/` local a carpetas por encima de su nivel.
- **Normalización y no ignorar**: Todas las rutas de `overview/` van en minúsculas (`overview/`, `trackers/`, `history/`, `context/`, `workflows/`, `work/`). Nunca ignorar notas o documentación suelta en carpetas no estándar: relocalizar a `overview/context/` o referenciar en `overview/work.md` con `[pendiente clasificar]`.

## Selección Contextual de Reglas y Reporte de Omisiones

- Al iniciar o auditar una tarea, identificar explícitamente qué reglas y checklists aplican según el tipo de cambio (ciclo de vida, UI/i18n, arquitectura, empaquetado, seguridad).
- Toda comprobación que no pueda ejecutarse en el entorno actual debe reportarse explícitamente como **omitida** indicando el motivo; nunca contarla como aprobada.

## Handoff de Agente

Cuando el Agente que retoma una sesión es distinto al que la inició (diferente modelo o proveedor):

1. **Identificar cambio**: comparar `Agente:` en `overview/session.md` con el modelo actual. Si difieren → activar protocolo de handoff.
2. **Validar estado previo**: leer `## Reanudar` de `session.md` y verificar que el `Contexto crítico` es coherente.
3. **Registrar handoff**: actualizar `session.md` indicando la firma propia del agente que reanuda.

## Cierre

- Ejecutar suite de linters/tests según el lenguaje o framework del proyecto.
- **Sincronización Automática de Rastreadores**: Es regla obligatoria en el cierre (`$close`) la actualización simultánea de todos los archivos en `overview/`.
- Trasladar ítems resueltos a `## ✅ Completados (Historial)`.
