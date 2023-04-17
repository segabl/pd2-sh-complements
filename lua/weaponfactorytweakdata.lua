Hooks:PostHook(WeaponFactoryTweakData, "create_ammunition", "shc_create_ammunition", function (self)

	-- Reduce buckshot rays
	self.parts.wpn_fps_upg_a_custom.custom_stats.rays = 9
	self.parts.wpn_fps_upg_a_custom_free.custom_stats.rays = 9

	-- Remove DB damage penalty
	self.parts.wpn_fps_upg_a_dragons_breath.stats.damage = nil

	-- Rework tombstone
	self.parts.wpn_fps_upg_a_rip.custom_stats.rays = 9
	self.parts.wpn_fps_upg_a_rip.custom_stats.dot_data.custom_data.hurt_animation_chance = 0.25
	self.parts.wpn_fps_upg_a_rip.custom_stats.dot_data.custom_data.dot_damage = 4
	self.parts.wpn_fps_upg_a_rip.custom_stats.dot_data.custom_data.dot_length = 10

	-- Increase AP slug accuracy
	self.parts.wpn_fps_upg_a_slug.stats.moving_spread = 6
	self.parts.wpn_fps_upg_a_slug.stats.spread = 6

	-- Tweak pickup multipliers for conversion kits
	self.parts.wpn_fps_ammo_type.custom_stats.ammo_pickup_max_mul = 0.5
	self.parts.wpn_fps_ammo_type.custom_stats.ammo_pickup_min_mul = 0.5

	self.parts.wpn_fps_lmg_hcar_body_conversionkit.custom_stats.ammo_pickup_max_mul = 1.5
	self.parts.wpn_fps_lmg_hcar_body_conversionkit.custom_stats.ammo_pickup_min_mul = 1.5

	self.parts.wpn_fps_ass_g3_b_short.custom_stats.ammo_pickup_max_mul = 2
	self.parts.wpn_fps_ass_g3_b_short.custom_stats.ammo_pickup_min_mul = 2

	self.parts.wpn_fps_pis_c96_b_long.custom_stats.ammo_pickup_max_mul = 0.5
	self.parts.wpn_fps_pis_c96_b_long.custom_stats.ammo_pickup_min_mul = 0.5

	self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_max_mul = 0.5
	self.parts.wpn_fps_upg_ass_ak_b_zastava.custom_stats.ammo_pickup_min_mul = 0.5

	self.parts.wpn_fps_ass_shak12_body_vks.custom_stats.ammo_pickup_max_mul = 0.5
	self.parts.wpn_fps_ass_shak12_body_vks.custom_stats.ammo_pickup_min_mul = 0.5

	-- Comando 553
	self.parts.wpn_fps_ass_s552_fg_standard_green.stats.spread = 5
	self.parts.wpn_fps_ass_s552_fg_standard_green.stats.spread_moving = 5
	self.parts.wpn_fps_ass_s552_fg_railed.stats.recoil = 3
	self.parts.wpn_fps_ass_s552_fg_railed.stats.concealment = nil

	-- Reinfeld 880
	self.parts.wpn_fps_shot_r870_body_rack.stats.reload = 2
	self.parts.wpn_fps_shot_r870_fg_wood.custom_stats = { fire_rate_multiplier = 1.2 }
	self.parts.wpn_fps_shot_r870_fg_wood.stats.concealment = -1
	self.parts.wpn_fps_shot_r870_fg_wood.stats.recoil = nil

end)
