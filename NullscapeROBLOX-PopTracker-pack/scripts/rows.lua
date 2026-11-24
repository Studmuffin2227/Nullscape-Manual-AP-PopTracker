-- Manual-client style location list.
-- Every check is a clickable text row (a Lua item) that mirrors its
-- PopTracker location section:
--   purple = in logic, grey = out of logic, dark green with a check mark = done,
--   invisible = not part of this seed.
-- Left-click marks the check done (and sends it to AP); right-click undoes it.

local STATES = { logic = "_logic.png", nologic = "_nologic.png", done = "_done.png" }
local ROW_ITEMS = {}
local GOAL_ITEM = nil
local DIRTY = true

-- Set of AP location names that exist in the connected seed (nil = not connected).
SEED_LOCATIONS = nil

function MarkRowsDirty()
    DIRTY = true
end

local function blankFor(row)
    return "images/rows/blank_" .. row.w .. "x" .. row.h .. ".png"
end

local function sectionState(path)
    local s = Tracker:FindObjectForCode(path)
    if not s then return "nologic" end
    if s.AvailableChestCount == 0 then return "done" end
    if s.AccessibilityLevel == AccessibilityLevel.Normal then return "logic" end
    return "nologic"
end

function IsRowVisible(row)
    if SEED_LOCATIONS ~= nil then
        return SEED_LOCATIONS[row.ap] == true
    end
    local k = row.kind
    if k == "class" then
        if row.cls == "charger" or row.cls == "diver" then return true end
        return OptActive("opt_include_" .. row.cls, true)
    elseif k == "curse" then
        local s = OptStage("opt_cursanity")
        return s >= 2 or (s == 1 and not row.late)
    elseif k == "ost" then
        return OptStage("opt_ostsanity") > row.tier
    elseif k == "celestial" then
        if not OptActive("opt_celestial_quests", false) then return false end
        if row.defeat then return OptStage("opt_goal") < 3 end
    end
    return true
end

function CurrentVictoryRow()
    return VICTORY_ROWS[OptStage("opt_goal") + 1] or VICTORY_ROWS[1]
end

local function toggleSection(path)
    local s = Tracker:FindObjectForCode(path)
    if not s then return nil end
    if s.AvailableChestCount > 0 then
        s.AvailableChestCount = 0
    else
        s.AvailableChestCount = s.ChestCount
    end
    MarkRowsDirty()
    return s.AvailableChestCount == 0
end

local function setSection(path, done)
    local s = Tracker:FindObjectForCode(path)
    if not s then return end
    s.AvailableChestCount = done and 0 or s.ChestCount
    MarkRowsDirty()
end

local function makeItem(name, code, icon)
    local li = ScriptHost:CreateLuaItem()
    li.Name = name
    li.Icon = ImageReference:FromPackRelativePath(icon)
    li.CanProvideCodeFunc = function(item, c) return c == code end
    li.ProvidesCodeFunc = function(item, c) return 0 end
    return li
end

local function clickRow(row, right)
    if not row or not IsRowVisible(row) then return end
    if right then
        setSection(row.path, false)
        return
    end
    local done = toggleSection(row.path)
    if done and SendCheckForPath then SendCheckForPath(row.path) end
end

