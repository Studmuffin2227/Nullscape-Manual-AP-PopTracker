local ITEMS_BY_NAME = {
    ["Seed of Potential"] = { code = "seed_of_potential", consumable = true },
    ["Seed of Control"] = { code = "seed_of_control", consumable = true },
    ["Seed of Nullscape"] = { code = "seed_of_nullscape", consumable = true },
    ["Seed of Introspection"] = { code = "seed_of_introspection", consumable = true },
    ["Seed of Omnipotence"] = { code = "seed_of_omnipotence", consumable = true },
    ["Seed of Immortality"] = { code = "seed_of_immortality", consumable = true },
    ["Progressive Ungate Levels"] = { code = "progressive_ungate_levels", consumable = true },
    ["Progressive Lower Difficulty"] = { code = "progressive_lower_difficulty", consumable = true },
    ["Diver Class"] = { code = "diver_class", consumable = false },
    ["Charger Class"] = { code = "charger_class", consumable = false },
    ["Grappler Class"] = { code = "grappler_class", consumable = false },
    ["Spirit Class"] = { code = "spirit_class", consumable = false },
    ["Glider Class"] = { code = "glider_class", consumable = false },
    ["Wanted Class"] = { code = "wanted_class", consumable = false },
    ["Prisoner Class"] = { code = "prisoner_class", consumable = false },
    ["ROOTS IN VERSATILITY"] = { code = "roots_in_versatility", consumable = false },
    ["ROOTS IN PERSISTENCE"] = { code = "roots_in_persistence", consumable = false },
    ["ROOTS IN TRUST"] = { code = "roots_in_trust", consumable = false },
    ["ROOTS IN SELF-AWARENESS"] = { code = "roots_in_self_awareness", consumable = false },
    ["ROOTS IN BRAVERY"] = { code = "roots_in_bravery", consumable = false },
    ["ROOTS IN CERTAINTY"] = { code = "roots_in_certainty", consumable = false },
    ["ROOTS IN DEFIANCE"] = { code = "roots_in_defiance", consumable = false },
    ["FRAGMENT OF BLOSSOM"] = { code = "fragment_of_blossom", consumable = true },
    ["Flesh Trap"] = { code = "flesh_trap", consumable = false },
    ["Oblivion Trap"] = { code = "oblivion_trap", consumable = false },
    ["Prisoner Trap"] = { code = "prisoner_trap", consumable = false },
    ["Extra Upgrade Stack"] = { code = "extra_upgrade_stack", consumable = true },
}

