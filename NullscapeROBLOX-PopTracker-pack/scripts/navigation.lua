local NAV_BUTTONS = {}

do
    local li = ScriptHost:CreateLuaItem()
    li.Name = "Charger Class Overview"
    li.Icon = ImageReference:FromPackRelativePath("images/classes/Charger.png")
    li.CanProvideCodeFunc = function(item, code) return code == "nav_charger" end
    li.ProvidesCodeFunc = function(item, code) return 0 end
    li.OnLeftClickFunc = function(item)
        Tracker:UiHint("ActivateTab", "Charger")
    end
    NAV_BUTTONS[#NAV_BUTTONS + 1] = {
        item = li,
        sections = { "@Charger/Reach Level 5 [Charger]/Check", "@Charger/All Gold Gifts [Charger]/Check", "@Charger/Escape After Complete Destruction (Level 3+) [Charger]/Check", "@Charger/Take Baby [Charger]/Check", "@Charger/Encounter Flesh [Charger]/Check", "@Charger/Take Husk [Charger]/Check", "@Charger/Encounter Telefragger [Charger]/Check", "@Charger/Medal Curse [Charger]/Check", "@Charger/Altar of Purgatory [Charger]/Check", "@Charger/Reach Level 13 [Charger]/Check", "@Charger/Overtuned [Charger]/Check", "@Charger/Detonate 5 Tripmines In A Level [Charger]/Check", "@Charger/ICBM Curse [Charger]/Check", "@Charger/Drop Bounce On Grapple Point [Charger]/Check", "@Charger/Ride Grindrail [Charger]/Check", "@Charger/Abilityless Level (Level 3+) [Charger]/Check" },
        root_code = "roots_in_persistence",
        class_code = "charger_class",
        base_img = "images/classes/Charger.png",
        rooted_img = "images/classes/ChargerRooted.png",
    }
end

do
    local li = ScriptHost:CreateLuaItem()
    li.Name = "Diver Class Overview"
    li.Icon = ImageReference:FromPackRelativePath("images/classes/Diver.png")
    li.CanProvideCodeFunc = function(item, code) return code == "nav_diver" end
    li.ProvidesCodeFunc = function(item, code) return 0 end
    li.OnLeftClickFunc = function(item)
        Tracker:UiHint("ActivateTab", "Diver")
    end
    NAV_BUTTONS[#NAV_BUTTONS + 1] = {
        item = li,
        sections = { "@Diver/Reach Level 5 [Diver]/Check", "@Diver/All Gold Gifts [Diver]/Check", "@Diver/Escape After Complete Destruction (Level 3+) [Diver]/Check", "@Diver/Take Baby [Diver]/Check", "@Diver/Encounter Flesh [Diver]/Check", "@Diver/Take Husk [Diver]/Check", "@Diver/Encounter Telefragger [Diver]/Check", "@Diver/Medal Curse [Diver]/Check", "@Diver/Altar of Purgatory [Diver]/Check", "@Diver/Reach Level 13 [Diver]/Check", "@Diver/Overtuned [Diver]/Check", "@Diver/Dive Into Bell [Diver]/Check", "@Diver/Survive A Ninja Belt Bonk [Diver]/Check", "@Diver/Telefragger Curse [Diver]/Check", "@Diver/Dive Into Grapple Point [Diver]/Check", "@Diver/Abilityless Level (Level 3+) [Diver]/Check" },
        root_code = "roots_in_versatility",
        class_code = "diver_class",
        base_img = "images/classes/Diver.png",
        rooted_img = "images/classes/DiverRooted.png",
    }
end

do
    local li = ScriptHost:CreateLuaItem()
    li.Name = "Glider Class Overview"
    li.Icon = ImageReference:FromPackRelativePath("images/classes/Glider.png")
    li.CanProvideCodeFunc = function(item, code) return code == "nav_glider" end
    li.ProvidesCodeFunc = function(item, code) return 0 end
    li.OnLeftClickFunc = function(item)
        Tracker:UiHint("ActivateTab", "Glider")
    end
    NAV_BUTTONS[#NAV_BUTTONS + 1] = {
        item = li,
        sections = { "@Glider/Reach Level 5 [Glider]/Check", "@Glider/All Gold Gifts [Glider]/Check", "@Glider/Escape After Complete Destruction (Level 3+) [Glider]/Check", "@Glider/Take Baby [Glider]/Check", "@Glider/Encounter Flesh [Glider]/Check", "@Glider/Take Husk [Glider]/Check", "@Glider/Encounter Telefragger [Glider]/Check", "@Glider/Medal Curse [Glider]/Check", "@Glider/Altar of Purgatory [Glider]/Check", "@Glider/Reach Level 13 [Glider]/Check", "@Glider/Overtuned [Glider]/Check", "@Glider/Flesh Curse [Glider]/Check", "@Glider/Survive A Bonk [Glider]/Check", "@Glider/Glide Into A Grapple Point [Glider]/Check", "@Glider/Survive Seamine Detonation [Glider]/Check", "@Glider/Abilityless Level (Level 3+) [Glider]/Check" },
        root_code = "roots_in_bravery",
        class_code = "glider_class",
        base_img = "images/classes/Glider.png",
        rooted_img = "images/classes/GliderRooted.png",
    }
