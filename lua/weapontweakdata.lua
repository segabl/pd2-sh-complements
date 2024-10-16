Hooks:PostHook(WeaponTweakData, "init", "shc_init", function (self)

	local FALLOFF_TEMPLATE = WeaponFalloffTemplate.setup_weapon_falloff_templates()
	local reload_stats = self.stats.reload
	local akimbo_mappings = {}
	local akimbo_multiplier = 1.5

	for k, v in pairs(self:get_akimbo_mappings()) do
		akimbo_mappings[v] = k
	end

	-- Piglet
	self.m32.stats.reload = 18

	-- Compact 40
	self.slap.timers.reload_empty = 3.1
	self.slap.timers.reload_not_empty = 3.1

	-- Aran
	self.contender.timers.reload_empty = 1.7
	self.contender.timers.reload_not_empty = 1.7
	self.contender.timers.reload_steelsight = 1.7
	self.contender.timers.reload_steelsight_not_empty = 1.7
	self.contender.fire_mode_data.fire_rate = 0.5
	self.contender.single.fire_rate = 0.5

	-- JP36
	self.g36.stats.concealment = 22

	-- Predator
	self.spas12.stats.reload = 14

	-- M1014
	self.benelli.stats.reload = 14

	-- Generic weapon stat changes
	for weap_id, weap_data in pairs(self) do
		if type(weap_data) == "table" and weap_data.stats then

			local cat_map = table.list_to_set(weap_data.categories)
			if cat_map.snp then
				local total_ammo_reference = weap_data.use_data.selection_index == 2 and 30 or 20
				weap_data.NR_CLIPS_MAX = math.max(2, math.floor(total_ammo_reference / math.max(2, weap_data.CLIP_AMMO_MAX)))
				weap_data.AMMO_MAX = weap_data.CLIP_AMMO_MAX * weap_data.NR_CLIPS_MAX
			elseif cat_map.bow then
				-- Add armor piercing to bows, reduce bow damage in exchange for being able to fire quick shots
				weap_data.stats.reload = 21
				weap_data.stats_modifiers = weap_data.stats_modifiers or {}
				weap_data.stats_modifiers.damage = (weap_data.stats_modifiers.damage or 1) * 0.5
				weap_data.charge_data.max_t = weap_data.charge_data.max_t * 0.7
				weap_data.armor_piercing_chance = 1
				weap_data.bow_reload_speed_multiplier = nil
			elseif cat_map.crossbow then
				-- Add armor piercing to crossbows
				weap_data.armor_piercing_chance = 1
			elseif cat_map.minigun then
				-- Buff minigun damage in exchange for movement speed penalty
				weap_data.stats.damage = math.ceil(weap_data.stats.damage * 1.2)
				weap_data.damage_falloff = FALLOFF_TEMPLATE.SPECIAL_LOW
			elseif cat_map.shotgun then
				-- Restore shotgun pellets
				weap_data.rays = math.max(weap_data.rays or 1, 12)
				if weap_data.CLIP_AMMO_MAX == 2 then
					-- Buff double barrel damage and reload speed
					weap_data.stats.damage = math.ceil(weap_data.stats.damage * 1.25)
					weap_data.stats.reload = weap_data.stats.reload + 5
				end
			elseif cat_map.saw then
				-- Add armor piercing to saws
				weap_data.armor_piercing_chance = 1
			end

			-- Fix ADS spread values, basically swap around crouching and ADS spread
			-- Make bipods actually use bipod spread values
			if weap_data.spread then
				weap_data.spread.steelsight = 1.6
				weap_data.spread.crouching = weap_data.spread.standing * 0.8
				weap_data.spread.moving_crouching = weap_data.spread.moving_standing * 0.8
				weap_data.spread.bipod = weap_data.spread.standing * 0.5
			end

			-- Tweak akimbo reload speeds and total ammo
			if cat_map.akimbo then
				local single_weapon_data = self[akimbo_mappings[weap_id]] or self[weap_id:sub(3)]
				if single_weapon_data then
					local reload = weap_data.timers.reload_empty
					local reload_target = (single_weapon_data.timers.reload_empty / reload_stats[single_weapon_data.stats.reload]) * akimbo_multiplier
					local reload_stat = 1
					while reload / reload_stats[reload_stat] > reload_target and reload_stat < #reload_stats do
						reload_stat = reload_stat + 1
					end
					weap_data.stats.reload = reload_stat
					weap_data.NR_CLIPS_MAX = single_weapon_data.NR_CLIPS_MAX + 1
					weap_data.AMMO_MAX = weap_data.CLIP_AMMO_MAX * weap_data.NR_CLIPS_MAX * 0.5
				end
			end

			-- Fix alert sizes
			if cat_map.snp then
				weap_data.stats.alert_size = 4
			elseif cat_map.shotgun or cat_map.lmg or cat_map.minigun then
				weap_data.stats.alert_size = 6
			elseif cat_map.assault_rifle or cat_map.revolver then
				weap_data.stats.alert_size = 7
			elseif cat_map.smg then
				weap_data.stats.alert_size = 8
			elseif cat_map.pistol then
				weap_data.stats.alert_size = 9
			elseif cat_map.flamethrower then
				weap_data.stats.alert_size = 13
			end
			weap_data.stats.alert_size = math.clamp(weap_data.stats.alert_size, 1, #self.stats.alert_size)

			-- Tweak pickup values based on damage and category
			if weap_data.AMMO_PICKUP and weap_data.AMMO_PICKUP[2] > 0 then
				local ref = self.stats.damage[math.min(weap_data.stats.damage, #self.stats.damage)] * (weap_data.stats_modifiers and weap_data.stats_modifiers.damage or 1)
				ref = ref ^ 1.2

				if cat_map.flamethrower then
					ref = ref * 3
				elseif cat_map.grenade_launcher then
					ref = ref * 2
				elseif cat_map.pistol then
					ref = ref * 1.5
				elseif cat_map.lmg or cat_map.minigun or weap_data.CLIP_AMMO_MAX >= 100 and not cat_map.akimbo then
					ref = ref * 0.5
				end
				if weap_data.can_shoot_through_shield then
					ref = ref * 1.5
				end
				if weap_data.rays then
					ref = ref * 2
				end

				weap_data.AMMO_PICKUP = { 35 / ref, 70 / ref }
			end

		end
	end

end)