local LOCATIONS_BY_NAME = {
    ["Bloom. (10)"] = "@BLOOM/Bloom. (10)/Goal",
    ["Bloom. (15)"] = "@BLOOM/Bloom. (15)/Goal",
    ["Bloom. (20)"] = "@BLOOM/Bloom. (20)/Goal",
    ["Encounter Voidbound Enemy"] = "@Any/Encounter Voidbound Enemy/Check",
    ["Survive Voidbreaker Encounter"] = "@Any/Survive Voidbreaker Encounter/Check",
    ["3 Husk Curses"] = "@Any/3 Husk Curses/Check",
    ["2 Tripmine Curses"] = "@Any/2 Tripmine Curses/Check",
    ["Greater Curse"] = "@Any/Greater Curse/Check",
    ["Burn"] = "@Any/Burn/Check",
    ["Become Concussed"] = "@Any/Become Concussed/Check",
    ["Escape With Spare Shield"] = "@Any/Escape With Spare Shield/Check",
    ["Escape With Spare Subspacial Barrier"] = "@Any/Escape With Spare Subspacial Barrier/Check",
    ["Seamine Curse"] = "@Any/Seamine Curse/Check",
    ["Kolóna Curse"] = "@Any/Kolóna Curse/Check",
    ["Reach Level 5 [Charger]"] = "@Charger/Reach Level 5 [Charger]/Check",
    ["All Gold Gifts [Charger]"] = "@Charger/All Gold Gifts [Charger]/Check",
    ["Escape After Complete Destruction (Level 3+) [Charger]"] = "@Charger/Escape After Complete Destruction (Level 3+) [Charger]/Check",
    ["Take Baby [Charger]"] = "@Charger/Take Baby [Charger]/Check",
    ["Encounter Flesh [Charger]"] = "@Charger/Encounter Flesh [Charger]/Check",
    ["Take Husk [Charger]"] = "@Charger/Take Husk [Charger]/Check",
    ["Encounter Telefragger [Charger]"] = "@Charger/Encounter Telefragger [Charger]/Check",
    ["Medal Curse [Charger]"] = "@Charger/Medal Curse [Charger]/Check",
    ["Altar of Purgatory [Charger]"] = "@Charger/Altar of Purgatory [Charger]/Check",
    ["Reach Level 13 [Charger]"] = "@Charger/Reach Level 13 [Charger]/Check",
    ["Overtuned [Charger]"] = "@Charger/Overtuned [Charger]/Check",
    ["Detonate 5 Tripmines In A Level [Charger]"] = "@Charger/Detonate 5 Tripmines In A Level [Charger]/Check",
    ["ICBM Curse [Charger]"] = "@Charger/ICBM Curse [Charger]/Check",
    ["Drop Bounce On Grapple Point [Charger]"] = "@Charger/Drop Bounce On Grapple Point [Charger]/Check",
    ["Ride Grindrail [Charger]"] = "@Charger/Ride Grindrail [Charger]/Check",
    ["Abilityless Level (Level 3+) [Charger]"] = "@Charger/Abilityless Level (Level 3+) [Charger]/Check",
    ["Reach Level 5 [Diver]"] = "@Diver/Reach Level 5 [Diver]/Check",
    ["All Gold Gifts [Diver]"] = "@Diver/All Gold Gifts [Diver]/Check",
    ["Escape After Complete Destruction (Level 3+) [Diver]"] = "@Diver/Escape After Complete Destruction (Level 3+) [Diver]/Check",
    ["Take Baby [Diver]"] = "@Diver/Take Baby [Diver]/Check",
    ["Encounter Flesh [Diver]"] = "@Diver/Encounter Flesh [Diver]/Check",
    ["Take Husk [Diver]"] = "@Diver/Take Husk [Diver]/Check",
    ["Encounter Telefragger [Diver]"] = "@Diver/Encounter Telefragger [Diver]/Check",
    ["Medal Curse [Diver]"] = "@Diver/Medal Curse [Diver]/Check",
    ["Altar of Purgatory [Diver]"] = "@Diver/Altar of Purgatory [Diver]/Check",
    ["Reach Level 13 [Diver]"] = "@Diver/Reach Level 13 [Diver]/Check",
    ["Overtuned [Diver]"] = "@Diver/Overtuned [Diver]/Check",
    ["Dive Into Bell [Diver]"] = "@Diver/Dive Into Bell [Diver]/Check",
    ["Survive A Ninja Belt Bonk [Diver]"] = "@Diver/Survive A Ninja Belt Bonk [Diver]/Check",
    ["Telefragger Curse [Diver]"] = "@Diver/Telefragger Curse [Diver]/Check",
    ["Dive Into Grapple Point [Diver]"] = "@Diver/Dive Into Grapple Point [Diver]/Check",
    ["Abilityless Level (Level 3+) [Diver]"] = "@Diver/Abilityless Level (Level 3+) [Diver]/Check",
    ["Reach Level 5 [Glider]"] = "@Glider/Reach Level 5 [Glider]/Check",
    ["All Gold Gifts [Glider]"] = "@Glider/All Gold Gifts [Glider]/Check",
    ["Escape After Complete Destruction (Level 3+) [Glider]"] = "@Glider/Escape After Complete Destruction (Level 3+) [Glider]/Check",
    ["Take Baby [Glider]"] = "@Glider/Take Baby [Glider]/Check",
    ["Encounter Flesh [Glider]"] = "@Glider/Encounter Flesh [Glider]/Check",
    ["Take Husk [Glider]"] = "@Glider/Take Husk [Glider]/Check",
    ["Encounter Telefragger [Glider]"] = "@Glider/Encounter Telefragger [Glider]/Check",
    ["Medal Curse [Glider]"] = "@Glider/Medal Curse [Glider]/Check",
    ["Altar of Purgatory [Glider]"] = "@Glider/Altar of Purgatory [Glider]/Check",
    ["Reach Level 13 [Glider]"] = "@Glider/Reach Level 13 [Glider]/Check",
    ["Overtuned [Glider]"] = "@Glider/Overtuned [Glider]/Check",
    ["Flesh Curse [Glider]"] = "@Glider/Flesh Curse [Glider]/Check",
    ["Survive A Bonk [Glider]"] = "@Glider/Survive A Bonk [Glider]/Check",
    ["Glide Into A Grapple Point [Glider]"] = "@Glider/Glide Into A Grapple Point [Glider]/Check",
    ["Survive Seamine Detonation [Glider]"] = "@Glider/Survive Seamine Detonation [Glider]/Check",
    ["Abilityless Level (Level 3+) [Glider]"] = "@Glider/Abilityless Level (Level 3+) [Glider]/Check",
    ["Reach Level 5 [Grappler]"] = "@Grappler/Reach Level 5 [Grappler]/Check",
    ["All Gold Gifts [Grappler]"] = "@Grappler/All Gold Gifts [Grappler]/Check",
    ["Escape After Complete Destruction (Level 3+) [Grappler]"] = "@Grappler/Escape After Complete Destruction (Level 3+) [Grappler]/Check",
    ["Take Baby [Grappler]"] = "@Grappler/Take Baby [Grappler]/Check",
    ["Encounter Flesh [Grappler]"] = "@Grappler/Encounter Flesh [Grappler]/Check",
    ["Take Husk [Grappler]"] = "@Grappler/Take Husk [Grappler]/Check",
    ["Encounter Telefragger [Grappler]"] = "@Grappler/Encounter Telefragger [Grappler]/Check",
    ["Medal Curse [Grappler]"] = "@Grappler/Medal Curse [Grappler]/Check",
    ["Altar of Purgatory [Grappler]"] = "@Grappler/Altar of Purgatory [Grappler]/Check",
    ["Reach Level 13 [Grappler]"] = "@Grappler/Reach Level 13 [Grappler]/Check",
    ["Overtuned [Grappler]"] = "@Grappler/Overtuned [Grappler]/Check",
    ["Disable Jump Pad [Grappler]"] = "@Grappler/Disable Jump Pad [Grappler]/Check",
    ["Grapple Point Combo [Grappler]"] = "@Grappler/Grapple Point Combo [Grappler]/Check",
    ["Seamine Grappler [Grappler]"] = "@Grappler/Seamine Grappler [Grappler]/Check",
    ["Take Flesh And Operator [Grappler]"] = "@Grappler/Take Flesh And Operator [Grappler]/Check",
    ["Abilityless Level (Level 3+) [Grappler]"] = "@Grappler/Abilityless Level (Level 3+) [Grappler]/Check",
    ["Reach Level 5 [Prisoner]"] = "@Prisoner/Reach Level 5 [Prisoner]/Check",
    ["All Gold Gifts [Prisoner]"] = "@Prisoner/All Gold Gifts [Prisoner]/Check",
    ["Escape After Complete Destruction (Level 3+) [Prisoner]"] = "@Prisoner/Escape After Complete Destruction (Level 3+) [Prisoner]/Check",
    ["Take Baby [Prisoner]"] = "@Prisoner/Take Baby [Prisoner]/Check",
    ["Encounter Flesh [Prisoner]"] = "@Prisoner/Encounter Flesh [Prisoner]/Check",
    ["Take Husk [Prisoner]"] = "@Prisoner/Take Husk [Prisoner]/Check",
    ["Encounter Telefragger [Prisoner]"] = "@Prisoner/Encounter Telefragger [Prisoner]/Check",
    ["Medal Curse [Prisoner]"] = "@Prisoner/Medal Curse [Prisoner]/Check",
    ["Altar of Purgatory [Prisoner]"] = "@Prisoner/Altar of Purgatory [Prisoner]/Check",
    ["Overtuned [Prisoner]"] = "@Prisoner/Overtuned [Prisoner]/Check",
    ["Take Useless Upgrade [Prisoner]"] = "@Prisoner/Take Useless Upgrade [Prisoner]/Check",
    ["Take Bell And Springer [Prisoner]"] = "@Prisoner/Take Bell And Springer [Prisoner]/Check",
    ["Use Jump Pad [Prisoner]"] = "@Prisoner/Use Jump Pad [Prisoner]/Check",
    ["Use Altar [Prisoner]"] = "@Prisoner/Use Altar [Prisoner]/Check",
    ["Reach Level 5 [Spirit]"] = "@Spirit/Reach Level 5 [Spirit]/Check",
    ["All Gold Gifts [Spirit]"] = "@Spirit/All Gold Gifts [Spirit]/Check",
    ["Escape After Complete Destruction (Level 3+) [Spirit]"] = "@Spirit/Escape After Complete Destruction (Level 3+) [Spirit]/Check",
    ["Take Baby [Spirit]"] = "@Spirit/Take Baby [Spirit]/Check",
    ["Encounter Flesh [Spirit]"] = "@Spirit/Encounter Flesh [Spirit]/Check",
    ["Take Husk [Spirit]"] = "@Spirit/Take Husk [Spirit]/Check",
    ["Encounter Telefragger [Spirit]"] = "@Spirit/Encounter Telefragger [Spirit]/Check",
    ["Medal Curse [Spirit]"] = "@Spirit/Medal Curse [Spirit]/Check",
    ["Altar of Purgatory [Spirit]"] = "@Spirit/Altar of Purgatory [Spirit]/Check",
    ["Reach Level 13 [Spirit]"] = "@Spirit/Reach Level 13 [Spirit]/Check",
    ["Overtuned [Spirit]"] = "@Spirit/Overtuned [Spirit]/Check",
    ["Take Mart And Springer [Spirit]"] = "@Spirit/Take Mart And Springer [Spirit]/Check",
    ["Clear A Gold Tile With A Single Fling [Spirit]"] = "@Spirit/Clear A Gold Tile With A Single Fling [Spirit]/Check",
    ["Above The Beacon's Clouds [Spirit]"] = "@Spirit/Above The Beacon's Clouds [Spirit]/Check",
    ["Chance Curse [Spirit]"] = "@Spirit/Chance Curse [Spirit]/Check",
    ["Abilityless Level (Level 3+) [Spirit]"] = "@Spirit/Abilityless Level (Level 3+) [Spirit]/Check",
    ["Reach Level 5 [Wanted]"] = "@Wanted/Reach Level 5 [Wanted]/Check",
    ["All Gold Gifts [Wanted]"] = "@Wanted/All Gold Gifts [Wanted]/Check",
    ["Escape After Complete Destruction (Level 3+) [Wanted]"] = "@Wanted/Escape After Complete Destruction (Level 3+) [Wanted]/Check",
    ["Take Baby [Wanted]"] = "@Wanted/Take Baby [Wanted]/Check",
    ["Encounter Flesh [Wanted]"] = "@Wanted/Encounter Flesh [Wanted]/Check",
    ["Take Husk [Wanted]"] = "@Wanted/Take Husk [Wanted]/Check",
    ["Encounter Telefragger [Wanted]"] = "@Wanted/Encounter Telefragger [Wanted]/Check",
    ["Medal Curse [Wanted]"] = "@Wanted/Medal Curse [Wanted]/Check",
    ["Altar of Purgatory [Wanted]"] = "@Wanted/Altar of Purgatory [Wanted]/Check",
    ["Reach Level 13 [Wanted]"] = "@Wanted/Reach Level 13 [Wanted]/Check",
    ["Overtuned [Wanted]"] = "@Wanted/Overtuned [Wanted]/Check",
    ["Take Husk And ICBM [Wanted]"] = "@Wanted/Take Husk And ICBM [Wanted]/Check",
    ["2 Medal Curses [Wanted]"] = "@Wanted/2 Medal Curses [Wanted]/Check",
    ["Survive Kolóna Encounter [Wanted]"] = "@Wanted/Survive Kolóna Encounter [Wanted]/Check",
    ["Bounce Tourist [Wanted]"] = "@Wanted/Bounce Tourist [Wanted]/Check",

    -- CurSanity
    ["Lower Gravity"] = "@CurSanity/Lower Gravity/Check",
    ["Random Spawn"] = "@CurSanity/Random Spawn/Check",
    ["Scattered Gifts"] = "@CurSanity/Scattered Gifts/Check",
    ["Weaker Jump Pads"] = "@CurSanity/Weaker Jump Pads/Check",
    ["Bigger Tripmines"] = "@CurSanity/Bigger Tripmines/Check",
    ["More Tripmines"] = "@CurSanity/More Tripmines/Check",
    ["High Roller"] = "@CurSanity/High Roller/Check",
    ["Fake Count"] = "@CurSanity/Fake Count/Check",
    ["LAP 2"] = "@CurSanity/LAP 2/Check",
    ["Fragile Gifts"] = "@CurSanity/Fragile Gifts/Check",
    ["Jackpot"] = "@CurSanity/Jackpot/Check",
    ["Nothing?"] = "@CurSanity/Nothing?/Check",
    ["Barotrauma"] = "@CurSanity/Barotrauma/Check",
    ["Minefield"] = "@CurSanity/Minefield/Check",
    ["Savory Ring"] = "@CurSanity/Savory Ring/Check",
    ["Beacon Mirage"] = "@CurSanity/Beacon Mirage/Check",
    ["Tweaked Odds"] = "@CurSanity/Tweaked Odds/Check",
    ["More Ringing"] = "@CurSanity/More Ringing/Check",
    ["Mighty Gong"] = "@CurSanity/Mighty Gong/Check",
    ["Concussion"] = "@CurSanity/Concussion/Check",
    ["Bigger Marts"] = "@CurSanity/Bigger Marts/Check",
    ["Mart Infection"] = "@CurSanity/Mart Infection/Check",
    ["Mart Slide"] = "@CurSanity/Mart Slide/Check",
    ["Pacifier"] = "@CurSanity/Pacifier/Check",
    ["Problem Child"] = "@CurSanity/Problem Child/Check",
    ["Scorched Earth"] = "@CurSanity/Scorched Earth/Check",
    ["Bigger Blast"] = "@CurSanity/Bigger Blast/Check",
    ["Closer Husk"] = "@CurSanity/Closer Husk/Check",
    ["Further Husk"] = "@CurSanity/Further Husk/Check",
    ["Taller Husk"] = "@CurSanity/Taller Husk/Check",
    ["Husk Express"] = "@CurSanity/Husk Express/Check",
    ["Conga Line [Curse]"] = "@CurSanity/Conga Line [Curse]/Check",
    ["Random Husk"] = "@CurSanity/Random Husk/Check",
    ["Resonating Shockwaves"] = "@CurSanity/Resonating Shockwaves/Check",
    ["Springloaded"] = "@CurSanity/Springloaded/Check",
    ["Bloodier Meat"] = "@CurSanity/Bloodier Meat/Check",
    ["Blighted Jump Pads"] = "@CurSanity/Blighted Jump Pads/Check",
    ["Camouflage"] = "@CurSanity/Camouflage/Check",
    ["Shotgun"] = "@CurSanity/Shotgun/Check",
    ["Ambush"] = "@CurSanity/Ambush/Check",
    ["Accurate Telefragger"] = "@CurSanity/Accurate Telefragger/Check",
    ["Lost Embers"] = "@CurSanity/Lost Embers/Check",
    ["Burning Bouquet"] = "@CurSanity/Burning Bouquet/Check",
    ["Blade Carousel"] = "@CurSanity/Blade Carousel/Check",
    ["Deadly Melody"] = "@CurSanity/Deadly Melody/Check",

    -- OSTsanity
    ["Nullscape"] = "@OSTsanity/Nullscape/Check",
    ["Void Explorer"] = "@OSTsanity/Void Explorer/Check",
    ["Mart"] = "@OSTsanity/Mart/Check",
    ["Paradox Trip"] = "@OSTsanity/Paradox Trip/Check",
    ["Seems you got Telefragged"] = "@OSTsanity/Seems you got Telefragged/Check",
    ["Baby Face"] = "@OSTsanity/Baby Face/Check",
    ["Intermission - 1"] = "@OSTsanity/Intermission - 1/Check",
    ["Intermission - 2"] = "@OSTsanity/Intermission - 2/Check",
    ["Intermission - 3"] = "@OSTsanity/Intermission - 3/Check",
    ["Intermission - 4"] = "@OSTsanity/Intermission - 4/Check",
    ["Intermission - 5"] = "@OSTsanity/Intermission - 5/Check",
    ["Intermission - 6"] = "@OSTsanity/Intermission - 6/Check",
    ["Line of Fire"] = "@OSTsanity/Line of Fire/Check",
    ["Congratulations, you beat the Tutorial"] = "@OSTsanity/Congratulations, you beat the Tutorial/Check",
    ["Fear of Shadow"] = "@OSTsanity/Fear of Shadow/Check",
    ["Fear Before Failure - 1"] = "@OSTsanity/Fear Before Failure - 1/Check",
    ["Fear Before Failure - 2"] = "@OSTsanity/Fear Before Failure - 2/Check",
    ["Fear Before Failure - 3"] = "@OSTsanity/Fear Before Failure - 3/Check",
    ["Inescapable"] = "@OSTsanity/Inescapable/Check",
    ["Conviction"] = "@OSTsanity/Conviction/Check",
    ["Determination"] = "@OSTsanity/Determination/Check",
    ["THIS WORLD WILL COLLAPSE"] = "@OSTsanity/THIS WORLD WILL COLLAPSE/Check",
    ["Your New Prison"] = "@OSTsanity/Your New Prison/Check",
    ["Kenophobia"] = "@OSTsanity/Kenophobia/Check",
    ["Dimension"] = "@OSTsanity/Dimension/Check",
    ["A Delightful New Death"] = "@OSTsanity/A Delightful New Death/Check",
    ["Conga Line [OST]"] = "@OSTsanity/Conga Line [OST]/Check",
    ["Death Defiance"] = "@OSTsanity/Death Defiance/Check",
    ["Former Gardens"] = "@OSTsanity/Former Gardens/Check",
    ["Unforeseen Unforgiving - 1"] = "@OSTsanity/Unforeseen Unforgiving - 1/Check",
    ["Unforeseen Unforgiving - 2"] = "@OSTsanity/Unforeseen Unforgiving - 2/Check",
    ["Void Breaker"] = "@OSTsanity/Void Breaker/Check",
    ["IMPERIAL ENIGMA"] = "@OSTsanity/IMPERIAL ENIGMA/Check",
    ["Temporal Tenacity"] = "@OSTsanity/Temporal Tenacity/Check",
    ["Choir of the Bells - 1"] = "@OSTsanity/Choir of the Bells - 1/Check",
    ["Choir of the Bells - 2"] = "@OSTsanity/Choir of the Bells - 2/Check",
    ["DECAY (TRUE)"] = "@OSTsanity/DECAY (TRUE)/Check",
    ["FIND YOUR FLAME"] = "@OSTsanity/FIND YOUR FLAME/Check",
    ["Subspace Sequence"] = "@OSTsanity/Subspace Sequence/Check",
    ["Voidbound"] = "@OSTsanity/Voidbound/Check",
    ["Checkmate"] = "@OSTsanity/Checkmate/Check",
    ["Domasp's Gift"] = "@OSTsanity/Domasp's Gift/Check",
    ["Inter-Continental Ballistic Missile"] = "@OSTsanity/Inter-Continental Ballistic Missile/Check",
    ["Self Destruct"] = "@OSTsanity/Self Destruct/Check",
    ["Disruption and Dissonance"] = "@OSTsanity/Disruption and Dissonance/Check",
    ["Vein Blood"] = "@OSTsanity/Vein Blood/Check",
    ["Monolith"] = "@OSTsanity/Monolith/Check",
    ["Cognition"] = "@OSTsanity/Cognition/Check",
    ["Aerodynamics"] = "@OSTsanity/Aerodynamics/Check",
    ["Won't you hear my Symphony?"] = "@OSTsanity/Won't you hear my Symphony?/Check",
    ["Event Horizon"] = "@OSTsanity/Event Horizon/Check",
    ["nil"] = "@OSTsanity/nil/Check",
    ["INSURMOUNTABLE ABYSS"] = "@OSTsanity/INSURMOUNTABLE ABYSS/Check",
    ["IT DOESN'T END HERE"] = "@OSTsanity/IT DOESN'T END HERE/Check",
}

