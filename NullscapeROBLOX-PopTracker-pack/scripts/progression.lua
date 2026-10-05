local PROGRESSIONS = {
    { seed = "seed_of_potential", upgrades = {
        { code = "upg_paycheck", name = "Paycheck", cap = 5 },
        { code = "upg_business_license", name = "Business License", cap = 2 },
        { code = "upg_medal", name = "Medal", cap = 0 },
        { code = "upg_fanny_pack", name = "Fanny Pack", cap = 0 },
        { code = "upg_gift_magnet", name = "Gift Magnet", cap = 3 },
        { code = "upg_gift_idol", name = "Gift Idol", cap = 5 },
    }},
    { seed = "seed_of_control", upgrades = {
        { code = "upg_adrenaline", name = "Adrenaline", cap = 0 },
        { code = "upg_swiftness_rings", name = "Swiftness Rings", cap = 3 },
        { code = "upg_double_jump", name = "Double Jump", cap = 0 },
        { code = "upg_grace_wings", name = "Grace Wings", cap = 0 },
        { code = "upg_pocket_bell", name = "Pocket Bell", cap = 0 },
        { code = "upg_ice_skates", name = "Ice Skates", cap = 0 },
        { code = "upg_advanced_gravity_coil", name = "Advanced Gravity Coil", cap = 0 },
        { code = "upg_sport_shoes", name = "Sport Shoes", cap = 0 },
        { code = "upg_matrix_tetrahedron", name = "Matrix Tetrahedron", cap = 0 },
    }},
    { seed = "seed_of_nullscape", upgrades = {
        { code = "upg_better_jump_pads", name = "Better Jump Pads", cap = 0 },
        { code = "upg_grapple_points", name = "Grapple Points", cap = 0 },
        { code = "upg_tria_orbs", name = "Tria Orbs", cap = 0 },
        { code = "upg_more_altars", name = "More Altars", cap = 0 },
        { code = "upg_larger_grapple_points", name = "Larger Grapple Points", cap = 0 },
    }},
    { seed = "seed_of_introspection", upgrades = {
        { code = "upg_helmet", name = "Helmet", cap = 0 },
        { code = "upg_ninja_belt", name = "Ninja Belt", cap = 0 },
        { code = "upg_shark_tail", name = "Shark Tail", cap = 0 },
        { code = "upg_miniature_hourglass", name = "Miniature Hourglass", cap = 0 },
    }},
    { seed = "seed_of_omnipotence", upgrades = {
        { code = "upg_radar", name = "Radar", cap = 0 },
        { code = "upg_radar_module_enemies", name = "Radar Module: Enemies", cap = 0 },
        { code = "upg_radar_module_tripmines", name = "Radar Module: Tripmines", cap = 0 },
        { code = "upg_radar_module_altars", name = "Radar Module: Altars", cap = 0 },
        { code = "upg_radar_module_instruments", name = "Radar Module: Instruments", cap = 0 },
    }},
    { seed = "seed_of_immortality", upgrades = {
        { code = "upg_defuse_kit", name = "Defuse Kit", cap = 3 },
        { code = "upg_last_robloxian_standing", name = "Last Robloxian Standing", cap = 0 },
        { code = "upg_subspacial_barrier", name = "Subspacial Barrier", cap = 2 },
        { code = "upg_shield", name = "Shield", cap = 0 },
        { code = "upg_panic_necklace", name = "Panic Necklace", cap = 0 },
        { code = "upg_drowned_aegis", name = "Drowned Aegis", cap = 0 },
    }},
}

local EXTRA_STACK_CODE = "extra_upgrade_stack"

local function refreshAll()
    local extraStacks = Tracker:ProviderCountForCode(EXTRA_STACK_CODE)
    for _, prog in ipairs(PROGRESSIONS) do
        local have = Tracker:ProviderCountForCode(prog.seed)
        for i, upgrade in ipairs(prog.upgrades) do
            local obj = Tracker:FindObjectForCode(upgrade.code)
            if obj then
                local unlocked = (i <= have)
                if upgrade.cap > 0 then
                    -- stackable: show current/max stacks once unlocked
                    if unlocked then
                        local stacks = 1 + extraStacks
                        if stacks > upgrade.cap then stacks = upgrade.cap end
                        obj.AcquiredCount = stacks
                    else
                        obj.AcquiredCount = 0
                    end
                else
                    obj.Active = unlocked
                end
            end
        end
    end
end

refreshAll()  -- set correct initial state on load

for _, prog in ipairs(PROGRESSIONS) do
    ScriptHost:AddWatchForCode("progress_" .. prog.seed, prog.seed, function(code)
        refreshAll()
    end)
end
ScriptHost:AddWatchForCode("progress_extra_stack", EXTRA_STACK_CODE, function(code)
    refreshAll()
end)
