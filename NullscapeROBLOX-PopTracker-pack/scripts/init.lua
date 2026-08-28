ScriptHost:LoadScript("scripts/logic.lua")

Tracker:AddItems("items/items.json")
Tracker:AddMaps("maps/maps.json")
Tracker:AddLocations("locations/locations.json")

-- must load before AddLayouts: layouts resolve item codes against whatever
-- exists at the time they're parsed, so any Lua-created items (the nav
-- buttons here) have to exist *before* the layout that references them.
ScriptHost:LoadScript("scripts/progression.lua")
ScriptHost:LoadScript("scripts/navigation.lua")

Tracker:AddLayouts("layouts/layouts.json")

-- registers the actual Archipelago item/location sync handlers; safe to
-- load even when not connected to AP.
ScriptHost:LoadScript("scripts/autotracking.lua")
