# Flujo de trabajo

Aunque el proyecto lo desarrolla una sola persona, se trabaja como en un equipo para dejar historial revisable.

## Ramas

- `main` está protegida: cambios solo mediante pull request.
- Ramas cortas con el número de issue: `feat/12-suricata-ingest`, `fix/31-parser-timezone`, `docs/7-adr-hipervisor`, `infra/18-ad-lab`.

## Commits

[Conventional Commits](https://www.conventionalcommits.org/): `tipo(ámbito): descripción`.

```
feat(soar-engine): parsear alertas EVE JSON de Suricata
fix(detection): corregir regla de Wazuh para fuerza bruta SSH
docs(adr): registrar decisión de hipervisor
chore(ci): añadir ruff al workflow
```

Tipos habituales: `feat`, `fix`, `docs`, `test`, `refactor`, `chore`, `ci`, `infra`.

## Pull requests

- Un PR por issue, enlazado con `Closes #N`.
- Debe cumplir la [Definition of Done](docs/definition-of-done.md).
- CI en verde antes de mergear. Merge con *squash* para mantener un historial limpio.

## Sprints

Cada sprint dura 2 semanas. Al cerrar: se completa `docs/sprints/sprint-NN.md` (review y retrospectiva) y se crea el del siguiente.
