Hooks:PostHook(WeaponFactoryTweakData, "init", "shc_init", function (self)

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

	-- Give military laser module same stability as LED combo
	self.parts.wpn_fps_upg_fl_ass_peq15.stats.recoil = 2

	-- AK family suppressors
	self.parts.wpn_fps_upg_ns_ass_pbs1.stats.spread = 1
	self.parts.wpn_fps_upg_ns_ass_pbs1.stats.spread_moving = 1
	self.parts.wpn_fps_upg_ns_ass_pbs1.stats.recoil = 2
	self.parts.wpn_fps_upg_ns_ass_pbs1.stats.concealment = -4

	self.parts.wpn_fps_upg_ak_ns_tgp.stats.spread = 2
	self.parts.wpn_fps_upg_ak_ns_tgp.stats.spread_moving = 2

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

	self.parts.wpn_fps_lmg_kacchainsaw_conversionkit.custom_stats.ammo_pickup_max_mul = 2.5
	self.parts.wpn_fps_lmg_kacchainsaw_conversionkit.custom_stats.ammo_pickup_min_mul = 2.5

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

	-- Campbell 74
	self.parts.wpn_fps_lmg_kacchainsaw_sling.stats.recoil = 2
	self.parts.wpn_fps_lmg_kacchainsaw_sling.stats.spread = nil
	self.parts.wpn_fps_lmg_kacchainsaw_conversionkit.custom_stats.fire_rate_multiplier = 1.6

	-- Compact-5
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.stats.spread = 2
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.stats.spread_moving = 2
	self.parts.wpn_fps_smg_mp5_fg_mp5sd.stats.recoil = 2

	-- Kobus 90
	self.parts.wpn_fps_smg_p90_b_ninja.stats.spread = 1
	self.parts.wpn_fps_smg_p90_b_ninja.stats.spread_moving = 1

	-- JP36
	self.parts.wpn_fps_ass_g36_s_kv.stats.recoil = 2
	self.parts.wpn_fps_ass_g36_s_kv.stats.concealment = -1
	self.parts.wpn_fps_ass_g36_s_sl8.stats.spread = 2
	self.parts.wpn_fps_ass_g36_s_sl8.stats.spread_moving = 2
	self.parts.wpn_fps_ass_g36_s_sl8.stats.concealment = -5

	-- Set lowest alert range for all suppressors
	-- Tweak Sting grenade pickup
	for _, v in pairs(self.parts) do
		if v.perks and table.contains(v.perks, "silencer") then
			v.stats = v.stats or {}
			v.stats.alert_size = 20
		elseif v.sub_type == "ammo_hornet" and v.custom_stats then
			v.custom_stats.ammo_pickup_max_mul = 5
			v.custom_stats.ammo_pickup_min_mul = 5
		end
	end

	for _, v in pairs(self) do
		if type(v) == "table" and v.override and v.override.wpn_fps_upg_a_underbarrel_hornet then
			v.override.wpn_fps_upg_a_underbarrel_hornet.custom_stats.ammo_pickup_max_mul = 5
			v.override.wpn_fps_upg_a_underbarrel_hornet.custom_stats.ammo_pickup_min_mul = 5
		end
	end

end)
