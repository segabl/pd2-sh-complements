if not StreamHeistComplements then

	StreamHeistComplements = {}

	Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInitStreamlinedHeistingComplements", function (loc)

		local function swap_tier_descriptions(desc_id, values)
			local text = loc:text(desc_id):gsub(";", "")
			local sorted_values = {}
			for k in pairs(values) do
				if type(k) == "string" then
					table.insert(sorted_values, k)
				end
			end
			table.sort(sorted_values, function (a, b) return a:len() > b:len() end)
			for _, k in ipairs(sorted_values) do
				text = text:gsub("%$" .. k, values[k]:gsub("%%", "%%%%"))
			end

			local basic, basic_desc, pro, pro_desc = text:match("(.-\n)(.+)\n\n(.-\n)(.+)")
			loc:add_localized_strings({ [desc_id] = tostring(basic) .. tostring(pro_desc) .. "\n\n" .. tostring(pro) .. tostring(basic_desc) })
		end

		swap_tier_descriptions("menu_bloodthirst_desc", tweak_data.upgrades.skill_descs.bloodthirst)

	end)

end

if RequiredScript == "lib/tweak_data/blackmarkettweakdata" then

	Hooks:PostHook(BlackMarketTweakData, "init", "shc_init", function (self)

		-- Make melee weapons not ignore weapon movement penalty
		for weap_id, weap_data in pairs(self.melee_weapons) do
			weap_data.stats.remove_weapon_movement_penalty = nil
		end

	end)

elseif RequiredScript == "lib/tweak_data/skilltreetweakdata" then

	Hooks:PostHook(SkillTreeTweakData, "init", "shc_init", function (self)

		-- Swap around basic and pro of Bloodthirst
		self.skills.bloodthirst[1].upgrades[1] = "player_temp_melee_kill_increase_reload_speed_1"
		self.skills.bloodthirst[2].upgrades[1] = "player_melee_damage_stacking_1"

		-- Swap Frenzy and Berserker
		self.trees[15].tiers[3][2] = "frenzy"
		self.trees[15].tiers[4][1] = "wolverine"

		-- Move melee damage boost duration to first perk of Infiltrator
		table.delete(self.specializations[8][5].upgrades, "melee_stacking_hit_expire_t")
		table.insert(self.specializations[8][1].upgrades, "melee_stacking_hit_expire_t")

		-- Add melee damage boost duriation to first perk of Sociopath
		table.insert(self.specializations[9][1].upgrades, "melee_stacking_hit_expire_t")

		-- Remove passive dodge bonus from Hacker - Botnet
		table.delete(self.specializations[21][9].upgrades, "player_passive_dodge_chance_2")

	end)

