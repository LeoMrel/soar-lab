# Threat model del laboratorio

> Borrador inicial (Sprint 0). Se completa en el issue "Definir alcance, criterios de éxito y threat model".

## Alcance

El laboratorio simula una red corporativa pequeña para validar la cadena **ataque → detección → decisión → respuesta**. Quedan fuera: cualquier sistema que no sea del laboratorio, y el desarrollo de malware propio.

## Activos

| Activo | Rol | Criticidad (a definir) |
|---|---|---|
| Controlador de dominio (AD) | Identidad | |
| Estación de trabajo Windows | Endpoint | |
| Servidor Linux | Servicios | |
| Manager Wazuh | Detección host | |
| Sensor Suricata | Detección red | |
| Motor SOAR + BBDD | Respuesta y registro | |

## Actores de amenaza simulados

- Atacante externo con acceso inicial por fuerza bruta o explotación de servicio expuesto.
- Atacante interno / post-compromiso: movimiento lateral, persistencia, escalada de privilegios (técnicas simuladas con Atomic Red Team y Caldera).

## Segmentación y aislamiento

A completar con el diagrama de red. Requisitos mínimos:

- Segmento de ataque separado del segmento objetivo y de la red doméstica/centro.
- Sin ruta desde el laboratorio hacia redes ajenas; la salida a Internet se limita a lo imprescindible (actualizaciones) y es controlable.
- El SOAR solo puede ejecutar acciones de respuesta sobre activos del laboratorio.

## Riesgos del propio laboratorio

| Riesgo | Mitigación prevista |
|---|---|
| Fuga de tráfico de ataque fuera del laboratorio | Aislamiento de red y reglas de salida restrictivas |
| La respuesta automática afecta a un activo no previsto | Lista de activos permitidos en configuración y modo *dry-run* |
| Credenciales o datos sensibles en el repositorio | `.gitignore`, secret scanning, push protection |
| Pérdida del estado del laboratorio | Snapshots y definición como código |

## Criterios de éxito (a concretar)

- Cada técnica ATT&CK simulada genera al menos una alerta correlacionable.
- Medir tiempo de detección y de respuesta del SOAR por escenario.
