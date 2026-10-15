# attack-sim

Simulación de ataques para validar la detección y la respuesta (el lado "red team" del laboratorio).

## Herramientas permitidas

Metasploit, Hydra, Atomic Red Team y MITRE Caldera. **No se desarrolla malware propio.**

## Reglas

- Solo se ejecuta contra los activos del laboratorio, desde el segmento de ataque aislado.
- Cada escenario es un playbook documentado, reproducible y reversible (snapshot previo de las VMs objetivo).
- Cada escenario indica: técnica(s) ATT&CK, herramienta, pasos, evento esperado en Suricata/Wazuh y respuesta esperada del SOAR.

## Plantilla de escenario

```
# <ID> — <nombre>

- Técnica ATT&CK:
- Herramienta:
- Objetivo / origen:
- Pasos:
- Detección esperada:
- Respuesta SOAR esperada:
- Limpieza / rollback:
```
