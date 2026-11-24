-- Archipelago sync: items, checked locations, YAML options (from slot_data),
-- and sending checks / goal back to the server ("apmanual" flag).

local AP_GAME_NAME = "Manual_NullscapeROBLOX_sucrosesnowstorm"

-- AP location name -> pack section path, and the reverse
local PATH_BY_NAME = {}
local NAME_BY_PATH = {}
for _, row in ipairs(ROWS) do
    PATH_BY_NAME[row.ap] = row.path
    NAME_BY_PATH[row.path] = row.ap
end
for _, row in ipairs(VICTORY_ROWS) do
    PATH_BY_NAME[row.ap] = row.path
end

local LOCATION_ID_BY_PATH = {}
local MISSING = {}
local APPLYING_SERVER_CHECK = false

local function connected()
    return Archipelago and Archipelago.PlayerNumber ~= nil and Archipelago.PlayerNumber >= 0
end

local function rebuildLocationCache()
    LOCATION_ID_BY_PATH = {}
    MISSING = {}
    if not Archipelago then return end
    local seen = {}
    local any = false
    local function remember(id, missing)
        local name = Archipelago:GetLocationName(id, AP_GAME_NAME)
        if not name then return end
        seen[name] = true
        any = true
        local path = PATH_BY_NAME[name]
        if path then
            LOCATION_ID_BY_PATH[path] = id
            if missing then MISSING[id] = true end
        end
    end
    for _, id in ipairs(Archipelago.MissingLocations or {}) do remember(id, true) end
    for _, id in ipairs(Archipelago.CheckedLocations or {}) do
        remember(id, false)
        local path = PATH_BY_NAME[Archipelago:GetLocationName(id, AP_GAME_NAME) or ""]
        local s = path and Tracker:FindObjectForCode(path)
        if s and s.AvailableChestCount > 0 then
            APPLYING_SERVER_CHECK = true
            s.AvailableChestCount = 0
            APPLYING_SERVER_CHECK = false
        end
    end
    if any then
        SEED_LOCATIONS = seen
    end
    MarkRowsDirty()
end

------------------------------------------------------------------ options from slot_data
local function sdGet(slot_data, key)
    if slot_data == nil then return nil end
    if slot_data[key] ~= nil then return slot_data[key] end
    local want = string.lower(key)
    for k, v in pairs(slot_data) do
        if type(k) == "string" and string.lower(k) == want then return v end
    end
    return nil
end

local function truthy(v)
    return v == true or (type(v) == "number" and v ~= 0)
end

local function setToggle(code, value)
    local obj = Tracker:FindObjectForCode(code)
    if obj and value ~= nil then obj.Active = truthy(value) end
end

local function setStage(code, value)
    local obj = Tracker:FindObjectForCode(code)
    if obj and type(value) == "number" then obj.CurrentStage = value end
end

local function applySlotData(slot_data)
    if type(slot_data) ~= "table" then return end
    local req = sdGet(slot_data, "blossom_fragments_required")
    local obj = Tracker:FindObjectForCode("opt_blossom_required")
    if obj and type(req) == "number" then obj.AcquiredCount = req end
    setStage("opt_goal", sdGet(slot_data, "goal"))
    setStage("opt_cursanity", sdGet(slot_data, "cursanity"))
    setStage("opt_ostsanity", sdGet(slot_data, "ostsanity"))
    setToggle("opt_randomize_roots", sdGet(slot_data, "randomize_roots"))
    setToggle("opt_celestial_quests", sdGet(slot_data, "celestial_quests"))
    setToggle("opt_prac_frags", sdGet(slot_data, "celestial_practice_requires_FRAGMENTs"))
    setToggle("opt_prac_ungates", sdGet(slot_data, "celestial_practice_requires_ungates"))
    setToggle("opt_prac_roots", sdGet(slot_data, "celestial_practice_requires_roots"))
    local excluded = sdGet(slot_data, "class_exclude")
    if type(excluded) == "table" then
        local set = {}
        for k, v in pairs(excluded) do
            if type(v) == "string" then set[string.lower(v)] = true end
            if type(k) == "string" then set[string.lower(k)] = true end
        end
        for _, c in ipairs({ "glider", "grappler", "prisoner", "spirit", "wanted" }) do
            setToggle("opt_include_" .. c, not set[c])
        end
    end
end

------------------------------------------------------------------ reset
local function resetState()
    for _, info in pairs(AP_ITEMS) do
        local obj = Tracker:FindObjectForCode(info.code)
        if obj then
            if info.progressive then obj.CurrentStage = 0
            elseif info.consumable then obj.AcquiredCount = 0
            else obj.Active = false end
        end
    end
    for path, _ in pairs(NAME_BY_PATH) do
        local s = Tracker:FindObjectForCode(path)
        if s then s.AvailableChestCount = s.ChestCount end
    end
    for _, row in ipairs(VICTORY_ROWS) do
        local s = Tracker:FindObjectForCode(row.path)
        if s then s.AvailableChestCount = s.ChestCount end
    end
end

------------------------------------------------------------------ sending
function SendCheckForPath(path)
    if APPLYING_SERVER_CHECK or not connected() then return end
    local id = LOCATION_ID_BY_PATH[path]
    if not id then
        rebuildLocationCache()
        id = LOCATION_ID_BY_PATH[path]
    end
    if id and MISSING[id] then
        Archipelago:LocationChecks({ id })
        MISSING[id] = nil
    end
end

function SendGoal()
    if not connected() then return end
    if Archipelago.StatusUpdate and Archipelago.ClientStatus then
        Archipelago:StatusUpdate(Archipelago.ClientStatus.GOAL)
    end
end

------------------------------------------------------------------ handlers
if Archipelago then
    Archipelago:AddClearHandler("nullscape_clear", function(slot_data)
        SEED_LOCATIONS = nil
        resetState()
        applySlotData(slot_data)
        rebuildLocationCache()
    end)

    Archipelago:AddItemHandler("nullscape_items", function(index, item_id, item_name, player_number)
        local info = AP_ITEMS[item_name]
        if not info then return end
        local obj = Tracker:FindObjectForCode(info.code)
        if not obj then return end
        if info.progressive then
            if obj.CurrentStage < info.max_stage then obj.CurrentStage = obj.CurrentStage + 1 end
        elseif info.consumable then
            obj.AcquiredCount = obj.AcquiredCount + 1
        else
            obj.Active = true
        end
    end)

    Archipelago:AddLocationHandler("nullscape_locations", function(location_id, location_name)
        local path = PATH_BY_NAME[location_name]
        if not path then return end
        LOCATION_ID_BY_PATH[path] = location_id
        MISSING[location_id] = nil
        local s = Tracker:FindObjectForCode(path)
        if s then
            APPLYING_SERVER_CHECK = true
            s.AvailableChestCount = 0
            APPLYING_SERVER_CHECK = false
        end
        MarkRowsDirty()
    end)
end

-- Checks marked any other way (e.g. from the location tooltip) are sent too.
ScriptHost:AddOnLocationSectionChangedHandler("nullscape_manual_ap_checks", function(section)
    if APPLYING_SERVER_CHECK then return end
    if section.AvailableChestCount > 0 then return end
    SendCheckForPath("@" .. section.FullID)
end)
