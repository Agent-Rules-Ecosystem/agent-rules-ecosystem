# Catálogo Oficial de Skills del Ecosistema (`*-agent-skill`)

Este directorio referencia las habilidades técnicas inyectables (`*-agent-skill`) transversales del ecosistema [`Agent-Rules-Ecosystem`](https://github.com/Agent-Rules-Ecosystem).

> Para el catálogo completo de las 39 skills (transversales y por lenguaje/plataforma), consultar [`README.md`](../README.md) y [`SKILL_STANDARD.md`](../SKILL_STANDARD.md).

## Skills Transversales Oficiales

| Skill | Comando | Repositorio | Descripción / Dominio |
|---|---|---|---|
| `firebase-auth-agent-skill` | `$firebaseauth` | `Agent-Rules-Ecosystem/firebase-auth-agent-skill` | Auth OAuth multi-proveedor, Custom Claims (RBAC) y Security Rules |
| `grapho-agent-skill` | `$grapho` | `Agent-Rules-Ecosystem/grapho-agent-skill` | Motor AST de grafos de código, Clean Arch y conocimiento FTS5 |
| `grapho-3d-visualizer-agent-skill` | `$grapho3d` | `Agent-Rules-Ecosystem/grapho-3d-visualizer-agent-skill` | Visualizador 3D/2.5D interactivo de arquitectura y grafos |
| `i18n-agent-skill` | `$i18n` | `Agent-Rules-Ecosystem/i18n-agent-skill` | Internacionalización, localización multi-idioma y fallbacks |
| `infra-agent-skill` | `$infra` | `Agent-Rules-Ecosystem/infra-agent-skill` | Docker, Kubernetes, CI/CD GitHub Actions y despliegue |
| `monitoring-agent-skill` | `$monitoring` | `Agent-Rules-Ecosystem/monitoring-agent-skill` | Logging estructurado, telemetría OpenTelemetry y APM |
| `performance-agent-skill` | `$perf` | `Agent-Rules-Ecosystem/performance-agent-skill` | Profiling y optimización de CPU, GPU, memoria y bundles |
| `security-agent-skill` | `$security` | `Agent-Rules-Ecosystem/security-agent-skill` | Auditoría OWASP, secretos y reglas de acceso |
| `telemetry-agent-skill` | `$telemetry` | `Agent-Rules-Ecosystem/telemetry-agent-skill` | Analytics de producto, Crashlytics y sanitización PII |

## Instalación en Proyectos Cliente

```bash
git submodule add git@github.com:Agent-Rules-Ecosystem/<nombre>-agent-skill.git .skill/<nombre>-agent-skill
```
