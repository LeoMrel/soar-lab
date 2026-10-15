#!/usr/bin/env bash
# Crea labels, milestones (fases) e issues del backlog de Sprint 0 y Sprint 1.
# Requiere: gh autenticado. Para añadir al Project: gh auth refresh -s project
# y PROJECT_TITLE="<título exacto del Project>".
# Ejecutar una sola vez desde la raíz del repo (los issues no se deduplican).
set -euo pipefail

REPO="$(gh repo view --json nameWithOwner -q .nameWithOwner)"
echo "Repositorio: $REPO"

PROJECT_ARGS=()
if [[ -n "${PROJECT_TITLE:-}" ]]; then
  PROJECT_ARGS=(--project "$PROJECT_TITLE")
fi

# ---------- Labels ----------
label() { gh label create "$1" --color "$2" --description "$3" --force >/dev/null; }

label "type:story"        "1D76DB" "Historia de usuario / feature"
label "type:task"         "5319E7" "Tarea técnica"
label "type:spike"        "FBCA04" "Investigación con timebox"
label "type:bug"          "D73A4A" "Bug"
label "comp:infra"        "0E8A16" "Infraestructura objetivo"
label "comp:detection"    "0E8A16" "Suricata / Wazuh"
label "comp:soar-core"    "0E8A16" "Motor SOAR"
label "comp:dashboard"    "0E8A16" "Dashboard web"
label "comp:rust-parser"  "0E8A16" "Parser de logs en Rust"
label "comp:docs"         "0E8A16" "Documentación"
label "priority:P0"       "B60205" "Bloqueante"
label "priority:P1"       "D93F0B" "Importante"
label "priority:P2"       "C5DEF5" "Deseable"

# ---------- Milestones (fases) ----------
milestone() {
  gh api "repos/$REPO/milestones" -f title="$1" -f description="$2" >/dev/null 2>&1 \
    || echo "Milestone ya existente o no creado: $1"
}

M0="Fase 0 - Fundamentos"
M1="Fase 1 - Infraestructura y deteccion"
M2="Fase 2 - Nucleo SOAR"
M3="Fase 3 - Respuesta y dashboard"
M4="Fase 4 - Parser Rust y cierre"

milestone "$M0" "Repo, alcance, threat model y decisiones iniciales"
milestone "$M1" "Laboratorio, Suricata y Wazuh operativos"
milestone "$M2" "Ingesta, normalizacion, correlacion y mapeo ATT&CK"
milestone "$M3" "Respuesta automatica, BBDD y dashboard"
milestone "$M4" "Parser de logs en Rust, benchmark y documentacion final"

# ---------- Issues ----------
issue() { # título | labels | milestone | estimación | criterios de aceptación
  gh issue create \
    --title "$1" \
    --label "$2" \
    --milestone "$3" \
    --body "$(printf '**Estimación:** %s SP\n\n**Criterios de aceptación**\n%s\n' "$4" "$5")" \
    ${PROJECT_ARGS[@]+"${PROJECT_ARGS[@]}"}
}

# --- Sprint 0 (Fase 0) ---
issue "[Task] Crear repo, README, LICENSE, .gitignore y secret scanning" \
  "type:task,comp:docs,priority:P0" "$M0" 2 \
"- [ ] Repo con estructura base y ficheros de proyecto
- [ ] Secret scanning y push protection activados
- [ ] Protección de la rama main (PR obligatorio)"

issue "[Task] Definir alcance, criterios de éxito y threat model" \
  "type:task,comp:docs,priority:P0" "$M0" 3 \
"- [ ] docs/threat-model.md completado (activos, criticidad, segmentación)
- [ ] Criterios de éxito medibles por escenario
- [ ] Reglas de aislamiento del laboratorio definidas"

issue "[Task] ADR 0001: hipervisor / entorno de despliegue" \
  "type:task,comp:infra,priority:P0" "$M0" 3 \
"- [ ] Opciones comparadas frente a los criterios del ADR
- [ ] Decisión registrada y aceptada en docs/adr/0001-hipervisor.md"

issue "[Task] Diagrama de red y plan de segmentación" \
  "type:task,comp:infra,priority:P1" "$M0" 3 \
"- [ ] Diagrama en infra/ con segmentos objetivo y ataque
- [ ] Direccionamiento y reglas de tráfico entre segmentos documentados"

issue "[Spike] Formato de alertas de Suricata (EVE JSON) y Wazuh" \
  "type:spike,comp:soar-core,priority:P0" "$M0" 5 \
"- [ ] Campos relevantes de ambas fuentes documentados con ejemplos anonimizados
- [ ] Propuesta de esquema de evento común (base del ADR 0002)
- [ ] Timebox respetado; conclusiones en docs/"

issue "[Task] Definir Definition of Done y fases/milestones" \
  "type:task,comp:docs,priority:P1" "$M0" 2 \
"- [ ] docs/definition-of-done.md aprobado
- [ ] Milestones de las 5 fases creados con fecha objetivo"

# --- Sprint 1 (Fase 1) ---
issue "[Task] Instalar hipervisor y crear redes aisladas (objetivo / ataque)" \
  "type:task,comp:infra,priority:P0" "$M1" 3 \
"- [ ] Hipervisor instalado según ADR 0001
- [ ] Redes objetivo y ataque creadas y aisladas del exterior
- [ ] Verificado que no hay ruta del laboratorio a redes ajenas"

issue "[Story] Desplegar controlador de dominio Windows con Active Directory" \
  "type:story,comp:infra,priority:P0" "$M1" 5 \
"- [ ] DC desplegado con dominio y usuarios/grupos de prueba
- [ ] Proceso documentado y reproducible"

issue "[Task] Desplegar estación Windows y servidor Linux en el entorno" \
  "type:task,comp:infra,priority:P1" "$M1" 3 \
"- [ ] Estación Windows unida al dominio
- [ ] Servidor Linux con servicios de prueba expuestos
- [ ] Conectividad verificada entre activos objetivo"

issue "[Story] Desplegar Wazuh manager y agentes en los endpoints" \
  "type:story,comp:detection,priority:P0" "$M1" 5 \
"- [ ] Manager operativo y agentes conectados en Windows y Linux
- [ ] Eventos de prueba visibles en Wazuh
- [ ] Configuración versionada en detection/wazuh/"

issue "[Story] Desplegar Suricata en el sensor con salida EVE JSON" \
  "type:story,comp:detection,priority:P0" "$M1" 3 \
"- [ ] Sensor ve el tráfico del segmento objetivo
- [ ] Alerta de prueba generada y registrada en EVE JSON
- [ ] Configuración versionada en detection/suricata/"

issue "[Task] Desplegar VM atacante en el segmento aislado" \
  "type:task,comp:infra,priority:P1" "$M1" 2 \
"- [ ] VM atacante solo en el segmento de ataque
- [ ] Herramientas permitidas instaladas (Metasploit, Hydra)
- [ ] Alcance contra activos del laboratorio verificado"

issue "[Task] Snapshot baseline y documentación de reconstrucción del laboratorio" \
  "type:task,comp:infra,priority:P1" "$M1" 2 \
"- [ ] Snapshot de todas las VMs en estado limpio
- [ ] Procedimiento de reconstrucción desde cero en infra/README.md"

echo "Hecho. Revisa los issues y asigna Iteration/Estimate/Priority en el Project."
