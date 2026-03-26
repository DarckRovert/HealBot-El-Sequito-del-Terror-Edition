-- ═════════════════════════════════════════════════════════════════════════
-- HealBot - Constantes Centralizadas
-- El Séquito del Terror Edition v4.0
-- Creado por DarckRovert (Elnazzareno)
-- Lua 5.0 Estricto — WoW 1.12.1
-- ═════════════════════════════════════════════════════════════════════════

-- Temporizadores del Motor
HEALBOT_TIMER_ULTRAFAST = 0.2;   -- ToT scan, pulso visual, FD check
HEALBOT_TIMER_FAST      = 0.5;   -- Refresco de barras, rango
HEALBOT_TIMER_SLOW      = 3.0;   -- Hechizos, equipo, versión

-- Umbrales de Salud
HEALBOT_PULSE_THRESHOLD = 0.20;  -- < 20% HP activa el pulso visual
HEALBOT_LOW_THRESHOLD   = 0.40;  -- < 40% HP se considera crítico
HEALBOT_DEAD_THRESHOLD  = 0;     -- 0 HP = muerto

-- Colores de Estado (RGB en rango 0-1)
HEALBOT_COLOR_AGGRO   = {R = 1.0, G = 0.0, B = 0.0};  -- Rojo: agro activo
HEALBOT_COLOR_THREAT  = {R = 1.0, G = 0.5, B = 0.0};  -- Naranja: amenaza alta
HEALBOT_COLOR_RES     = {R = 0.2, G = 1.0, B = 0.2};  -- Verde: siendo resucitado
HEALBOT_COLOR_OFFLINE = {R = 0.4, G = 0.4, B = 0.4};  -- Gris: desconectado
HEALBOT_COLOR_AFK     = {R = 1.0, G = 1.0, B = 0.0};  -- Amarillo: AFK
HEALBOT_COLOR_DND     = {R = 1.0, G = 0.6, B = 0.0};  -- Naranja claro: DND

-- Alfa de Transparencia
HEALBOT_OFFLINE_ALPHA  = 0.3;    -- Barras de jugadores desconectados

-- Colores de Tema El Séquito del Terror
HEALBOT_THEME_BG_R     = 0.08;
HEALBOT_THEME_BG_G     = 0.00;
HEALBOT_THEME_BG_B     = 0.15;
HEALBOT_THEME_BG_A     = 0.92;
HEALBOT_THEME_BORDER_R = 0.50;
HEALBOT_THEME_BORDER_G = 0.10;
HEALBOT_THEME_BORDER_B = 0.70;
HEALBOT_THEME_BORDER_A = 1.00;

-- Colores de Borde en Combate
HEALBOT_COMBAT_BORDER_R = 0.90;
HEALBOT_COMBAT_BORDER_G = 0.10;
HEALBOT_COMBAT_BORDER_B = 0.10;
HEALBOT_COMBAT_BORDER_A = 1.00;

-- Colores de Clase WoW (inglés mayúsculas — UnitClass devuelve esto)
HEALBOT_CLASS_COLORS = {
  ["WARRIOR"] = {R = 0.78, G = 0.61, B = 0.43},
  ["PALADIN"] = {R = 0.96, G = 0.55, B = 0.73},
  ["HUNTER"]  = {R = 0.67, G = 0.83, B = 0.45},
  ["ROGUE"]   = {R = 1.00, G = 0.96, B = 0.41},
  ["PRIEST"]  = {R = 1.00, G = 1.00, B = 1.00},
  ["SHAMAN"]  = {R = 0.00, G = 0.44, B = 0.87},
  ["MAGE"]    = {R = 0.41, G = 0.80, B = 0.94},
  ["WARLOCK"] = {R = 0.58, G = 0.51, B = 0.79},
  ["DRUID"]   = {R = 1.00, G = 0.49, B = 0.04},
};

-- Protocolos de Addon (CHAT_MSG_ADDON prefix)
HEALBOT_MSG_PREFIX        = "HealBot";
HEALBOT_TERRORMETER_MSG   = "TerrorMeter";
HEALBOT_BIGWIGS_MSG       = "BigWigs";
HEALBOT_CTRA_MSG          = "CTRA";

-- Duración del aviso BigWigs en panel (segundos)
HEALBOT_BOSSWARN_DURATION = 4.0;
