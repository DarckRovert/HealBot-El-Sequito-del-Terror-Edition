-- ═════════════════════════════════════════════════════════════════════════
-- HealBot - Temática Visual Avanzada
-- El Séquito del Terror Edition v4.0
-- Creado por DarckRovert (Elnazzareno)
-- Lua 5.0 Estricto — WoW 1.12.1
-- ═════════════════════════════════════════════════════════════════════════

-- Estado del pulso visual
local HB_PulseToggle  = false;
local HB_PulseActive  = false;

-- ─── Tema Principal ──────────────────────────────────────────────────────

-- Aplicar temática oscura al panel de opciones
function HealBot_ApplyDarkTheme()
  if HealBot_Options then
    HealBot_Options:SetBackdropColor(
      HEALBOT_THEME_BG_R, HEALBOT_THEME_BG_G,
      HEALBOT_THEME_BG_B, HEALBOT_THEME_BG_A
    );
    HealBot_Options:SetBackdropBorderColor(
      HEALBOT_THEME_BORDER_R, HEALBOT_THEME_BORDER_G,
      HEALBOT_THEME_BORDER_B, HEALBOT_THEME_BORDER_A
    );
    local header = getglobal("HealBot_Options_Header");
    if header then
      header:SetVertexColor(0.6, 0.2, 0.8);
    end
  end
end

-- Aplicar temática oscura al panel de sanación principal
function HealBot_ApplyActionTheme()
  if HealBot_Action then
    HealBot_Action:SetBackdropColor(
      HEALBOT_THEME_BG_R, HEALBOT_THEME_BG_G,
      HEALBOT_THEME_BG_B, HEALBOT_THEME_BG_A
    );
    HealBot_Action:SetBackdropBorderColor(
      HEALBOT_THEME_BORDER_R, HEALBOT_THEME_BORDER_G,
      HEALBOT_THEME_BORDER_B, HEALBOT_THEME_BORDER_A
    );
  end
end

-- ─── Tema Dinámico de Combate ─────────────────────────────────────────────

-- Actualizar borde del panel según si estamos en combate o no
-- Llamar desde el timer Fast (0.5s) o desde eventos PLAYER_REGEN
function HealBot_Theme_UpdateBorder()
  if not HealBot_Action then return; end
  if HealBot_IsFighting then
    -- Rojo: en combate activo
    HealBot_Action:SetBackdropBorderColor(
      HEALBOT_COMBAT_BORDER_R, HEALBOT_COMBAT_BORDER_G,
      HEALBOT_COMBAT_BORDER_B, HEALBOT_COMBAT_BORDER_A
    );
  else
    -- Morado: en paz, icónico del Séquito del Terror
    HealBot_Action:SetBackdropBorderColor(
      HEALBOT_THEME_BORDER_R, HEALBOT_THEME_BORDER_G,
      HEALBOT_THEME_BORDER_B, HEALBOT_THEME_BORDER_A
    );
  end
end

-- ─── Efecto Pulso Visual ─────────────────────────────────────────────────

-- Alterna el efecto de pulso para barras críticas (< 20% HP)
-- Llamar desde el timer Ultra-Fast (0.2s)
function HealBot_Theme_TogglePulse()
  HB_PulseToggle = not HB_PulseToggle;
end

-- Aplica el efecto de pulso a una barra de salud si corresponde
-- pct: porcentaje de salud en rango 0-1
-- Retorna el alfa final a usar en SetStatusBarColor
function HealBot_Theme_GetPulseAlpha(pct, baseAlpha)
  if not baseAlpha then baseAlpha = 1.0; end
  if pct < HEALBOT_PULSE_THRESHOLD then
    if HB_PulseToggle then
      -- Atenuar a la mitad durante la fase "off" del pulso
      return baseAlpha * 0.45;
    else
      return baseAlpha;
    end
  end
  return baseAlpha;
end

-- ─── Carga con ADDON_LOADED ───────────────────────────────────────────────

local themeFrame = CreateFrame("Frame");
themeFrame:RegisterEvent("ADDON_LOADED");
themeFrame:SetScript("OnEvent", function()
  -- En WoW 1.12.1 los args del script llegan como globales
  if event == "ADDON_LOADED" and arg1 == "HealBot" then
    HealBot_ApplyDarkTheme();
    HealBot_ApplyActionTheme();
  end
end);
