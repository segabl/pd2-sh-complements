if not StreamHeistComplements then

	StreamHeistComplements = {}

	Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInitStreamlinedHeistingComplementaries", function (loc)

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

if RequiredScript == "lib/tweak_data/upgradestweakdata" then

	Hooks:PostHook(UpgradesTweakData, "init", "shc_init", function (self)

		-- Inspire cooldown (20s -> 60s)
		self.values.cooldown.long_dis_revive[1][2] = 60
		self.skill_descs.inspire.multipro2 = "60"

		-- Partners in Crime damage reduction (45% -> 40% / 54% -> 50%)
		self.values.player.passive_convert_enemies_health_multiplier = { 0.6, 0.1 }
		self.skill_descs.control_freak.multibasic3 = "40%"
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

		-- Body Expertise (30% -> 25% / 90% -> 65%)
		self.values.weapon.automatic_head_shot_add = { 0.25, 0.65 }
		self.skill_descs.body_expertise.multibasic = "25%"
		self.skill_descs.body_expertise.multipro = "65%"

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

	end)

elseif RequiredScript == "lib/tweak_data/skilltreetweakdata" then

	Hooks:PostHook(SkillTreeTweakData, "init", "shc_init", function (self)

		-- Swap around basic and pro of Bloodthirst
		self.skills.bloodthirst[1].upgrades[1] = "player_temp_melee_kill_increase_reload_speed_1"
		self.skills.bloodthirst[2].upgrades[1] = "player_melee_damage_stacking_1"

		-- Swap Frenzy and Berserker
		self.trees[15].tiers[3][2] = "frenzy"
		self.trees[15].tiers[4][1] = "wolverine"
	
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

		if Network:is_server() and jammed and self._jammed ~= jammed then
			local current_auto_repair_level_1 = self._skill_upgrades.auto_repair_level_1 or 0
			local current_auto_repair_level_2 = self._skill_upgrades.auto_repair_level_2 or 0
			local drill_autorepair_chance = 0

			if current_auto_repair_level_1 > 0 then
				drill_autorepair_chance = drill_autorepair_chance + tweak_data.upgrades.values.player.drill_autorepair_1[1]
			end
			if current_auto_repair_level_2 > 0 then
				drill_autorepair_chance = drill_autorepair_chance + tweak_data.upgrades.values.player.drill_autorepair_2[1]
			end

			self:set_autorepair(math.random() < drill_autorepair_chance)
		end
	end)

	-- Reduce time it takes for autorepair to kick in
	function Drill:set_autorepair(state)
		self._autorepair = state

		if self._autorepair_clbk_id then
			managers.enemy:remove_delayed_clbk(self._autorepair_clbk_id)
			self._autorepair_clbk_id = nil
		end

		if state and self._jammed then
			self._autorepair_clbk_id = "Drill_autorepair" .. tostring(self._unit:key())
			managers.enemy:add_delayed_clbk(self._autorepair_clbk_id, callback(self, self, "clbk_autorepair"), TimerManager:game():time() + 5 + 5 * math.random())
		end
	end

end
