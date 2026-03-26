-- ═════════════════════════════════════════════════════════════════════════
-- HealBot - Motor de Estados de Unidad
-- El Séquito del Terror Edition v4.0
-- Creado por DarckRovert (Elnazzareno)
-- Lua 5.0 Estricto — WoW 1.12.1
-- ═════════════════════════════════════════════════════════════════════════

-- Cache global de estados por unidad
HealBot_UnitStatus = {};

-- Función centralizada que devuelve el estado prioritario de una unidad
-- Retorna: "AFK", "DND", "OFF", "FD", "RES", "THREAT", "AGGRO", o nil
function HealBot_GetUnitStatus(unit)
  -- Primero verificar que la unidad existe
  if not UnitExists(unit) then return nil; end

  -- Desconexión (máxima prioridad)
  if not UnitIsConnected(unit) then return "OFF"; end

  -- AFK / DND (Verificación segura de API para Vanilla 1.12.1)
  if UnitIsAFK and UnitIsAFK(unit) then return "AFK"; end
  if UnitIsDND and UnitIsDND(unit) then return "DND"; end

  -- Fingir muerte (Cazador)
  if HealBot_IsFeignDeath and HealBot_IsFeignDeath(unit) then return "FD"; end

  -- Siendo resucitado
  local uname = UnitName(unit);
  if uname and HealBot_Ressing and HealBot_Ressing[uname] then return "RES"; end

  -- Amenaza alta (desde TerrorMeter)
  if uname and HealBot_ThreatHigh and HealBot_ThreatHigh[uname] then return "THREAT"; end

  return nil;
end

-- Construye el sufijo de texto para mostrar en la barra
-- Ejemplo: " (AFK)", " (RES)", etc. — o "" si no hay estado
function HealBot_GetStatusSuffix(unit)
  local s = HealBot_GetUnitStatus(unit);
  if s then
    return " (" .. s .. ")";
  end
  return "";
end

-- Actualiza el color de texto del nombre según el estado
-- Devuelve r, g, b en rango 0-1
function HealBot_GetStatusTextColor(unit, defaultR, defaultG, defaultB)
  local s = HealBot_GetUnitStatus(unit);
  if s == "OFF" then
    return HEALBOT_COLOR_OFFLINE.R, HEALBOT_COLOR_OFFLINE.G, HEALBOT_COLOR_OFFLINE.B;
  elseif s == "AFK" then
    return HEALBOT_COLOR_AFK.R, HEALBOT_COLOR_AFK.G, HEALBOT_COLOR_AFK.B;
  elseif s == "DND" then
    return HEALBOT_COLOR_DND.R, HEALBOT_COLOR_DND.G, HEALBOT_COLOR_DND.B;
  elseif s == "RES" then
    return HEALBOT_COLOR_RES.R, HEALBOT_COLOR_RES.G, HEALBOT_COLOR_RES.B;
  elseif s == "THREAT" then
    return HEALBOT_COLOR_THREAT.R, HEALBOT_COLOR_THREAT.G, HEALBOT_COLOR_THREAT.B;
  end
  -- Sin estado especial: usar el color por defecto
  return defaultR, defaultG, defaultB;
end

-- Realiza un update masivo de todos los estados en un solo pase
-- Llamado desde el timer Ultra-Fast (0.2s)
function HealBot_StatusEngine_Update()
  if not HealBot_Action_HealButtons then return; end
  table.foreach(HealBot_Action_HealButtons, function(i, button)
    if button and button.unit then
      HealBot_UnitStatus[button.unit] = HealBot_GetUnitStatus(button.unit);
    end
  end);
end

-- Devuelve el color de clase WoW para una unidad (inglés mayúsculas)
-- Retorna r, g, b. Si no hay color de clase, retorna blanco (1, 1, 1)
function HealBot_GetClassColor(unit)
  if not UnitExists(unit) then return 1, 1, 1; end
  local _, eng = UnitClass(unit);
  if eng and HEALBOT_CLASS_COLORS and HEALBOT_CLASS_COLORS[eng] then
    local c = HEALBOT_CLASS_COLORS[eng];
    return c.R, c.G, c.B;
  end
  return 1, 1, 1;
end

-- Calcula el color degradado de salud: verde -> amarillo -> rojo
-- Lua 5.0 pura: sin operadores modernos
function HealBot_HealthGradient(hlth, maxhlth)
  if not maxhlth or maxhlth == 0 then return 0.5, 0.5, 0.5; end
  local pct = hlth / maxhlth;
  local r, g, b;
  if pct > 0.5 then
    -- Verde brillante (100%) -> Amarillo (50%)
    r = 2 * (1 - pct);
    g = 1;
  else
    -- Amarillo (50%) -> Rojo oscuro (0%)
    r = 1;
    g = 2 * pct;
  end
  b = 0;
  -- Oscurecer aún más al bajar de 20%
  if pct < HEALBOT_PULSE_THRESHOLD then
    local factor = pct / HEALBOT_PULSE_THRESHOLD;
    g = g * factor;
  end
  return r, g, b;
end