local ROW_BY_CODE = {}
for _, row in ipairs(ROWS) do
    ROW_BY_CODE[row.code] = row
    local entry = { row = row, last = nil }
    local li = makeItem(row.ap, row.code, blankFor(row))
    li.OnLeftClickFunc = function(item) clickRow(row, false) end
    li.OnRightClickFunc = function(item) clickRow(row, true) end
    entry.li = li
    ROW_ITEMS[#ROW_ITEMS + 1] = entry
end

-- Cursanity tab: a fixed table of slots. The curses that are in the seed fill
-- the slots in CURSE_SLOT_ORDER, so hidden curses never leave gaps.
local CURSE_SLOTS = {}
local CURSE_BLANK = "images/rows/blank_84x100.png"
for i = 1, #CURSE_SLOT_ORDER do
    local slot = { row = nil, last = nil }
    local li = makeItem("", "curse_slot_" .. i, CURSE_BLANK)
    li.OnLeftClickFunc = function(item) clickRow(slot.row, false) end
    li.OnRightClickFunc = function(item) clickRow(slot.row, true) end
    slot.li = li
    CURSE_SLOTS[i] = slot
end

-- The goal row shows whichever Bloom/Celestial goal the seed uses.
do
    local entry = { last = nil }
    local li = makeItem("Goal", "row_goal", "images/rows/blank_380x28.png")
    li.OnLeftClickFunc = function(item)
        local v = CurrentVictoryRow()
        local done = toggleSection(v.path)
        if done and SendGoal then SendGoal() end
    end
    li.OnRightClickFunc = function(item)
        setSection(CurrentVictoryRow().path, false)
    end
    entry.li = li
    GOAL_ITEM = entry
end

------------------------------------------------------------------ class buttons
local CLASS_INFO = {
    { name = "Charger", root = "roots_in_persistence" },
    { name = "Diver", root = "roots_in_versatility" },
    { name = "Glider", root = "roots_in_bravery" },
    { name = "Grappler", root = "roots_in_trust" },
    { name = "Prisoner", root = "roots_in_certainty" },
    { name = "Spirit", root = "roots_in_self_awareness" },
    { name = "Wanted", root = "roots_in_defiance" },
}
local NAV = {}
for _, info in ipairs(CLASS_INFO) do
    local lower = string.lower(info.name)
    local li = makeItem(info.name .. " Class Checks", "nav_" .. lower, "images/classes/" .. info.name .. ".png")
    li.OnLeftClickFunc = function(item) Tracker:UiHint("ActivateTab", info.name) end
    NAV[#NAV + 1] = { li = li, cls = lower, class_code = lower .. "_class", root_code = info.root,
                      base = "images/classes/" .. info.name .. ".png",
                      rooted = "images/classes/" .. info.name .. "Rooted.png" }
end

local function refreshNav(counts)
    for _, nav in ipairs(NAV) do
        local hasClass = Tracker:ProviderCountForCode(nav.class_code) > 0
        local hasRoot = Tracker:ProviderCountForCode(nav.root_code) > 0
        local icon = (hasClass and hasRoot) and nav.rooted or nav.base
        local mods = hasClass and "" or "@disabled"
        if nav.icon ~= icon or nav.mods ~= mods then
            nav.li.Icon = ImageReference:FromPackRelativePath(icon)
            nav.li.IconMods = mods
            nav.icon, nav.mods = icon, mods
        end
        local n = tostring(counts[nav.cls] or 0)
        if nav.badge ~= n then
            nav.li:SetOverlay(n)
            nav.badge = n
        end
    end
end

------------------------------------------------------------------ refresh
function RefreshRows()
    DIRTY = false
    local counts = {}
    local keys = {}
    for _, e in ipairs(ROW_ITEMS) do
        local row = e.row
        local key = "hidden"
        if IsRowVisible(row) then key = sectionState(row.path) end
        keys[row.code] = key
        if e.last ~= key then
            e.last = key
            if key == "hidden" then
                e.li.Icon = ImageReference:FromPackRelativePath(blankFor(row))
            else
                e.li.Icon = ImageReference:FromPackRelativePath(row.img .. STATES[key])
            end
        end
        if key == "logic" and row.kind == "class" then
            counts[row.cls] = (counts[row.cls] or 0) + 1
        end
    end
    local n = 0
    for _, code in ipairs(CURSE_SLOT_ORDER) do
        local key = keys[code]
        if key and key ~= "hidden" then
            n = n + 1
            local slot = CURSE_SLOTS[n]
            local row = ROW_BY_CODE[code]
            local skey = code .. "|" .. key
            slot.row = row
            if slot.last ~= skey then
                slot.last = skey
                slot.li.Icon = ImageReference:FromPackRelativePath(row.img .. STATES[key])
                slot.li.Name = row.ap
            end
        end
    end
    for i = n + 1, #CURSE_SLOTS do
        local slot = CURSE_SLOTS[i]
        slot.row = nil
        if slot.last ~= "empty" then
            slot.last = "empty"
            slot.li.Icon = ImageReference:FromPackRelativePath(CURSE_BLANK)
            slot.li.Name = ""
        end
    end
    local v = CurrentVictoryRow()
    local gkey = v.path .. "|" .. sectionState(v.path)
    if GOAL_ITEM.last ~= gkey then
        GOAL_ITEM.last = gkey
        GOAL_ITEM.li.Icon = ImageReference:FromPackRelativePath(v.img .. STATES[sectionState(v.path)])
        GOAL_ITEM.li.Name = v.ap
    end
    refreshNav(counts)
end

-- Logic is re-evaluated by PopTracker after item changes, so refresh on the
-- next frame instead of inside the change callback, plus a slow safety poll.
local frames = 0
ScriptHost:AddOnFrameHandler("nullscape_rows", function(elapsed)
    frames = frames + 1
    if DIRTY or frames >= 30 then
        frames = 0
        RefreshRows()
    end
end)
-- Watch the real items and options only (watching "*" would also fire for
-- the row icons themselves).
local WATCH_CODES = { "opt_blossom_required", "opt_goal", "opt_randomize_roots", "opt_cursanity",
    "opt_ostsanity", "opt_celestial_quests", "opt_prac_frags", "opt_prac_ungates", "opt_prac_roots",
    "opt_include_glider", "opt_include_grappler", "opt_include_prisoner", "opt_include_spirit",
    "opt_include_wanted" }
for _, info in pairs(AP_ITEMS) do WATCH_CODES[#WATCH_CODES + 1] = info.code end
for _, code in ipairs(WATCH_CODES) do
    ScriptHost:AddWatchForCode("nullscape_rows_" .. code, code, function(c) MarkRowsDirty() end)
end
ScriptHost:AddOnLocationSectionChangedHandler("nullscape_rows_sections", function(section) MarkRowsDirty() end)