elseif RequiredScript == "lib/tweak_data/upgradestweakdata" then

	Hooks:PostHook(UpgradesTweakData, "init", "shc_init", function (self)

		-- SKILLS

		-- Inspire cooldown (20s -> 60s)
		self.values.cooldown.long_dis_revive[1][2] = 60
		self.skill_descs.inspire.multipro2 = "60"

		-- Partners in Crime ace damage reduction (54% -> 50%)
		self.values.player.passive_convert_enemies_health_multiplier[2] = 0.05
		self.skill_descs.control_freak.multipro4 = "50%"

		-- Aggressive Reload (100% -> 75%)
		self.values.temporary.single_shot_fast_reload[1][1] = 1.75
		self.skill_descs.speedy_reload.multipro = "75%"

		-- Graze headshot damage (100% -> 90%)
		self.values.snp.graze_damage[2].damage_factor_headshot = 0.9
		self.skill_descs.single_shot_ammo_return.multipro = "90%"

		-- Overkill duration (20s -> 8s)
		self.values.temporary.overkill_damage_multiplier[1][2] = 8
		self.skill_descs.overkill.multibasic2 = "8"

		-- Bullet Storm duration (20s -> 15s)
		self.skill_descs.ammo_reservoir.multipro2 = "10"

		-- Saw Massacre wear (50% -> 95%)
		self.values.saw.enemy_slicer[1] = 1
		self.skill_descs.carbon_blade.multibasic2 = "95%"

		-- Fully Loaded throwable gain chance increase (1% -> 5%)
		self.values.player.regain_throwable_from_ammo[1].chance_inc = 1.05
		self.skill_descs.bandoliers.multipro4 = "5%"

		-- Hardware Expert restart chance (10% -> 20%)
		self.values.player.drill_autorepair_1[1] = 0.2
		self.skill_descs.hardware_expert.multipro3 = "20%"

		-- More Firepower shaped charges (1 -> 2 / 2 -> 3)
		self.values.shape_charge.quantity[1] = 2
		self.values.shape_charge.quantity[2] = 5
		self.skill_descs.more_fire_power.multibasic = "2"
		self.skill_descs.more_fire_power.multipro = "3"

		-- Kickstarter restart chance (20% -> 30%)
		self.values.player.drill_autorepair_2[1] = 0.3
		self.skill_descs.kick_starter.multibasic = "30%"

		-- Heavy impact (5% -> 15% / 20% -> 40%)
		self.values.weapon.knock_down[1] = 0.15
		self.values.weapon.knock_down[2] = 0.4
		self.skill_descs.heavy_impact.multibasic = "15%"
		self.skill_descs.heavy_impact.multipro = "40%"

		-- Body Expertise (30% -> 20% / 90% -> 60%)
		self.values.weapon.automatic_head_shot_add = { 0.2, 0.6 }
		self.skill_descs.body_expertise.multibasic = "20%"
		self.skill_descs.body_expertise.multipro = "60%"

		-- Optical Illusions target chance decrease (35% -> 20%)
		self.values.player.camouflage_bonus[2] = 0.8
		self.skill_descs.optic_illusions.multibasic = "20%"

		-- Unseen Strike duration (6s -> 4s / 18s -> 12s)
		self.values.temporary.unseen_strike[1][2] = 4
		self.values.temporary.unseen_strike[2][2] = 12
		self.skill_descs.unseen_strike.multibasic3 = "4"
		self.skill_descs.unseen_strike.multipro = "12"

		-- Bloodthirst (50% for 10s -> 30% for 4s / 100% up to 1600% -> 50% up to 800%)
		self.values.player.melee_damage_stacking[1].max_multiplier = 8
		self.values.player.melee_damage_stacking[1].melee_multiplier = 0.5
		self.values.player.melee_kill_increase_reload_speed[1][1] = 1.3
		self.values.player.melee_kill_increase_reload_speed[1][2] = 4
		self.skill_descs.bloodthirst.multibasic = "50%"
		self.skill_descs.bloodthirst.multibasic2 = "800%"
		self.skill_descs.bloodthirst.multipro = "30%"
		self.skill_descs.bloodthirst.multipro2 = "4"

		-- Pumping Iron (100% -> 200% / 100% -> 150%)
		self.values.player.non_special_melee_multiplier[1] = 3
		self.values.player.melee_damage_multiplier[1] = 2.5
		self.skill_descs.steroids.multibasic = "200%"
		self.skill_descs.steroids.multipro = "150%"


		-- PERK DECKS

		-- Crook - Expert Composure armor (25% -> 30%)
		self.values.player.level_2_armor_multiplier[3] = 1.7
		self.values.player.level_3_armor_multiplier[3] = 1.7
		self.values.player.level_4_armor_multiplier[3] = 1.7
		self.specialization_descs[6][7].multiperk2 = "30%"

		-- Burglar - Dutch Courage pager answer speed (10% -> 20%)
		self.values.player.alarm_pager_speed_multiplier[1] = 0.8
		self.specialization_descs[7][7].multiperk3 = "20%"

		-- Infiltrator - Overdog damage boost duration (7s -> 4s)
		self.values.melee.stacking_hit_expire_t[1] = 4
		self.specialization_descs[8][1].multiperk2 = "4"

		-- Sociopath - Overdog state correct damage boost duration
		self.specialization_descs[9][1].multiperk2 = "4"

		-- Gambler - Medical Supplies cooldown (3s -> 2s)
		for _, v in pairs(self.values.temporary.loose_ammo_restore_health) do
			v[2] = 2
		end
		self.specialization_descs[10][1].multiperk3 = "2"

		-- Gambler - Ammo Give Out cooldown (5s -> 3s)
		self.values.temporary.loose_ammo_give_team[1][2] = 3
		self.specialization_descs[10][3].multiperk2 = "3"

		-- Stoic - Reduce DoT duration (12s -> 9s)
		self.values.player.damage_control_passive[1][2] = 11
		self.specialization_descs[19][1].multiperk2 = "9"

		-- WEAPONS

		-- Movement speed penalty for lmgs and miniguns
		self.weapon_movement_penalty.lmg = 0.8
		self.weapon_movement_penalty.minigun = 0.8

	end)

