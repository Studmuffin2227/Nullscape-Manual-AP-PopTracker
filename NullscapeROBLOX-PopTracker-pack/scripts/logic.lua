-- Custom logic functions, mirroring this apworld's hooks/Rules.py
-- Rules starting with '$' in access_rules call these by name.

-- blossomFragmentReq(): has the player collected enough FRAGMENT OF BLOSSOM,
-- per the "blossom fragments required" option? Since this pack has no way to
-- read the live slot option automatically, use the 'opt_blossom_required'
-- tracker item (editable by right/left-clicking it, defaults to 20 -- the
-- apworld default). Set it to match your seed's option before tracking.
function blossomFragmentReq()
    local required = Tracker:FindObjectForCode("opt_blossom_required").AcquiredCount
    local have = Tracker.ProviderCountForCode and Tracker:ProviderCountForCode("fragment_of_blossom") or 0
    return have >= required
end

-- rootsReq(): if 'randomize roots' option is off, roots aren't needed at all.
-- Otherwise, the player needs any one Class + its matching Root item.
function rootsReq()
    local randomize = Tracker:FindObjectForCode("opt_randomize_roots").Active
    if not randomize then
        return true
    end

    local pairs_ = {
        {"diver_class", "roots_in_versatility"},
        {"charger_class", "roots_in_persistence"},
        {"grappler_class", "roots_in_trust"},
        {"spirit_class", "roots_in_self_awareness"},
        {"glider_class", "roots_in_bravery"},
        {"wanted_class", "roots_in_defiance"},
        {"prisoner_class", "roots_in_certainty"},
    }

    for _, p in ipairs(pairs_) do
        local class_code, root_code = p[1], p[2]
        if Tracker:ProviderCountForCode(class_code) > 0 and Tracker:ProviderCountForCode(root_code) > 0 then
            return true
        end
    end
    return false
end

-- goalIsLevel(n): true if the 'opt_goal' setting (Reach Level 10/15/20) is
-- currently set to Ungate Level n. Used as a visibility_rule so only the
-- Bloom check matching your seed's actual goal option is shown.
function goalIsLevel(n)
    local obj = Tracker:FindObjectForCode("opt_goal")
    if not obj then
        return true
    end
    return obj.CurrentStage == (tonumber(n) - 1)
end
