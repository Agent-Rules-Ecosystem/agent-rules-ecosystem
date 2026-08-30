# 🏛️ Agent Architecture Standard — Especificación Oficial

> **Referencia canónica para la estructura, modularización y enrutamiento de la documentación de arquitectura** dentro del ecosistema `Agent-Rules-Ecosystem`.  
> Todo proyecto gobernado por el ecosistema debe cumplir con este estándar para evitar el colapso de contexto y garantizar una navegación quirúrgica para los Agentes de IA.

*Versión*: 1.2 · **Fecha**: 2026-08-30 · **Repositorio**: `agent-rules-ecosystem`

---

## 📌 Visión General y Filosofía

A medida que un proyecto crece en pantallas, módulos y reglas de negocio, concentrar toda la arquitectura en un único archivo `ARCHITECTURE.md` o `architecture.md` genera un *Monolito de Documentación*. 

### ⚠️ El Problema del Monolito de Documentación
* **Degradación de Ventana de Contexto**: Un archivo de 1,500+ líneas consume decenas de miles de tokens por consulta.
* **Deriva y Alucinaciones**: El agente de IA pierde foco intentando procesar diagramas de módulos irrelevantes para su tarea actual.
* **Colisiones de Edición**: Múltiples agentes o desarrolladores editando el mismo archivo gigante simultáneamente.

### 📐 La Solución: Patrón Hub & Spoke en `overview/architecture/`
El conocimiento arquitectónico reside en la carpeta canónica del ecosistema `overview/architecture/` como una *red modular navegable por hipervínculos*.

> **Nomenclatura canónica**: El índice raíz es **`overview/architecture.md`** (minúsculas, dentro de `overview/`). Este es el mismo archivo que los proyectos existentes ya tienen como `overview/architecture.md` — no se renombra ni se mueve.

```mermaid
graph TD
    ROOT["overview/architecture.md\n(Índice Raíz Ligero < 200L)"]
    
    ROOT --> ROUTING["overview/architecture/routes_map.md\n(Mapa Global de Rutas)"]
    ROOT --> CORE_DATA["overview/architecture/core/data_flow.md\n(Local-First & State)"]
    ROOT --> CORE_RULES["overview/architecture/core/import_rules.md\n(Reglas de Importación)"]
    
    ROOT --> MOD1["overview/architecture/modules/ordenes.md\n(Módulo Órdenes & Bitácoras)"]
    ROOT --> MOD2["overview/architecture/modules/materia_prima.md\n(Módulo MP & Proveedores)"]
    ROOT --> MOD3["overview/architecture/modules/cotizaciones.md\n(Módulo Cotizaciones & Monetización)"]
```

---

## 📂 Estructura de Directorios Obligatoria en Proyectos

Todo proyecto cliente bajo la gobernanza del ecosistema debe organizar su documentación de arquitectura respetando esta jerarquía:

```text
<raíz-del-proyecto>/
└── overview/
    ├── architecture.md                 ← [OBLIGATORIO] Índice Raíz Hub & Spoke (< 200L)
    └── architecture/                   ← [OBLIGATORIO] Subdocumentos de Arquitectura
        ├── routes_map.md               ← [OBLIGATORIO] Mapeo de rutas de navegación
        ├── core/                       ← Patrones transversales del sistema
        │   ├── data_flow.md            ← Estado global, Sync, Persistencia/Local-First
        │   └── import_rules.md         ← Convenciones de capas e importaciones relativas
        └── modules/                    ← Subdocumentos por dominio funcional
            ├── <modulo_1>.md           ← Especificación técnica del Módulo 1
            ├── <modulo_2>.md           ← Especificación técnica del Módulo 2
            └── <modulo_n>.md           ← Especificación técnica del Módulo N
```

> **Nota de Agnosticismo**: La estructura de capas y librerías se adapta al stack técnico del proyecto (Flutter, React, Python, Swift, Kotlin, Godot, etc.), manteniendo intacto el patrón de directorios `overview/architecture/`.

---

## ⚡ Protocolo de Operación para Agentes de IA ($archi)

Cuando un agente de IA ejecuta la auditoría `$archi` o busca contexto de arquitectura para realizar un trabajo:

