local barW = 200
local barH = 20


local function DrawBar(x, y, w, h, color, percentage)
    surface.SetDrawColor(color)
    surface.DrawRect(x, y, w * percentage, h)
    surface.SetDrawColor(0, 0, 0, 150)
    surface.DrawRect(x, y, w, h)
end


hook.Add("HUDPaint", "Simple_HUD", function()
    if ix.option.Get("ocultarHUD", false) then return end

    local ply = LocalPlayer()
    if not ply:Alive() then return end

    local hp = ply:Health() / ply:GetMaxHealth()  
    local armor = ply:Armor() / 100
    local stamina = ply:GetLocalVar("stm", 0) / 100
    local x, y = 15, ScrH() - barH * 4 - 20

    -- Health Bar
    DrawBar(x, y, barW, barH, ix.option.Get("colorVida", Color(255, 75, 66)), hp)
    draw.SimpleText("HP", "Trebuchet24", x + barW + 5, y + barH / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

    -- Armor Bar
    DrawBar(x, y + barH + 5, barW, barH, ix.option.Get("colorEscudo", Color(255, 132, 187)), armor)
    draw.SimpleText("Armor", "Trebuchet24", x + barW + 5, y + barH * 1.5 + 5, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

    -- Stamina Bar
    DrawBar(x, y + 2 * (barH + 5), barW, barH, ix.option.Get("colorEstamina", Color(67, 223, 67)), stamina)
    draw.SimpleText("Stamina", "Trebuchet24", x + barW + 5, y + 2 * (barH + 5) + barH / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
end)

function PLUGIN:ShouldHideBars()
    return true
end
