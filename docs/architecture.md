# Arquitectura

> Borrador. Las decisiones concretas se registran en [`adr/`](adr/).

```
        ┌───────────────┐   ataques simulados   ┌──────────────────────────┐
        │  Atacante     │ ────────────────────▶ │  Infraestructura objetivo │
        │ (attack-sim)  │                       │  Linux · Windows · AD     │
        └───────────────┘                       └─────────────┬────────────┘
                                                              │ tráfico / eventos
                                         ┌────────────────────┴───────────────┐
                                         ▼                                    ▼
                                  ┌─────────────┐                      ┌─────────────┐
                                  │  Suricata   │                      │   Wazuh     │
                                  │   (red)     │                      │   (host)    │
                                  └──────┬──────┘                      └──────┬──────┘
                                         │ alertas (EVE JSON)                 │ alertas
                                         └────────────────┬───────────────────┘
                                                          ▼
                                            ┌──────────────────────────┐
                                            │       SOAR (propio)      │
                                            │ ingesta · normalización  │
                                            │ correlación · ATT&CK     │
                                            │ criticidad · respuesta   │
                                            └─────┬──────────────┬─────┘
                                  acciones        │              │ registro
                          (bloqueo IP, aislamiento,│              ▼
                           notificación)          │        ┌───────────┐      ┌───────────┐
                                  ◀───────────────┘        │   BBDD    │ ───▶ │ Dashboard │
                                                           └───────────┘      └───────────┘
```

## Decisiones pendientes

- Hipervisor / entorno de despliegue → ADR 0001.
- Esquema común de evento y formato de ingesta → ADR 0002 (tras el spike de formatos de alerta).
- Base de datos del SOAR y contrato con el dashboard → antes de la Fase 3.
- Mecanismo de ejecución de respuestas (cómo se bloquea una IP o se aísla un host en cada plataforma).
