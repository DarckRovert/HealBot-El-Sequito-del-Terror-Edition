-- ═════════════════════════════════════════════════════════════════════════
-- HealBot - Temática Oscura
-- El Séquito del Terror
-- Creado por DarckRovert (Elnazzareno)
-- ═════════════════════════════════════════════════════════════════════════

-- Aplicar temática oscura de El Séquito del Terror a las Opciones
function HealBot_ApplyDarkTheme()
    if HealBot_Options then
        -- Fondo morado oscuro con transparencia
        HealBot_Options:SetBackdropColor(0.08, 0, 0.15, 0.92);
        -- Borde morado brillante
        HealBot_Options:SetBackdropBorderColor(0.5, 0.1, 0.7, 1);
        
        -- Cambiar color del header si existe
        local header = getglobal("HealBot_Options_Header");
        if header then
            header:SetVertexColor(0.6, 0.2, 0.8);
        end
    end
end

-- Aplicar temática oscura al panel de acciones principal
function HealBot_ApplyActionTheme()
    if HealBot_Action then
        -- Usar los mismos colores para consistencia
        HealBot_Action:SetBackdropColor(0.08, 0, 0.15, 0.92);
        HealBot_Action:SetBackdropBorderColor(0.5, 0.1, 0.7, 1);
    end
end

-- Event frame para aplicar tema cuando se carga el addon
local themeFrame = CreateFrame("Frame");
themeFrame:RegisterEvent("ADDON_LOADED");
-- En WoW 1.12.1 (Lua 5.0), los argumentos se pasan explícitamente a la función del script
themeFrame:SetScript("OnEvent", function(self, event, arg1)
    -- arg1 es el nombre del addon en ADDON_LOADED
    if event == "ADDON_LOADED" and arg1 == "HealBot" then
        HealBot_ApplyDarkTheme();
        HealBot_ApplyActionTheme();
    end
end);
