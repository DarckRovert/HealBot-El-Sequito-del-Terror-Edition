-- ═════════════════════════════════════════════════════════════════════════
-- HealBot - Monitor de Amenaza (TerrorMeter Bridge)
-- El Séquito del Terror Edition v4.0
-- Creado por DarckRovert (Elnazzareno)
-- Lua 5.0 Estricto — WoW 1.12.1
-- ═════════════════════════════════════════════════════════════════════════

-- Cache de personajes con amenaza alta
HealBot_ThreatHigh = {};

-- Aviso de boss desde BigWigs
HealBot_BossWarn = nil;
HealBot_BossWarnTimer = 0;

-- Procesa mensajes del addon TerrorMeter
-- Protocolo: "THREAT:Nombre:ALTA" o "THREAT:Nombre:BAJA"
function HealBot_ThreatMonitor_OnTerrorMeter(sender, msg)
  if not msg then return; end
  -- Lua 5.0: string.find con captura manual
  local colonPos1 = string.find(msg, ":", 1, true);
  if not colonPos1 then return; end
  local tag = string.sub(msg, 1, colonPos1 - 1);
  if tag ~= "THREAT" then return; end

  local rest = string.sub(msg, colonPos1 + 1);
  local colonPos2 = string.find(rest, ":", 1, true);
  if not colonPos2 then return; end

  local name  = string.sub(rest, 1, colonPos2 - 1);
  local level = string.sub(rest, colonPos2 + 1);

  if name and name ~= "" then
    if level == "ALTA" then
      HealBot_ThreatHigh[name] = true;
    else
      HealBot_ThreatHigh[name] = nil;
    end
  end
end

-- Procesa mensajes de BigWigs para mostrar avisos de boss en el panel
-- Protocolo BigWigs addon: "BWL:" + texto del aviso
function HealBot_ThreatMonitor_OnBigWigs(sender, msg)
  if not msg then return; end
  -- Los mensajes de boss de BigWigs comienzan con "BWL:" o similares
  -- Aceptamos cualquier mensaje de BigWigs como aviso temporal
  if string.len(msg) > 0 then
    HealBot_BossWarn = msg;
    HealBot_BossWarnTimer = HEALBOT_BOSSWARN_DURATION;
  end
end

-- Actualiza el timer del aviso de boss (llamado desde el update loop)
function HealBot_ThreatMonitor_UpdateBossWarn(elapsed)
  if HealBot_BossWarnTimer > 0 then
    HealBot_BossWarnTimer = HealBot_BossWarnTimer - elapsed;
    if HealBot_BossWarnTimer <= 0 then
      HealBot_BossWarnTimer = 0;
      HealBot_BossWarn = nil;
    end
  end
end

-- Limpia toda la caché de amenaza (llamar al salir del combate)
function HealBot_ThreatMonitor_Reset()
  HealBot_ThreatHigh = {};
  HealBot_BossWarn = nil;
  HealBot_BossWarnTimer = 0;
end
