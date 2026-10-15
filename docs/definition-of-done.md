# Definition of Done

Un issue se considera terminado cuando se cumple todo lo siguiente:

## Siempre

- [ ] Los criterios de aceptación del issue se cumplen y están comprobados.
- [ ] El cambio llegó a `main` mediante pull request enlazado (`Closes #N`).
- [ ] No hay secretos, credenciales, IPs reales ni capturas de tráfico reales en el diff.
- [ ] La documentación afectada está actualizada (README del componente, `docs/`).
- [ ] Si hay una decisión de arquitectura, existe su ADR.

## Código (`soar-engine`, `dashboard`)

- [ ] `ruff check` y `ruff format --check` sin errores.
- [ ] Tests nuevos para el comportamiento añadido; `pytest` en verde en CI.
- [ ] Las acciones de respuesta automática están limitadas a activos del laboratorio.

## Infraestructura y detección

- [ ] El cambio es reproducible desde cero (código/configuración en el repo, no solo en la VM).
- [ ] Probado en el laboratorio y, si se modifica una regla, validado con un escenario de `attack-sim/`.
- [ ] Diagrama de red actualizado si cambia la topología.

## Sprint

- [ ] Review y retrospectiva escritas en `docs/sprints/sprint-NN.md` al cerrar el sprint.
