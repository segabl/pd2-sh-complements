local weapon_falloff_templates = {}

-- Rifles
weapon_falloff_templates.ASSAULT_FALL_LOW = {
	optimal_distance = 0,
	optimal_range = 3000,
	near_falloff = 0,
	far_falloff = 0,
	near_multiplier = 1,
	far_multiplier = 1
}
weapon_falloff_templates.ASSAULT_FALL_MEDIUM = weapon_falloff_templates.ASSAULT_FALL_LOW
weapon_falloff_templates.ASSAULT_FALL_HIGH = weapon_falloff_templates.ASSAULT_FALL_LOW

-- Shotguns
weapon_falloff_templates.SHOTGUN_FALL_PRIMARY_LOW = {
	optimal_distance = 600,
	optimal_range = 400,
	near_falloff = 0,
	far_falloff = 1000,
	near_multiplier = 1,
	far_multiplier = 0.3
}
weapon_falloff_templates.SHOTGUN_FALL_PRIMARY_MEDIUM = {
	optimal_distance = 700,
	optimal_range = 500,
	near_falloff = 0,
	far_falloff = 1200,
	near_multiplier = 1,
	far_multiplier = 0.4
}
weapon_falloff_templates.SHOTGUN_FALL_PRIMARY_HIGH = {
	optimal_distance = 800,
	optimal_range = 600,
	near_falloff = 0,
	far_falloff = 1400,
	near_multiplier = 1,
	far_multiplier = 0.5
}

weapon_falloff_templates.SHOTGUN_FALL_SECONDARY_LOW = weapon_falloff_templates.SHOTGUN_FALL_PRIMARY_LOW
weapon_falloff_templates.SHOTGUN_FALL_SECONDARY_MEDIUM = weapon_falloff_templates.SHOTGUN_FALL_PRIMARY_MEDIUM
weapon_falloff_templates.SHOTGUN_FALL_SECONDARY_HIGH = weapon_falloff_templates.SHOTGUN_FALL_PRIMARY_HIGH
weapon_falloff_templates.SHOTGUN_FALL_SECONDARY_VERYHIGH = weapon_falloff_templates.SHOTGUN_FALL_PRIMARY_HIGH

weapon_falloff_templates.AKI_SHOTGUN_FALL_LOW = weapon_falloff_templates.SHOTGUN_FALL_PRIMARY_LOW
weapon_falloff_templates.AKI_SHOTGUN_FALL_MEDIUM = weapon_falloff_templates.SHOTGUN_FALL_PRIMARY_MEDIUM
weapon_falloff_templates.AKI_SHOTGUN_FALL_HIGH = weapon_falloff_templates.SHOTGUN_FALL_PRIMARY_HIGH

-- Pistols
weapon_falloff_templates.PISTOL_FALL_LOW = {
	optimal_distance = 0,
	optimal_range = 1600,
	near_falloff = 0,
	far_falloff = 800,
	near_multiplier = 1,
	far_multiplier = 0.7
}
weapon_falloff_templates.PISTOL_FALL_MEDIUM = {
	optimal_distance = 0,
	optimal_range = 1800,
	near_falloff = 0,
	far_falloff = 900,
	near_multiplier = 1,
	far_multiplier = 0.8
}
weapon_falloff_templates.PISTOL_FALL_HIGH = {
	optimal_distance = 0,
	optimal_range = 2000,
	near_falloff = 0,
	far_falloff = 1000,
	near_multiplier = 1,
	far_multiplier = 0.9
}
weapon_falloff_templates.PISTOL_FALL_VERYHIGH = {
	optimal_distance = 0,
	optimal_range = 2000,
	near_falloff = 0,
	far_falloff = 0,
	near_multiplier = 1,
	far_multiplier = 1
}
weapon_falloff_templates.PISTOL_FALL_AUTO = weapon_falloff_templates.PISTOL_FALL_LOW
weapon_falloff_templates.PISTOL_FALL_SUPER = weapon_falloff_templates.PISTOL_FALL_VERYHIGH