-- Reverse lookup used when a PopTracker location is manually checked.
local LOCATION_NAME_BY_PATH = {}
for locationName, path in pairs(LOCATIONS_BY_NAME) do
    LOCATION_NAME_BY_PATH[path] = locationName
end

local AP_GAME_NAME = "Manual_NullscapeROBLOX_sucrosesnowstorm"
local LOCATION_IDS_BY_PATH = {}
local MISSING_LOCATION_IDS = {}
local APPLYING_SERVER_CHECK = false

local function rebuildLocationIdCache()
    LOCATION_IDS_BY_PATH = {}
    MISSING_LOCATION_IDS = {}

    if not Archipelago then return end

    local function remember(id, isMissing)
        local name = Archipelago:GetLocationName(id, AP_GAME_NAME)
        local path = name and LOCATIONS_BY_NAME[name] or nil
        if path then
            LOCATION_IDS_BY_PATH[path] = id
            if isMissing then
                MISSING_LOCATION_IDS[id] = true
            end
        end
    end

    if Archipelago.MissingLocations then
        for _, id in ipairs(Archipelago.MissingLocations) do
            remember(id, true)
        end
    end

    if Archipelago.CheckedLocations then
        for _, id in ipairs(Archipelago.CheckedLocations) do
            remember(id, false)
        end
    end
