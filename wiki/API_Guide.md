# 🛠️ Wiki: Guía de API — Professional Healing Orchestrator (HealBot)

HealBot expone métodos para que otros AddOns del ecosistema **Séquito del Terror** puedan reaccionar a la salud de la banda y eventos de agro.

## 📡 Funciones de Estado (Life API)

### `HealBot_GetUnitHealth(unit)`
Obtiene la salud real y predictiva (IncHeal) de una unidad en tiempo real.
- **`unit`**: Identificador de unidad (ej: "raid1", "player").

### `HealBot_RegisterThreatCallback(func)`
Permite que un script externo se suscriba a las alertas de cambio de agro detectadas.

## 📎 Integración con Ecosistema Gravity

- **Neural Survival**: **WCS_Brain** utiliza la API de HealBot para monitorear si el dueño de la mascota está recibiendo daño crítico y activar automáticamente habilidades de protección o curación de emergencia.
- **Raid Coordination**: **BigWigs** utiliza los estados de HealBot para priorizar avisos de banda hacia los jugadores con menor porcentaje de salud real durante mecánicas de "soak".

---
© 2026 **DarckRovert** — El Séquito del Terror.
*Soberanía de vida para la conquista de Azeroth.*
