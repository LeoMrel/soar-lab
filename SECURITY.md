# Política de seguridad y uso responsable

## Alcance de uso

Este proyecto es un **laboratorio educativo**. Todo lo que contiene (reglas de detección, playbooks de simulación, scripts de respuesta) está pensado para ejecutarse **únicamente en un entorno aislado y propio**, sin conectividad a redes de producción ni de terceros.

## Reglas del laboratorio

- La red de ataque y la red objetivo están aisladas de Internet y de la red doméstica o del centro (ver [`docs/threat-model.md`](docs/threat-model.md)).
- La simulación de ataques usa solo herramientas legítimas y mantenidas por terceros: Metasploit, Hydra, Atomic Red Team y MITRE Caldera.
- **No se desarrolla ni se publica malware propio.**
- Las acciones de respuesta automática del SOAR (bloqueo de IP, aislamiento de host) están restringidas por configuración a los activos del laboratorio.

## Datos que no deben entrar en el repositorio

Credenciales, claves, tokens, capturas de tráfico reales, logs con datos personales o IPs reales de redes ajenas. Ver `.gitignore`. Si algo sensible llega a commitearse, hay que **rotar la credencial** y reescribir el historial; borrar el fichero en un commit posterior no basta.

## Reporte de vulnerabilidades

Si encuentras un problema de seguridad en este repositorio, abre un [aviso privado de seguridad](../../security/advisories/new) o contacta con el autor por los medios indicados en su perfil de GitHub.