1. **Lectura del Índice Raíz**: El agente abre *únicamente* `overview/architecture.md` para entender las capas generales del proyecto y ubicar los submódulos.
2. **Navegación Quirúrgica**: El agente identifica el subdocumento correspondiente a la tarea actual (ejemplo: `overview/architecture/modules/cotizaciones.md`).
3. **Carga Focalizada**: Abre únicamente ese subdocumento. 
4. **Resultado**: Reducción del 90% en consumo de tokens y cero interferencia de módulos ajenos a la tarea.

---

## 🔄 Protocolo de Migración desde Archivo Plano Legado

Proyectos con `overview/architecture.md` como archivo único (no carpeta) **no necesitan borrarlo**. La migración es incremental y no destructiva:

1. **Detección**: El agente verifica si `overview/architecture.md` existe como archivo plano (sin carpeta `overview/architecture/`).
2. **Lectura como Fuente**: Lee el archivo plano íntegramente para extraer todo el contenido ya documentado.
3. **Transformación del Índice**: Reemplaza el contenido de `overview/architecture.md` por el formato Hub & Spoke (< 200L): solo capas de alto nivel, diagrama Mermaid sintético e hipervínculos a subdocumentos.
4. **Población de Subdocumentos**: Crea `overview/architecture/` y distribuye el contenido del archivo plano en los subdocumentos correspondientes, sin inventar información nueva.
5. **Verificación**: Confirma que todos los diagramas y reglas del archivo plano original están reflejados en los subdocumentos antes de limpiar la versión plana.

> ⚠️ **Regla de Seguridad**: El agente **nunca elimina** `overview/architecture.md` automáticamente. Solo lo transforma in-place al formato índice Hub & Spoke.

---

## 📝 Plantilla Canónica 1: `overview/architecture.md` (Índice Raíz)

El índice raíz vive en `overview/architecture.md` y *no debe superar las 200 líneas*:

```markdown
# 🏛️ Arquitectura Global del Proyecto — [Nombre del Proyecto]

> Última actualización: YYYY-MM-DD (Auditoría `$archi`: Cobertura 100% modularizada en `overview/architecture/`)

## 1. Visión General y Capas del Sistema

| Capa | Ubicación | Descripción Breve |
|---|---|---|
| **Presentation** | `lib/presentation/` | Pantallas, widgets modulares y notificadores de estado |
| **Domain** | `lib/domain/` | Entidades puras y casos de uso de negocio |
| **Infrastructure** | `lib/infrastructure/` | Repositorios, adaptadores de DB local y servicios de red |
| **Core** | `lib/core/` | Router, temas visuales y utilidades compartidas |

## 2. Diagrama de Estado y Persistencia Global
[Diagrama Mermaid sintético de alto nivel del flujo de datos]

## 3. Índice de Módulos (Subdocumentos de Dominio)
* 📦 **[Módulo Órdenes y Producción](./architecture/modules/ordenes.md):** Órdenes, bitácoras y PDFs.
* 🧪 **[Módulo Materia Prima](./architecture/modules/materia_prima.md):** Catálogo MP, inventario y proveedores.
* 💎 **[Módulo Cotizaciones](./architecture/modules/cotizaciones.md):** Calculadora, ajustes y catálogo comercial.

## 4. Guías Transversales
* 🧭 **[Mapa Global de Rutas](./architecture/routes_map.md)** — Registro completo de enrutamiento.
* 🔄 **[Flujo de Datos Local-First](./architecture/core/data_flow.md)** — Sincronización y persistencia local.
* 📏 **[Reglas de Importación por Nivel](./architecture/core/import_rules.md)** — Niveles de profundidad e importaciones.
```

---

## 📝 Plantilla Canónica 2: Subdocumento de Módulo (modules/<modulo>.md)

Cada subdocumento de módulo en `overview/architecture/modules/` debe centrarse exclusivamente en su área funcional:

```markdown
# 📦 Módulo: [Nombre del Módulo]

> Pertenece a: `overview/architecture/modules/[nombre].md`  
> Referenciado desde: [`overview/architecture.md`](../../../architecture.md)

## 1. Mapa de Enrutamiento Lógico y Flujo Operativo
[Diagrama Mermaid específico del módulo]

## 2. Reglas de Negocio del Módulo
* **Regla 1:** Explicación técnica de la regla.
* **Regla 2:** Explicación técnica de la regla.

## 3. Componentes y Servicios Clave
* **Pantallas / Vistas:** `lib/presentation/screens/[modulo]/`
* **Widgets / UI Modules:** `lib/presentation/screens/[modulo]/widgets/`
* **Servicios / Notifiers:** `lib/presentation/providers/`

## 4. Estado Actual de Refactorización
* [x] Componentes modulares (< 250L por archivo)
* [x] Pruebas y análisis de estática limpios (`0 issues`)
```