end

local function resetState()
    for _, info in pairs(ITEMS_BY_NAME) do
        local obj = Tracker:FindObjectForCode(info.code)
        if obj then
            if info.consumable then
                obj.AcquiredCount = 0
            else
                obj.Active = false
            end
        end
    end
    for _, path in pairs(LOCATIONS_BY_NAME) do
        local section = Tracker:FindObjectForCode(path)
        if section then
            section.AvailableChestCount = section.ChestCount
        end
    end
end

-- NOTE: the exact global name for this API ("Archipelago") is taken from
-- PopTracker's doc/AUTOTRACKING.md description of the Archipelago Lua
-- class. If autotracking doesn't activate, check PopTracker's console/log
-- for a Lua error naming a different global -- that's the first thing to
-- fix if this needs adjusting for your PopTracker version.
if Archipelago then
    Archipelago:AddClearHandler("nullscape_clear", function(slot_data)
        resetState()
        rebuildLocationIdCache()
    end)

    Archipelago:AddItemHandler("nullscape_items", function(index, item_id, item_name, player_number)
        local info = ITEMS_BY_NAME[item_name]
        if not info then return end
        local obj = Tracker:FindObjectForCode(info.code)
        if not obj then return end
        if info.consumable then
            obj.AcquiredCount = obj.AcquiredCount + 1
        else
            obj.Active = true
        end
    end)

    Archipelago:AddLocationHandler("nullscape_locations", function(location_id, location_name)
        local path = LOCATIONS_BY_NAME[location_name]
        if not path then return end

        LOCATION_IDS_BY_PATH[path] = location_id
        MISSING_LOCATION_IDS[location_id] = nil

        local section = Tracker:FindObjectForCode(path)
        if section then
            APPLYING_SERVER_CHECK = true
            section.AvailableChestCount = 0
            APPLYING_SERVER_CHECK = false
        end
    end)
end

-- With the "apmanual" manifest flag, clicking a PopTracker check can send
-- that Manual location to the Archipelago server.
ScriptHost:AddOnLocationSectionChangedHandler("nullscape_manual_ap_checks", function(section)
    if APPLYING_SERVER_CHECK then return end
    if not Archipelago or Archipelago.PlayerNumber == nil or Archipelago.PlayerNumber < 0 then return end
    if section.AvailableChestCount > 0 then return end

    local path = "@" .. section.FullID
    local locationName = LOCATION_NAME_BY_PATH[path]
    if not locationName then return end

    local locationId = LOCATION_IDS_BY_PATH[path]
    if not locationId then
        rebuildLocationIdCache()
        locationId = LOCATION_IDS_BY_PATH[path]
    end

    -- Only send locations the server still says are missing.
    if locationId and MISSING_LOCATION_IDS[locationId] then
        Archipelago:LocationChecks({ locationId })
        MISSING_LOCATION_IDS[locationId] = nil
    end
end)
