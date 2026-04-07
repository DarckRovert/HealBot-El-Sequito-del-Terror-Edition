# Contributing to HealBot (Healing Orchestrator) 🛡️🏥

¡Gracias por contribuir a la soberanía de vida del **Séquito del Terror**! Para mantener el estándar **Diamond Tier** de **DarckRovert**, todas las contribuciones deben centrarse en la estabilidad de red y el rendimiento de la interfaz de banda.

---

## 🛡️ Estándares Técnicos (Healer Core)

Este AddOn está optimizado para **Turtle WoW** (WoW v1.12.1). Las contribuciones DEBEN cumplir con:

1.  **Status Sync Efficiency**: El motor de estado no debe saturar el Combat Log con escaneos de unidades innecesarios. Optimiza el uso de `UNIT_HEALTH` y `UNIT_MAXHEALTH`.
2.  **No Lua 5.1+**: El motor es Lua 5.0. Prohibido el operador `#` (usa `table.getn`).
3.  **Predictive Logic Sync**: Cualquier nueva lógica de sanación predictiva debe ser compatible con las librerías de comunicación asíncrona existentes del clan.
4.  **UI Apex Standard**: Toda modificación visual en los marcos de unidad debe seguir el esquema de colores Dark-Tier para no deslumbrar al sanador.

## 📐 Arquetipo de Desarrollo

Si deseas contribuir:
- **`HealBot_StatusEngine.lua`**: Es el corazón del procesamiento de salud.
- **`HealBot_Action.lua`**: Gestiona el mapeo de clics a hechizos (Binding System).
- **`HealBot_Options.lua`**: Panel de configuración institucional.
- **`HealBot_DarkTheme.lua`**: Definición de estilos estéticos Diamond Tier.

## 💎 Proceso de Pull Request

1.  **Fork & Branch**: Trabaja en ramas descriptivas (`fix/inc-heal`, `feature/threat-monitor`).
2.  **Documentación**: Actualiza `CHANGELOG.md` antes de enviar el PR.
3.  **Branding**: Mantén los enlaces institucionales oficiales de **DarckRovert**.

---
© 2026 **DarckRovert** — El Séquito del Terror.
*Soberanía de vida para la conquista de Azeroth.*