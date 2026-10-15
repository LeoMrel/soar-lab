# purple-soar-lab

Laboratorio Purple Team con un motor SOAR de desarrollo propio. Proyecto intermodular de 2º ASIR.

> **Estado:** Sprint 0 (fundamentos). Tablero en la pestaña **Projects** del repositorio; planificación en [`docs/sprints/`](docs/sprints/).

## Objetivo

Construir un laboratorio donde se simulan ataques con herramientas legítimas, se detectan con herramientas existentes y un **motor SOAR propio** ingiere las alertas, las correlaciona, las mapea a MITRE ATT&CK, decide su criticidad y ejecuta una respuesta automática, dejando todo registrado y visualizado.

## Arquitectura (3 capas)

| Capa | Contenido | Desarrollo |
|---|---|---|
| Infraestructura objetivo | VMs que simulan una red corporativa (Linux, Windows, Active Directory) | Configuración (IaC) |
| Detección | Suricata (red) + Wazuh (host) | Reglas/decoders propios, herramientas existentes |
| SOAR | Ingesta, correlación, mapeo ATT&CK, criticidad, respuesta automática (bloqueo de IP, aislamiento de host, notificación), BBDD y dashboard web separado del motor | **100 % propio** (Python; parser de logs en Rust como extra en Fase 4) |

Simulación de ataques solo con herramientas legítimas: Metasploit, Hydra, Atomic Red Team, MITRE Caldera. No se desarrolla malware propio.

## Estructura del repositorio

```
infra/          Infraestructura como código y diagramas de red
detection/      Reglas de Suricata y reglas/decoders de Wazuh
soar-engine/    Motor SOAR (Python)
dashboard/      Dashboard web (separado del motor)
attack-sim/     Playbooks de simulación de ataques (Atomic Red Team, Caldera, ...)
docs/           ADRs, threat model, sprints, definición de Done
scripts/        Utilidades (bootstrap de labels, milestones e issues)
```

## Fases

- **Fase 0:** fundamentos (repo, alcance, threat model, decisiones iniciales)
- **Fase 1:** infraestructura y detección
- **Fase 2:** núcleo SOAR (ingesta, normalización, correlación, mapeo ATT&CK)
- **Fase 3:** respuesta automática y dashboard
- **Fase 4:** parser de logs en Rust, benchmark y cierre

## Metodología

Agile con sprints de 2 semanas. Cada sprint tiene su fichero en [`docs/sprints/`](docs/sprints/) con objetivo, compromiso, review y retrospectiva. Las decisiones de arquitectura se registran como [ADRs](docs/adr/). Criterios de cierre en [`docs/definition-of-done.md`](docs/definition-of-done.md).

## Uso responsable

Este repositorio es **exclusivamente para un entorno de laboratorio aislado**. Ver [`SECURITY.md`](SECURITY.md).

## Licencia

MIT. Ver [`LICENSE`](LICENSE).
