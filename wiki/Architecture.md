# Arquitectura — HealBot Sequito 🏗️

mermaid
graph TD
    CORE[HealBot Core]
    UNIT[Unit Watcher]
    CLICK[Click Casting Engine]
    THREAT[Threat Engine]
    UI[Health Bars]

    UNIT --> CORE
    CLICK --> CORE
    THREAT --> CORE
    CORE --> UI


## Componentes
- **HealBot.lua**: Gestión de grupos y actualización de estados vitales.
- **HealBot_Action.lua**: Motor de click-casting y ejecución de hechizos.
- **HealBot_Options.lua**: Sistema complejo de configuración y perfiles.
