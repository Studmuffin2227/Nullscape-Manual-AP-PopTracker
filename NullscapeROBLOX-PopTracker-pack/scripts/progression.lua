-- Upgrade icons. Each upgrade is unlocked by having enough of its Seed
-- (tiers come from the APWorld's hasUpgrade map, see scripts/data.lua).
-- Left-click an upgrade to set its Seed count up to that upgrade,
-- right-click to set it to just below it (handy when not using AP).

local EXTRA_STACK_CODE = "extra_upgrade_stack"
local UPGRADE_ITEMS = {}

local function seedCount(seed)
    local obj = Tracker:FindObjectForCode(seed)
    return obj and obj.AcquiredCount or 0
end

local function setSeed(seed, n)
    local obj = Tracker:FindObjectForCode(seed)
    if not obj then return end
    if n < 0 then n = 0 end
    if obj.MaxCount and n > obj.MaxCount then n = obj.MaxCount end
    obj.AcquiredCount = n
end

local function refreshUpgrades()
    local extra = Tracker:FindObjectForCode(EXTRA_STACK_CODE)
    extra = extra and extra.AcquiredCount or 0
    for _, e in ipairs(UPGRADE_ITEMS) do
        local up = e.up
        local unlocked = seedCount(up.seed) >= up.tier
        e.unlocked = unlocked
        e.li.IconMods = unlocked and "" or "@disabled"
        if unlocked and up.cap > 0 then
            local stacks = 1 + extra
            if stacks > up.cap then stacks = up.cap end
            e.li:SetOverlay(tostring(stacks))
        else
            e.li:SetOverlay("")
        end
    end
end

for _, up in ipairs(UPGRADES) do
    local entry = { up = up, unlocked = false }
    local li = ScriptHost:CreateLuaItem()
    li.Name = up.name
    li.Icon = ImageReference:FromPackRelativePath(up.img)
    li.IconMods = "@disabled"
    li.CanProvideCodeFunc = function(item, code) return code == up.code end
    li.ProvidesCodeFunc = function(item, code)
        if code == up.code and entry.unlocked then return 1 end
        return 0
    end
    li.OnLeftClickFunc = function(item)
        if seedCount(up.seed) >= up.tier then
            setSeed(up.seed, up.tier - 1)
        else
            setSeed(up.seed, up.tier)
        end
    end
    li.OnRightClickFunc = function(item)
        setSeed(up.seed, up.tier - 1)
    end
    pcall(function() li:SetOverlayAlign("right") end)
    entry.li = li
    UPGRADE_ITEMS[#UPGRADE_ITEMS + 1] = entry
end

refreshUpgrades()

local watched = {}
for _, up in ipairs(UPGRADES) do
    if not watched[up.seed] then
        watched[up.seed] = true
        ScriptHost:AddWatchForCode("upgrades_" .. up.seed, up.seed, function(code) refreshUpgrades() end)
    end
end
ScriptHost:AddWatchForCode("upgrades_extra_stack", EXTRA_STACK_CODE, function(code) refreshUpgrades() end)
