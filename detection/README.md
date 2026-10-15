# detection

Capa de detección: **Suricata** (red) y **Wazuh** (host). Son herramientas existentes: aquí solo se guarda su configuración y las reglas propias.

## Estructura prevista

```
suricata/   suricata.yaml (fragmentos relevantes), reglas locales
wazuh/      decoders y reglas locales, configuración de agentes
```

## Convenciones

- Cada regla propia lleva comentario con la técnica MITRE ATT&CK que cubre.
- Cada regla se valida contra un escenario de `attack-sim/` y se documenta qué evento genera.
- Las salidas (EVE JSON, alertas de Wazuh) son el contrato de entrada del SOAR: cualquier cambio de formato requiere actualizar `soar-engine`.
