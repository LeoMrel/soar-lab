# infra

Infraestructura objetivo del laboratorio: VMs que simulan una red corporativa.

## Contenido previsto

- Diagrama de red y plan de segmentación (`network-diagram.*`).
- Definición como código de las VMs y la red (Terraform, Ansible, Vagrant o equivalente, según el ADR de hipervisor).
- Procedimiento para reconstruir el laboratorio desde cero.

## Activos previstos

| Rol | SO | Notas |
|---|---|---|
| Controlador de dominio | Windows Server | Active Directory |
| Estación de trabajo | Windows | Unida al dominio |
| Servidor | Linux | Servicios expuestos al ataque |
| Sensor de red | Linux | Suricata |
| Manager de detección | Linux | Wazuh |
| Atacante | Linux | Solo en segmento aislado |

## Reglas

- Ningún secreto en el repositorio: usar `.env` (ignorado) y un `.env.example` documentado.
- Todo cambio de red o de recursos relevante queda reflejado en el diagrama.
