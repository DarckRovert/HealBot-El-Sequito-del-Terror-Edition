# Security Policy — Professional Healing Orchestrator (HealBot) 🔒🏥

Protegemos la integridad de tu operativa de sanación en **Turtle WoW**.

## 🛡️ Soporte por Versión
| Versión | Estado |
| --- | --- |
| v9.4.x | ✅ Soportada |
| v9.3.x | ⚠️ Crítico |

## 🛡️ Reporte de Vulnerabilidades
Si descubres un bug que compromise la estabilidad de las barras de banda durante el combate o que bloquee el sistema de clics (Click-to-Cast) en momentos críticos:

1.  **NO publique el exploit masivamente.**
2.  Reporta vía **Discord oficial** de **DarckRovert**.
3.  Incluye el log de `HealBot -> HealBot_Errors.lua`.

## 🛡️ Protecciones Integradas
- **Async Combat Lock**: HealBot v9.4 asegura que el sistema de asignación de hechizos (bindings) sea inamovible durante el combate para evitar errores catastróficos en el cliente 1.12.1.
- **Raid Overflow Protection**: El motor StatusEngine fragmenta los datos de salud de las bandas de 40 para no saturar el canal de red del clan.

---
© 2026 **DarckRovert** — El Séquito del Terror.
*Soberanía de vida segura para Azeroth.*