elseif RequiredScript == "lib/tweak_data/weapontweakdata" then

	Hooks:PostHook(WeaponTweakData, "init", "shc_init", function (self)

		local FALLOFF_TEMPLATE = WeaponFalloffTemplate.setup_weapon_falloff_templates()

		for weap_id, weap_data in pairs(self) do
			if type(weap_data) == "table" and weap_data.stats then

				local cat_map = table.list_to_set(weap_data.categories)

				-- Buff minigun damage in exchange for movement speed penalty
				if cat_map.minigun then
					weap_data.stats.damage = math.ceil(weap_data.stats.damage * 1.1)
					weap_data.damage_falloff = FALLOFF_TEMPLATE.LMG_FALL_MEDIUM
				end

				-- Restore shotgun pellets
				if cat_map.shotgun and weap_data.rays then
					weap_data.rays = math.max(weap_data.rays, 12)
				end

			end
		end

	end)

elseif RequiredScript == "lib/units/equipment/ammo_bag/ammobagbase" then

	-- Reduce ace duration
	AmmoBagBase._BULLET_STORM = { 2.5, 7.5 }

	-- Fix bullet storm duration bug
	function AmmoBagBase:_take_ammo(unit)
		local taken = 0
		local inventory = unit:inventory()

		if inventory then
			for _, weapon in pairs(inventory:available_selections()) do
				local took = self:round_value(weapon.unit:base():add_ammo_from_bag(self._ammo_amount))
				taken = taken + took
				self._ammo_amount = self:round_value(self._ammo_amount - took)
	
				if self._ammo_amount <= 0 then
					return taken
				end
			end
		end

		return taken
	end

	Hooks:PreHook(AmmoBagBase, "_set_empty", "shc__set_empty", function (self)
		managers.network:session():send_to_peers_synched("sync_ammo_bag_ammo_taken", self._unit, self._max_ammo_amount + 1)
	end)

elseif RequiredScript == "lib/units/props/drill" then

	-- Make autorepair reroll everytime the drill is jammed and fix swapped values
	Hooks:PreHook(Drill, "set_jammed", "shc_set_jammed", function (self, jammed)

		if Network:is_server() and jammed and not self._jammed then
			local current_auto_repair_level_1 = self._skill_upgrades.auto_repair_level_1 or 0
			local current_auto_repair_level_2 = self._skill_upgrades.auto_repair_level_2 or 0
			local drill_autorepair_chance = 0

			if current_auto_repair_level_1 > 0 then
				drill_autorepair_chance = drill_autorepair_chance + tweak_data.upgrades.values.player.drill_autorepair_1[1]
			end
			if current_auto_repair_level_2 > 0 then
				drill_autorepair_chance = drill_autorepair_chance + tweak_data.upgrades.values.player.drill_autorepair_2[1]
			end

			self:set_autorepair(math.random() < drill_autorepair_chance, true)
		end
	end)

	-- Reduce time it takes for autorepair to kick in
	function Drill:set_autorepair(state, jammed)
		self._autorepair = state

		if self._autorepair_clbk_id then
			managers.enemy:remove_delayed_clbk(self._autorepair_clbk_id)
			self._autorepair_clbk_id = nil
		end

		if state and (self._jammed or jammed) then
			self._autorepair_clbk_id = "Drill_autorepair" .. tostring(self._unit:key())
			managers.enemy:add_delayed_clbk(self._autorepair_clbk_id, callback(self, self, "clbk_autorepair"), TimerManager:game():time() + 5 + 5 * math.random())
		end
	end

elseif RequiredScript == "lib/units/weapons/raycastweaponbase" then

	-- No aim assist
	Hooks:PostHook(RaycastWeaponBase, "init", "shc_init", function (self)
		self._autohit_data = { INIT_RATIO = 0, MAX_RATIO = 0, far_angle = 0, far_dis = 0, MIN_RATIO = 0, near_angle = 0 }
		self._autohit_current = 0
	end)

elseif RequiredScript == "lib/units/weapons/sawweaponbase" then

	-- Fix hardcoded damage increase against Bulldozers and make it multiply instead of static
	function SawHit:on_collision(col_ray, weapon_unit, user_unit, damage)
		local hit_unit = col_ray.unit
		if hit_unit:base() and hit_unit:base().has_tag and hit_unit:base():has_tag("tank") then
			damage = damage * 15
		end

		local result = InstantBulletBase.on_collision(self, col_ray, weapon_unit, user_unit, damage)

		if hit_unit:damage() and col_ray.body:extension() and col_ray.body:extension().damage then
			damage = math.clamp(damage * managers.player:upgrade_value("saw", "lock_damage_multiplier", 1) * 4, 0, 200)
			col_ray.body:extension().damage:damage_lock(user_unit, col_ray.normal, col_ray.position, col_ray.direction, damage)
			if hit_unit:id() ~= -1 then
				managers.network:session():send_to_peers_synched("sync_body_damage_lock", col_ray.body, damage)
			end
		end

		return result
	end

end
