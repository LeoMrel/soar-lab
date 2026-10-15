# ADR 0001 — Hipervisor / entorno de despliegue del laboratorio

- **Estado:** propuesta
- **Fecha:** 2026-10-15
- **Issue relacionado:** _(enlazar el issue de Sprint 0)_

## Contexto

El laboratorio necesita varias VMs simultáneas: controlador de dominio Windows, estación Windows, servidor Linux, sensor Suricata, manager Wazuh, atacante y, además, el motor SOAR y su base de datos. Hay que decidir dónde se despliega.

## Criterios de decisión

- Recursos disponibles (RAM, CPU, disco) en el equipo o servidor a usar.
- Reproducibilidad y definición como código (IaC).
- Aislamiento de red y facilidad de segmentar (VLANs / redes internas).
- Snapshots y restauración rápida tras cada simulación.
- Coste y duración del proyecto (5-8 meses).

## Opciones consideradas

1. **Proxmox VE** — _(rellenar)_
2. **VirtualBox** — _(rellenar)_
3. **Cloud** — _(rellenar)_

## Decisión

_(pendiente: se completa tras evaluar los recursos reales y el spike correspondiente)_

## Consecuencias

_(pendiente)_
