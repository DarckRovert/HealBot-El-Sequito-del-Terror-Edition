# ðŸ“ Wiki: Arquitectura 'Diamond Tier' â€” HealBot [v1.12.0]

Estructura tÃ©cnica de la orquestaciÃ³n de vida mantenida por **DarckRovert**.

## ðŸ—ï¸ JerarquÃ­a del Sistema Healing Orchestrator (Life Hierarchy)

**HealBot** opera mediante un motor de estados de unidad de alto rendimiento:

1.  **Status Engine (`HealBot_StatusEngine.lua`)**: El nÃºcleo reactivo que intercepta `UNIT_HEALTH`, `UNIT_AURA` y eventos de combate para reflejar el estado vital de la raid.
2.  **Action Logic (`HealBot_Action.lua`)**: Gestor de la matriz de clics (Click-to-Cast) que traduce interacciones de ratÃ³n en el lanzamiento asÃ­ncrono de hechizos.
3.  **Threat Monitor (`HealBot_ThreatMonitor.lua`)**: MÃ³dulo de intercepciÃ³n de agro que visualiza quiÃ©n estÃ¡ en peligro inminente mediante bordes de alerta Diamond Tier.
4.  **UI Core (`HealBot.xml`)**: Define la estructura de los marcos de unidad altamente personalizables y optimizados para el renderizado Apex.

---

## ðŸ§­ Diagrama de Flujo: Proceso de SanaciÃ³n v9.4

```mermaid
graph TD
    A[Inicio: Salud de Unidad Cambia] --> B[InterceptaciÃ³n de StatusEngine]
    B --> C[Carga de SanaciÃ³n Predictiva IncHeal]
    C --> D[ActualizaciÃ³n Visual de Bar Frame]
    D --> E{Â¿Tiene Agro o Debuff?}
    E -- SÃ­ --> F[Resalte Visual de Borde / Color Diamond]
    F --> G[Clic de Sanador sobre Marco]
    G --> H[TraducciÃ³n de Binding en Action.lua]
    H --> I[Lanzamiento de Hechizo TÃ¡ctico]
    I --> J[Sync con TerrorMeter & WCS_Brain]
    E -- No --> G
```

## âš¡ Estrategias de IngenierÃ­a Diamond Tier

- **Selective Update Throttling**: HealBot v9.4 solo actualiza los marcos de unidad visibles, reduciendo drÃ¡sticamente las llamadas a la API de Blizzard en encuentros masivos de 40raids.
- **Async Bonus Scanner**: El escaneo de bonos de sanaciÃ³n del equipo se realiza fuera del hilo principal para no afectar la fluidez de respuesta del ratÃ³n.
- **Aura Awareness v9.4**: DetecciÃ³n nativa de las mecÃ¡nicas exclusivas de Turtle WoW (ej: perjuicios de Karazhan) integrada en el motor de Alerts-Tier.

---
Â© 2026 **DarckRovert** â€” El SÃ©quito del Terror.
*SoberanÃ­a de vida para la conquista de Azeroth.*