end

do
    local li = ScriptHost:CreateLuaItem()
    li.Name = "Grappler Class Overview"
    li.Icon = ImageReference:FromPackRelativePath("images/classes/Grappler.png")
    li.CanProvideCodeFunc = function(item, code) return code == "nav_grappler" end
    li.ProvidesCodeFunc = function(item, code) return 0 end
    li.OnLeftClickFunc = function(item)
        Tracker:UiHint("ActivateTab", "Grappler")
    end
    NAV_BUTTONS[#NAV_BUTTONS + 1] = {
        item = li,
        sections = { "@Grappler/Reach Level 5 [Grappler]/Check", "@Grappler/All Gold Gifts [Grappler]/Check", "@Grappler/Escape After Complete Destruction (Level 3+) [Grappler]/Check", "@Grappler/Take Baby [Grappler]/Check", "@Grappler/Encounter Flesh [Grappler]/Check", "@Grappler/Take Husk [Grappler]/Check", "@Grappler/Encounter Telefragger [Grappler]/Check", "@Grappler/Medal Curse [Grappler]/Check", "@Grappler/Altar of Purgatory [Grappler]/Check", "@Grappler/Reach Level 13 [Grappler]/Check", "@Grappler/Overtuned [Grappler]/Check", "@Grappler/Disable Jump Pad [Grappler]/Check", "@Grappler/Grapple Point Combo [Grappler]/Check", "@Grappler/Seamine Grappler [Grappler]/Check", "@Grappler/Take Flesh And Operator [Grappler]/Check", "@Grappler/Abilityless Level (Level 3+) [Grappler]/Check" },
        root_code = "roots_in_trust",
        class_code = "grappler_class",
        base_img = "images/classes/Grappler.png",
        rooted_img = "images/classes/GrapplerRooted.png",
    }
end

do
    local li = ScriptHost:CreateLuaItem()
    li.Name = "Prisoner Class Overview"
    li.Icon = ImageReference:FromPackRelativePath("images/classes/Prisoner.png")
    li.CanProvideCodeFunc = function(item, code) return code == "nav_prisoner" end
    li.ProvidesCodeFunc = function(item, code) return 0 end
    li.OnLeftClickFunc = function(item)
        Tracker:UiHint("ActivateTab", "Prisoner")
    end
    NAV_BUTTONS[#NAV_BUTTONS + 1] = {
        item = li,
        sections = { "@Prisoner/Reach Level 5 [Prisoner]/Check", "@Prisoner/All Gold Gifts [Prisoner]/Check", "@Prisoner/Escape After Complete Destruction (Level 3+) [Prisoner]/Check", "@Prisoner/Take Baby [Prisoner]/Check", "@Prisoner/Encounter Flesh [Prisoner]/Check", "@Prisoner/Take Husk [Prisoner]/Check", "@Prisoner/Encounter Telefragger [Prisoner]/Check", "@Prisoner/Medal Curse [Prisoner]/Check", "@Prisoner/Altar of Purgatory [Prisoner]/Check", "@Prisoner/Overtuned [Prisoner]/Check", "@Prisoner/Take Useless Upgrade [Prisoner]/Check", "@Prisoner/Take Bell And Springer [Prisoner]/Check", "@Prisoner/Use Jump Pad [Prisoner]/Check", "@Prisoner/Use Altar [Prisoner]/Check" },
        root_code = "roots_in_defiance",
        class_code = "prisoner_class",
        base_img = "images/classes/Prisoner.png",
        rooted_img = "images/classes/PrisonerRooted.png",
    }
end

