Hooks:PostHook(WeaponFactoryTweakData, "create_ammunition", "shc_create_ammunition", function (self)

	-- Reduce buckshot/poison rays
	self.parts.wpn_fps_upg_a_custom.custom_stats.rays = 9
	self.parts.wpn_fps_upg_a_custom_free.custom_stats.rays = 9
	self.parts.wpn_fps_upg_a_rip.custom_stats.rays = 9

	-- Increase AP slug accuracy
	self.parts.wpn_fps_upg_a_slug.stats.moving_spread = 6
	self.parts.wpn_fps_upg_a_slug.stats.spread = 6

	-- Tweak pickup multipliers for conversion kits
	self.parts.wpn_fps_ammo_type.custom_stats.ammo_pickup_max_mul = 0.5
	self.parts.wpn_fps_ammo_type.custom_stats.ammo_pickup_min_mul = 0.5

	self.parts.wpn_fps_lmg_hcar_body_conversionkit.custom_stats.ammo_pickup_max_mul = 2
	self.parts.wpn_fps_lmg_hcar_body_conversionkit.custom_stats.ammo_pickup_min_mul = 2

	self.parts.wpn_fps_ass_g3_b_short.custom_stats.ammo_pickup_max_mul = 2
	self.parts.wpn_fps_ass_g3_b_short.custom_stats.ammo_pickup_min_mul = 2

	self.parts.wpn_fps_pis_c96_b_long.custom_stats.ammo_pickup_max_mul = 0.5
	self.parts.wpn_fps_pis_c96_b_long.custom_stats.ammo_pickup_min_mul = 0.5

	self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_max_mul = 0.5
	self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_min_mul = 0.5

	self.parts.wpn_fps_ass_shak12_body_vks.custom_stats.ammo_pickup_max_mul = 0.5
	self.parts.wpn_fps_ass_shak12_body_vks.custom_stats.ammo_pickup_min_mul = 0.5

end)
