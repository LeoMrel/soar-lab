# soar-engine

Motor SOAR propio (Python ≥ 3.11).

## Responsabilidades

1. **Ingesta** de alertas de Suricata (EVE JSON) y Wazuh.
2. **Normalización** a un esquema de evento común.
3. **Correlación** de alertas relacionadas.
4. **Mapeo a MITRE ATT&CK** (táctica/técnica).
5. **Decisión de criticidad.**
6. **Respuesta automática:** bloqueo de IP, aislamiento de host, notificación.
7. **Persistencia** de alertas, decisiones y acciones en base de datos.

El dashboard web es un componente separado ([`../dashboard`](../dashboard)) que consume los datos persistidos, no el motor directamente.

## Estructura de módulos

La estructura interna se fijará con el spike de formato de alertas y el ADR correspondiente (Sprint 0), antes de crear los subpaquetes. Hasta entonces solo existe el paquete raíz `soar_engine`.

## Desarrollo

```bash
python -m venv .venv
source .venv/bin/activate
pip install -e ".[dev]"

ruff check .
ruff format .
pytest
```

## Seguridad

Las acciones de respuesta solo deben poder ejecutarse sobre activos de la lista de activos del laboratorio (a definir en configuración). Ver [`../SECURITY.md`](../SECURITY.md).
