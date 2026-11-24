ScriptHost:LoadScript("scripts/data.lua")
ScriptHost:LoadScript("scripts/logic.lua")

Tracker:AddItems("items/items.json")
Tracker:AddLocations("locations/locations.json")

-- Lua items (upgrade icons, location rows, class buttons) must exist
-- before the layouts that reference them are loaded.
ScriptHost:LoadScript("scripts/progression.lua")
ScriptHost:LoadScript("scripts/rows.lua")

Tracker:AddLayouts("layouts/layouts.json")

ScriptHost:LoadScript("scripts/autotracking.lua")
