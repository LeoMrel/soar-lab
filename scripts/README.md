# scripts

## bootstrap-github.sh

Crea en el repositorio de GitHub las labels, los milestones (fases) y los issues del backlog de Sprint 0 y Sprint 1.

Requisitos: [GitHub CLI](https://cli.github.com/) autenticado (`gh auth login`) y, si se quieren añadir los issues al Project, el permiso `project`:

```bash
gh auth refresh -s project
```

Uso (desde la raíz del repo, con el repo ya creado y subido a GitHub):

```bash
./scripts/bootstrap-github.sh                      # labels + milestones + issues
PROJECT_TITLE="Purple SOAR Lab" ./scripts/bootstrap-github.sh   # además los añade al Project
```

El script no es idempotente para los issues: ejecútalo una sola vez. Los campos **Iteration**, **Estimate** y **Priority** del Project se asignan a mano en la vista de tabla (la estimación también figura en el cuerpo de cada issue).
