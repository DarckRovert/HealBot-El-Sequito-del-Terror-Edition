-- ═════════════════════════════════════════════════════════════════════════
-- HealBot - Desactivación de Marcos de Blizzard
-- El Séquito del Terror Edition
-- ═════════════════════════════════════════════════════════════════════════

function HealBot_BlizzDisable()
    if not HealBot_Config.DisableBlizz or HealBot_Config.DisableBlizz == 0 then return end

    -- Marcos a desactivar
    local blizzFrames = {
        "PlayerFrame",
        "PetFrame",
        "TargetFrame",
        "TargetofTargetFrame",
    }

    -- Desactivar eventos y ocultar marcos principales
    for _, frameName in pairs(blizzFrames) do
        local frame = getglobal(frameName)
        if frame then
            frame:UnregisterAllEvents()
            frame:Hide()
            frame:ClearAllPoints()
            frame:SetPoint("BOTTOMLEFT", UIParent, "TOPLEFT", 0, 100) -- Mover fuera de la pantalla
        end
    end

    -- Desactivar marcos de grupo (1-4)
    for i = 1, 4 do
        local frameName = "PartyMemberFrame"..i
        local frame = getglobal(frameName)
        if frame then
            frame:UnregisterAllEvents()
            frame:Hide()
            frame:ClearAllPoints()
            frame:SetPoint("BOTTOMLEFT", UIParent, "TOPLEFT", 0, 100)
            
            -- Desactivar también barras de salud/maná individuales
            local health = getglobal(frameName.."HealthBar")
            if health then health:UnregisterAllEvents() end
            local mana = getglobal(frameName.."ManaBar")
            if mana then mana:UnregisterAllEvents() end
        end
    end

    -- Desactivar funciones de Blizzard que podrían re-mostrar los marcos
    ShowPartyFrame = function() end
    HidePartyFrame = function() end
    
    -- Nota: No desactivamos RaidFrame por si el usuario lo necesita par ver el grupo
    -- pero HealBot ya maneja el raid.
end
