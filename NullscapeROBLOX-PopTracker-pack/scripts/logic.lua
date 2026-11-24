-- Custom logic functions, mirroring the APWorld's hooks/Rules.py.
-- Access rules starting with '$' call these by name.
-- Option values live in the opt_* items (Open Pack Settings). They are
-- filled in from slot_data automatically when connected to Archipelago.

local function count(code)
    local obj = Tracker:FindObjectForCode(code)
    if not obj then return 0 end
    if obj.AcquiredCount ~= nil and obj.Type == "consumable" then return obj.AcquiredCount end
    return Tracker:ProviderCountForCode(code)
end

local function active(code, default)
    local obj = Tracker:FindObjectForCode(code)
    if not obj then return default end
    return obj.Active
end

function OptStage(code)
    local obj = Tracker:FindObjectForCode(code)
    if not obj then return 0 end
    return obj.CurrentStage or 0
end

function OptActive(code, default)
    return active(code, default)
end

-- blossomFragmentReq(): enough FRAGMENT OF BLOSSOM for the seed's requirement
function blossomFragmentReq()
    local required = count("opt_blossom_required")
    return count("fragment_of_blossom") >= required
end

-- rootsReq(): if Randomize ROOTS is off, ROOTS aren't needed.
-- Otherwise the player needs any one class + that class's ROOTS item.
local CLASS_ROOTS = {
    { "diver_class", "roots_in_versatility" },
    { "charger_class", "roots_in_persistence" },
    { "grappler_class", "roots_in_trust" },
    { "spirit_class", "roots_in_self_awareness" },
    { "glider_class", "roots_in_bravery" },
    { "wanted_class", "roots_in_defiance" },
    { "prisoner_class", "roots_in_certainty" },
}
function rootsReq()
    if not active("opt_randomize_roots", true) then
        return true
    end
    for _, p in ipairs(CLASS_ROOTS) do
        if Tracker:ProviderCountForCode(p[1]) > 0 and Tracker:ProviderCountForCode(p[2]) > 0 then
            return true
        end
    end
    return false
end

-- canFightCelestial(): each "Celestial Practice Requires ..." option adds a requirement
function canFightCelestial()
    if active("opt_prac_frags", false) and not blossomFragmentReq() then return false end
    if active("opt_prac_ungates", false) and Tracker:ProviderCountForCode("ungate_4") == 0 then return false end
    if active("opt_prac_roots", false) and not rootsReq() then return false end
    return true
end
