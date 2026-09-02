# 🌌 Ecosystem Governance Core — Bootstrapper Portátil

> **Propósito**: Adaptador autónomo y portátil de revisión y gobernanza del ecosistema. Arrastra este archivo a cualquier espacio de trabajo o ejecuta `$ecosystem` para activar la auditoría global y el modo de comunicación lacónica (Modo Cavernícola).

---

## ⚡ Reglas de Respuesta — Modo Cavernícola (Token Saver)

> **AUTOCHECK OBLIGATORIO EN CADA INTERVENCIÓN:**
> 1. Sin prosa explicativa, sin saludos, sin relleno telegráfico.
> 2. No duplicar código en el chat: usar sintaxis `[archivo#L10-L20]`.
> 3. Al terminar, entregar 1 Sola Línea de resumen: `- [YYYY-MM-DD]: Corregido X -> Razón: Z.`

---

## 🚀 Comandos del Ecosistema

### 1. `$ecosystem` / `ejecuta ECOSYSTEM.md`
Dispara el bootstrap de auditoría global del ecosistema y activa el modo lacónico.

**Pasos del Agente:**
1. Cargar estado de control en `overview/` (`session.md`, `work.md`, `tasks.md`, `pendientes.md`, `deuda_tecnica.md`). Si `overview/` no existe en la raíz donde se ejecuta, crearlo desde `templates/`.
2. Barrido estructural de salud de los 11 Cores & Skills:
   - `Backend`, `Flutter`, `Game`, `Go`, `Kotlin`, `Python`, `Rust`, `SecondBrain`, `Swift`, `Transversal`, `Web`.
3. Notificar en máximo 5 líneas lacónicas:
   ```text
   [Ecosystem Governance Audit Active]
   Agente   : [firma]
   Cores    : 11 verificados | [pendientes si existen]
   Work Eco : [IDs abiertos en overview/work.md]
   Estado   : [saludable | desalineado]
   Siguiente: [nodo o auditoría activa]
   ```

### 2. `$workeco [descripción]`
Registra una tarea, bug, refactor o pendiente a nivel Ecosistema.

**Pasos del Agente:**
1. Generar ID correlativo (`w1`, `d1`, `p1`) etiquetado como `[ECO]`.
2. Registrar la descripción, hipótesis/solución y Cores afectados en `overview/work/tasks.md`.
3. Agregar entrada en el índice maestro `overview/work.md`.
4. **Regla de Invalidación/Reinicio de Tracker**: Si el cambio toca `templates/` o cualquiera de los archivos de estándar maestro (`ARCHITECTURE_STANDARD.md`, `ESTRUCTURA_CLONACION.md`, `RULES_STANDARD.md`, `SKILL_STANDARD.md`), el agente invalida automáticamente `ecosystem-runner/core/tracker.md`, marcando los Cores afectados como `🔴 PENDIENTE` para forzar re-auditoría contra las plantillas/estándares actualizados.
5. Sincronizar simultáneamente `overview/` (`session.md`, `work.md`, `tasks.md`, `pendientes.md`, `deuda_tecnica.md`).
6. Confirmar en 1 línea lacónica: `[ECO] Tarea registrada como [ID] en overview/work.md` (e indicar reinicio de tracker si aplica).


---

## 🗺️ Mapa de Archivos Canónicos
- **Brain**: `core/brain.md`
- **Comandos**: `core/commands.md`
- **Comunicación**: `core/communication.md`
- **Rutas**: `core/path_map.md`
- **Directorio de Trabajo**: `overview/`
