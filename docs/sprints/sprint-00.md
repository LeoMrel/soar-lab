# Sprint 0 — Fundamentos

- **Fechas:** 2026-10-15 → 2026-11-30
- **Fase / milestone:** Fase 0 — Fundamentos
- **Objetivo del sprint:** repositorio, tablero y documentación base listos, con alcance y threat model definidos y las primeras decisiones de arquitectura tomadas.

## Compromiso (planning)

| Issue | Descripción | SP |
|---|---|---|
| [#8](https://github.com/LeoMrel/soar-lab/issues/8) | Crear repo, README, LICENSE, .gitignore y secret scanning | 2 |
| [#9](https://github.com/LeoMrel/soar-lab/issues/9) | Definir alcance, criterios de éxito y threat model | 3 |
| [#10](https://github.com/LeoMrel/soar-lab/issues/10) | ADR 0001: hipervisor / entorno de despliegue | 3 |
| [#11](https://github.com/LeoMrel/soar-lab/issues/11) | Diagrama de red y plan de segmentación | 3 |
| [#12](https://github.com/LeoMrel/soar-lab/issues/12) | Spike: formato de alertas de Suricata (EVE JSON) y Wazuh | 5 |
| [#13](https://github.com/LeoMrel/soar-lab/issues/13) | Definir Definition of Done y fases/milestones | 2 |

**Comprometidos:** 18 SP. _(Primera estimación: sin velocidad histórica; se recalibra al cerrar el sprint.)_

## Objetivo del sprint

Dejar el proyecto completamente organizado antes de tocar ninguna
tecnología de detección o desarrollo: repositorio, estructura de
carpetas, tablero Kanban y backlog inicial con criterios de aceptación
claros. El objetivo es tener una estructura organizada con la que
empezar el proyecto y que se sostenga hasta el final del mismo.

## Qué se hizo

**Repositorio y estructura**
- Repositorio creado en GitHub (`LeoMrel/soar-lab`), público, licencia
  MIT, con `.gitignore` de Python.
- Estructura de carpetas organizada por capa de la arquitectura
  (`soar-engine/`, `detection/`, `attack-sim/`, `dashboard/`, `infra/`,
  `docs/`), en vez de por tipo de fichero, para que cada parte del
  sistema tenga un espacio claro desde el primer commit.
- Añadidos `CONTRIBUTING.md`, `SECURITY.md` y `.env.example` como
  higiene básica de repositorio (el `SECURITY.md` deja constancia de
  que el laboratorio está pensado para un entorno aislado).

**Tablero y backlog**
- GitHub Project vinculado al repositorio, con flujo de 5 columnas
  (Backlog → Ready → In progress → In review → Done) en vez de las 3
  típicas (Pendiente/En curso/Hecho). La columna "Ready" separa "aún
  sin concretar" de "ya listo para coger"; la columna "In review"
  obliga a que cada funcionalidad se valide (lanzando un ataque real
  contra el laboratorio) antes de darse por cerrada.
- Workflow de auto-add activado: cualquier issue nuevo del repo entra
  solo al tablero, sin tener que añadirlo a mano.
- Sistema de labels en tres dimensiones — `type:*` (story/task/
  spike/bug), `comp:*` (componente afectado: infra, detection,
  soar-core, dashboard, rust-parser, docs) y `priority:*` (P0/P1/P2) —
  para poder filtrar el backlog por lo que se quiera priorizar en
  cada momento, no solo por fase.
- 5 milestones creados, uno por fase del proyecto, como contenedor de
  issues y para poder medir el % de avance de cada fase directamente
  en GitHub.
- Backlog inicial de 13 issues (6 de Fase 0, 7 de Fase 1) generado
  mediante un script propio (`scripts/bootstrap-github.sh`), cada uno
  con criterios de aceptación en formato checklist y una estimación en
  story points.

## Problemas encontrados

- El script para crear los issues falló a mitad de
  ejecución con el error *"Content already exists in this project"*.
  Causa: una condición de carrera entre el workflow de auto-add del
  Project (que añade el issue al tablero automáticamente en cuanto se
  crea) y el propio script, que intentaba añadirlo también de forma
  explícita con el flag `--project`. Como el script usa
  `set -euo pipefail`, el primer error detuvo toda la ejecución,
  dejando 10 de los 13 issues creados.
  **Solución:** se crearon a mano los 3 issues restantes, sin el flag
  `--project` (innecesario una vez el auto-add ya está activo).
- El script no es idempotente (no deduplica issues), así que no se
  pudo simplemente relanzar tras el fallo — hubo que identificar
  manualmente qué issues faltaban comparando el backlog esperado con
  el creado.

## Retrospectiva

Invertir un sprint entero en tooling (labels, plantillas de issue,
script de bootstrap) es una parte tediosa (incluso solo llevando 4 días) y parece improductiva
de lo tanto que se puede alargar, pero confio en que esto permitirá que el resto del proyecto 
sea más rápido de trackear, priorizar  y documentar — Es más fácil comenzar **y** continuar todo 
el proyecto de principio a fin después de haber iterado hasta conseguir una estructura sólida y 
tener todos los componentes propiamente creados. 

_Nota personal: Podría probar el script con un proyecto de prueba antes de lanzar nuevos issues en la branch principal para detectar antes la condición del auto-add y desfasaje con la web (posiblemente deba revisar el script)_

## Pendiente para el siguiente sprint

Resolver los issues de la fase 0:
- Definir alcance, criterios de éxito y threat model.
- ADR 0001: elección de hipervisor / entorno de despliegue.
- Diagrama de red y plan de segmentación.
- Spike: formato de alertas de Suricata (EVE JSON) y Wazuh.
- Definition of Done del proyecto.

## Métricas

- Velocidad (SP completados): _N/A_
- Issues cerrados / abiertos: _En progreso (1 cerrado | 5 abiertos)_