---

## 📝 Plantilla Canónica 3: Índice de Módulo Subdividido (modules/\<modulo\>/\<modulo\>.md)

Cuando un módulo se convierte en carpeta por aplicación de la Regla Atómica de Escala, su archivo índice (`modules/<modulo>/<modulo>.md`) debe seguir este formato. **Su único rol es listar los subdocumentos con una línea de descripción** — no duplica ni resume su contenido:

```markdown
# 📦 Módulo: [Nombre del Módulo] — Índice

> Pertenece a: `overview/architecture/modules/[nombre]/[nombre].md`
> Referenciado desde: [`overview/architecture.md`](../../../architecture.md)
> Subdividido por Regla Atómica de Escala: YYYY-MM-DD

## Subdocumentos de este módulo

| Archivo | Dominio que cubre |
|---|---|
| [`flujos.md`](./flujos.md) | Flujos operativos y secuencias de interacción |
| [`modelos.md`](./modelos.md) | Entidades, contratos de datos y validaciones |
| [`reglas_negocio.md`](./reglas_negocio.md) | Reglas de cálculo, restricciones y casos borde |

## Diagrama de alto nivel

[Diagrama Mermaid sintético del módulo — solo capas, no detalles internos]
```

> ⚠️ **Regla**: Este índice **no explica** el contenido de los subdocumentos. Cada subdocumento es autónomo y completo para su dominio. El índice solo navega.


---

## 📐 Regla Atómica de Escala

Cuando un subdocumento de módulo (`overview/architecture/modules/<modulo>.md`) crece demasiado para ser útil en una sola tarea del agente, se aplica el mismo principio recursivamente:

**El módulo se convierte en carpeta** con subdocumentos propios:

```text
overview/
└── architecture/
    └── modules/
        └── ordenes/                    ← antes era ordenes.md
            ├── ordenes.md              ← nuevo índice del módulo (< 150L)
            ├── flujos.md               ← flujos operativos del módulo
            ├── modelos.md              ← entidades y contratos de datos
            └── reglas_negocio.md       ← reglas de validación y cálculo
```

### Regla de Oro: Autocontención

> **Cada archivo describe una sola cosa, completamente.**  
> Ningún archivo apunta a otro del mismo nivel como su fuente de verdad.

| ❌ Prohibido | ✅ Correcto |
|---|---|
| `flujos.md` dice "ver `modelos.md` para las entidades" | `flujos.md` incluye la definición mínima necesaria de las entidades que usa |
| `modelos.md` referencia `reglas_negocio.md` | `modelos.md` es completo y autónomo para su dominio |
| El índice del módulo lista contenido de otros archivos | El índice solo lista los subdocumentos con una línea de descripción |

### Señal de cuándo subdividir

Subdivide un archivo cuando el agente necesita cargar *todo* el archivo para responder algo *específico*. No hay umbral de líneas fijo: el criterio es si el contenido del archivo cubre más de un dominio de decisión.

### Profundidad máxima

La subdivisión se aplica un nivel a la vez. No anticipar jerarquías futuras: solo subdividir cuando la señal se manifiesta. La profundidad no es el problema — la mezcla de dominios en un mismo archivo sí lo es.

---

## 🔒 Reglas de Inviolabilidad

1. **Prohibidos Monolitos**: `overview/architecture.md` no debe crecer indefinidamente. Máximo 200 líneas como índice raíz.
2. **Creación Obligatoria de Subdocumento**: Todo módulo nuevo que supere los 2 diagramas Mermaid o 5 componentes/pantallas *debe crearse como un subdocumento independiente* en `overview/architecture/modules/` y enlazarse desde el índice.
3. **Migración No Destructiva**: Al transformar un archivo plano legado, el agente nunca elimina `overview/architecture.md` — lo transforma in-place en el índice Hub & Spoke.
4. **Rutas Relativas**: Los hipervínculos dentro de `overview/architecture.md` hacia subdocumentos usan rutas relativas (`./architecture/routes_map.md`, no rutas absolutas).
5. **Autocontención Atómica**: Cada archivo es una verdad completa para su dominio. Ningún archivo del mismo nivel puede ser fuente de verdad de otro. Las referencias entre archivos son de navegación (hipervínculos), nunca de dependencia semántica.