do
    local li = ScriptHost:CreateLuaItem()
    li.Name = "Spirit Class Overview"
    li.Icon = ImageReference:FromPackRelativePath("images/classes/Spirit.png")
    li.CanProvideCodeFunc = function(item, code) return code == "nav_spirit" end
    li.ProvidesCodeFunc = function(item, code) return 0 end
    li.OnLeftClickFunc = function(item)
        Tracker:UiHint("ActivateTab", "Spirit")
    end
    NAV_BUTTONS[#NAV_BUTTONS + 1] = {
        item = li,
        sections = { "@Spirit/Reach Level 5 [Spirit]/Check", "@Spirit/All Gold Gifts [Spirit]/Check", "@Spirit/Escape After Complete Destruction (Level 3+) [Spirit]/Check", "@Spirit/Take Baby [Spirit]/Check", "@Spirit/Encounter Flesh [Spirit]/Check", "@Spirit/Take Husk [Spirit]/Check", "@Spirit/Encounter Telefragger [Spirit]/Check", "@Spirit/Medal Curse [Spirit]/Check", "@Spirit/Altar of Purgatory [Spirit]/Check", "@Spirit/Reach Level 13 [Spirit]/Check", "@Spirit/Overtuned [Spirit]/Check", "@Spirit/Take Mart And Springer [Spirit]/Check", "@Spirit/Clear A Gold Tile With A Single Fling [Spirit]/Check", "@Spirit/Above The Beacon's Clouds [Spirit]/Check", "@Spirit/Chance Curse [Spirit]/Check", "@Spirit/Abilityless Level (Level 3+) [Spirit]/Check" },
        root_code = "roots_in_self_awareness",
        class_code = "spirit_class",
        base_img = "images/classes/Spirit.png",
        rooted_img = "images/classes/SpiritRooted.png",
    }
end

do
    local li = ScriptHost:CreateLuaItem()
    li.Name = "Wanted Class Overview"
    li.Icon = ImageReference:FromPackRelativePath("images/classes/Wanted.png")
    li.CanProvideCodeFunc = function(item, code) return code == "nav_wanted" end
    li.ProvidesCodeFunc = function(item, code) return 0 end
    li.OnLeftClickFunc = function(item)
        Tracker:UiHint("ActivateTab", "Wanted")
    end
    NAV_BUTTONS[#NAV_BUTTONS + 1] = {
        item = li,
        sections = { "@Wanted/Reach Level 5 [Wanted]/Check", "@Wanted/All Gold Gifts [Wanted]/Check", "@Wanted/Escape After Complete Destruction (Level 3+) [Wanted]/Check", "@Wanted/Take Baby [Wanted]/Check", "@Wanted/Encounter Flesh [Wanted]/Check", "@Wanted/Take Husk [Wanted]/Check", "@Wanted/Encounter Telefragger [Wanted]/Check", "@Wanted/Medal Curse [Wanted]/Check", "@Wanted/Altar of Purgatory [Wanted]/Check", "@Wanted/Reach Level 13 [Wanted]/Check", "@Wanted/Overtuned [Wanted]/Check", "@Wanted/Take Husk And ICBM [Wanted]/Check", "@Wanted/2 Medal Curses [Wanted]/Check", "@Wanted/Survive Kolóna Encounter [Wanted]/Check", "@Wanted/Bounce Tourist [Wanted]/Check" },
        root_code = "roots_in_certainty",
        class_code = "wanted_class",
        base_img = "images/classes/Wanted.png",
        rooted_img = "images/classes/WantedRooted.png",
    }
end


local function refreshNavBadges()
    for _, nav in ipairs(NAV_BUTTONS) do
        local inLogic = 0
        for _, path in ipairs(nav.sections) do
            local section = Tracker:FindObjectForCode(path)
            if section
                and section.AvailableChestCount > 0
                and section.AccessibilityLevel == AccessibilityLevel.Normal then
                inLogic = inLogic + section.AvailableChestCount
            end
        end
        nav.item:SetOverlay(tostring(inLogic))
    end
end

-- Swap both the nav button icon and the big class-tab icon to the "rooted"
-- variant only once BOTH the class item and that class's ROOTS item are obtained.
local function refreshRootedIcon(nav)
    local hasRoot = Tracker:ProviderCountForCode(nav.root_code) > 0
    local hasClass = Tracker:ProviderCountForCode(nav.class_code) > 0
    local rooted = hasRoot and hasClass
    local img = rooted and nav.rooted_img or nav.base_img
    local mods = hasClass and "" or "@disabled"

    -- The Lua nav buttons do not automatically grey themselves out based on
    -- the class toggle, so explicitly apply the disabled image filter.
    nav.item.Icon = ImageReference:FromPackRelativePath(img)
    nav.item.IconMods = mods

end

refreshNavBadges()
ScriptHost:AddOnLocationSectionChangedHandler("nav_badges", function(section)
    refreshNavBadges()
end)

-- Logic can change when any item changes, even if no location itself was clicked.
ScriptHost:AddWatchForCode("nav_badges_logic", "*", function(code)
    refreshNavBadges()
end)

for _, nav in ipairs(NAV_BUTTONS) do
    refreshRootedIcon(nav)  -- set correct initial state on load
    ScriptHost:AddWatchForCode("rooted_icon_" .. nav.root_code, nav.root_code, function(code)
        refreshRootedIcon(nav)
    end)
    ScriptHost:AddWatchForCode("rooted_icon_" .. nav.class_code, nav.class_code, function(code)
        refreshRootedIcon(nav)
    end)
end
