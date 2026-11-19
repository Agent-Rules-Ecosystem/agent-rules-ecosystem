# 🛡️ Filtro Agnóstico y Enrutamiento de Aprendizajes

> **Referencia canónica** para el Protocolo de Aprendizaje Continuo (`core/learning_protocol.md`) y la evaluación de propuestas durante `$boot`, `$learn`, `$learnagnostico` y `$learnskill`.

## 1. Regla del Filtro Agnóstico (Escudo Anti-Parches)

Todo aprendizaje promovido a un `*-agent-rules` debe sobrevivir sin contexto del proyecto origen:

1. **Descontextualizar negocio y proyecto**: Sustituir nombres propios de aplicaciones, módulos, pantallas, IDs o tablas concretas por conceptos genéricos (`entidad`, `capa`, `adaptador`, `persistencia`, `enrutador`).
2. **Prohibir snippets y CLI rígidos en reglas core**: Si una propuesta incluye código fuente específico o comandos particulares, abstraerla al principio arquitectónico o protocolo de diagnóstico subyacente.
3. **Conservar verificabilidad**: Una regla agnóstica sigue siendo accionable (ej. qué invariante verificar, qué umbral auditar, cuándo marcar una comprobación como omitida).

## 2. Matriz de Enrutamiento (Protocolo de 3 Vías)

| Naturaleza del Hallazgo | Destino Canónico | Comando de Captura |
|---|---|---|
| Gobernanza, flujo agéntico o patrón transversal de código | `*-agent-rules` (y `agent-rules-ecosystem` si es universal) | `$learn` / `$learnagnostico` |
| Principio propio de un stack o paradigma (`web`, `game`, `second-brain`, `multicore`) | `<dominio>-agent-rules` | `$learn` |
| Habilidad transversal (`infra`, `security`, `monitoring`, `performance`, `i18n`, `grapho`, `firebase-auth`, `telemetry`) | `Transversal/<nombre>-agent-skill` | `$learnskill <skill>` |
| Habilidad ligada a un framework o SDK específico | `<Dominio>/<dominio>-agent-skill/<nombre>` | `$learnskill <skill>` |

## 3. Evaluación en `$boot` y `$revlearnskill`

- ✅ **Aplicada**: Ya existe en el core/skill → mover a `## 📜 Histórico de mejoras aplicadas` con fecha.
- ❌ **Rechazada**: Viola el Filtro Agnóstico o es inviable → eliminar registrando motivo.
- ⚠️ **En Conflicto**: Contradice regla vigente → marcar `[conflicto learning: regla X]` en `overview/work.md`.
- ⏳ **Pendiente**: Cumple el filtro y no ha sido aplicada → conservar en `## 📌 Propuestas de mejora`.