weapon_falloff_templates.AKI_PISTOL_FALL_LOW = weapon_falloff_templates.PISTOL_FALL_LOW
weapon_falloff_templates.AKI_PISTOL_FALL_MEDIUM = weapon_falloff_templates.PISTOL_FALL_MEDIUM
weapon_falloff_templates.AKI_PISTOL_FALL_HIGH = weapon_falloff_templates.PISTOL_FALL_HIGH
weapon_falloff_templates.AKI_PISTOL_FALL_VERYHIGH = weapon_falloff_templates.PISTOL_FALL_VERYHIGH
weapon_falloff_templates.AKI_PISTOL_FALL_AUTO = weapon_falloff_templates.PISTOL_FALL_AUTO

-- SMGs
weapon_falloff_templates.SMG_FALL_LOW = {
	optimal_distance = 0,
	optimal_range = 1400,
	near_falloff = 0,
	far_falloff = 1000,
	near_multiplier = 1,
	far_multiplier = 0.6
}
weapon_falloff_templates.SMG_FALL_MEDIUM = {
	optimal_distance = 0,
	optimal_range = 1600,
	near_falloff = 0,
	far_falloff = 1100,
	near_multiplier = 1,
	far_multiplier = 0.7
}
weapon_falloff_templates.SMG_FALL_HIGH = {
	optimal_distance = 0,
	optimal_range = 1800,
	near_falloff = 0,
	far_falloff = 1200,
	near_multiplier = 1,
	far_multiplier = 0.8
}

weapon_falloff_templates.AKI_SMG_FALL_LOW = weapon_falloff_templates.SMG_FALL_LOW
weapon_falloff_templates.AKI_SMG_FALL_MEDIUM = weapon_falloff_templates.SMG_FALL_MEDIUM
weapon_falloff_templates.AKI_SMG_FALL_HIGH = weapon_falloff_templates.SMG_FALL_HIGH

-- Snipers
weapon_falloff_templates.SNIPER_FALL_LOW = {
	optimal_distance = 0,
	optimal_range = 2000,
	near_falloff = 0,
	far_falloff = 2000,
	near_multiplier = 1,
	far_multiplier = 1.1
}
weapon_falloff_templates.SNIPER_FALL_MEDIUM = {
	optimal_distance = 0,
	optimal_range = 2000,
	near_falloff = 0,
	far_falloff = 2000,
	near_multiplier = 1,
	far_multiplier = 1.3
}
weapon_falloff_templates.SNIPER_FALL_HIGH = {
	optimal_distance = 0,
	optimal_range = 2000,
	near_falloff = 0,
	far_falloff = 2000,
	near_multiplier = 1,
	far_multiplier = 1.5
}
weapon_falloff_templates.SNIPER_FALL_VERYHIGH = {
	optimal_distance = 0,
	optimal_range = 2000,
	near_falloff = 0,
	far_falloff = 2000,
	near_multiplier = 1,
	far_multiplier = 1.7
}

-- LMGs
weapon_falloff_templates.LMG_FALL_MEDIUM = {
	optimal_distance = 0,
	optimal_range = 1500,
	near_falloff = 0,
	far_falloff = 500,
	near_multiplier = 1,
	far_multiplier = 0.7
}
weapon_falloff_templates.LMG_FALL_HIGH = {
	optimal_distance = 0,
	optimal_range = 1800,
	near_falloff = 0,
	far_falloff = 800,
	near_multiplier = 1,
	far_multiplier = 0.8
}

-- Special
weapon_falloff_templates.SPECIAL_LOW = {
	optimal_distance = 0,
	optimal_range = 1500,
	near_falloff = 0,
	far_falloff = 1000,
	near_multiplier = 1,
	far_multiplier = 0.5
}

function WeaponFalloffTemplate.setup_weapon_falloff_templates()
	return weapon_falloff_templates
end
