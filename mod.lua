if not StreamHeistComplements then

	StreamHeistComplements = {}

	Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInitStreamlinedHeistingComplements", function (loc)

		local function swap_tier_descriptions(desc_id)
			local basic, basic_desc, pro, pro_desc = loc:text(desc_id):match("(.-\n)(.+)\n\n(.-\n)(.+)")
			loc:add_localized_strings({ [desc_id] = tostring(basic) .. tostring(pro_desc) .. "\n\n" .. tostring(pro) .. tostring(basic_desc) })
		end

		-- Swap basic and pro description of Far Away
		swap_tier_descriptions("menu_far_away_beta_desc")

		-- Trigger happy pro description
		local basic, basic_desc, pro = loc:text("menu_trigger_happy_beta_desc"):match("(.-\n)(.+)\n\n(.-\n)")
		loc:add_localized_strings({ menu_trigger_happy_beta_desc = basic .. basic_desc .. "\n\n" .. pro .. basic_desc:gsub("multibasic", "multipro") })

		-- Swap basic and pro description of Bloodthirst
		swap_tier_descriptions("menu_bloodthirst_desc")

		loc:add_localized_strings({
			-- Restore Sociopath first perk name
			menu_deck9_1 = "No Talk",
			-- Remove dodge bonus description from Hacker - Botnet
			menu_deck21_9_desc = loc:text("menu_deck21_9_desc"):gsub("[^%.\n]+%$multiperk2[^\n]+", "")
		})

	end)

end

if RequiredScript == "lib/tweak_data/blackmarkettweakdata" then

	Hooks:PostHook(BlackMarketTweakData, "init", "shc_init", function (self)

		-- Make melee weapons not ignore weapon movement penalty
		for _, weap_data in pairs(self.melee_weapons) do
			weap_data.stats.remove_weapon_movement_penalty = nil
		end

	end)

elseif RequiredScript == "lib/tweak_data/skilltreetweakdata" then

	Hooks:PostHook(SkillTreeTweakData, "init", "shc_init", function (self)

		-- Move civilian intimidation duration from Confident to Stockholm Syndrome
		table.delete(self.skills.cable_guy[1].upgrades, "player_civ_intimidation_mul")
		table.insert(self.skills.stockholm_syndrome[1].upgrades, "player_civ_intimidation_mul")

		-- Add intimidation power to Confident
		table.insert(self.skills.cable_guy[1].upgrades, "player_intimidation_multiplier")

		-- Swap basic and pro of Far Away
		self.skills.far_away[1].upgrades[1] = "shotgun_steelsight_range_inc_1"
		self.skills.far_away[2].upgrades[1] = "shotgun_steelsight_accuracy_inc_1"

		-- Swap basic and pro of Bloodthirst
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

		-- Combat Medic revive health multiplier (30% -> 50%)
		self.revive_health_multiplier[1] = 1.5
		self.skill_descs.combat_medic.multipro = "50%"

		-- Inspire cooldown (20s -> 40s)
		self.values.cooldown.long_dis_revive[1][2] = 40
		self.skill_descs.inspire.multipro2 = "40"

		-- Confident intimidation multiplier
		self.values.player.intimidation_multiplier[1] = 1.5

		-- Partners in Crime ace damage reduction (54% -> 50%)
		self.values.player.passive_convert_enemies_health_multiplier[2] = 0.05
		self.skill_descs.control_freak.multipro4 = "50%"

		-- Aggressive Reload (100% -> 75%)
		self.values.temporary.single_shot_fast_reload[1][1] = 1.75
		self.skill_descs.speedy_reload.multipro = "75%"

		-- Graze headshot damage (100% -> 90%)
		self.values.snp.graze_damage[2].damage_factor_headshot = 0.9
		self.skill_descs.single_shot_ammo_return.multipro = "90%"

		-- Far away accuracy increase (40% -> 75%)
		self.values.shotgun.steelsight_accuracy_inc[1] = 0.25
		self.skill_descs.far_away.multibasic = "75%"

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

		-- Eco Sentry cost reduction (5% -> 10%)
		self.skill_descs.eco_sentry.multibasic = "10%"

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

		-- Fire trap duration (10s -> 20s / 10s -> 20s)
		self.values.trip_mine.fire_trap[1][1] = 10
		self.values.trip_mine.fire_trap[2][1] = 30
		self.skill_descs.fire_trap.multibasic = "20"
		self.skill_descs.fire_trap.multipro = "20"

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

		-- Desperado max duration (10s -> 4s)
		self.values.pistol.stacked_accuracy_bonus[1].accuracy_bonus = 0.1
		self.values.pistol.stacked_accuracy_bonus[1].max_time = 5
		self.skill_descs.expert_handling.multibasic2 = "5"

		-- Trigger happy max stacks (1 -> 4 / 1 -> 6), damage bonus (120% -> 30%)
		self.values.pistol.stacking_hit_damage_multiplier[1].max_stacks = 4
		self.values.pistol.stacking_hit_damage_multiplier[1].damage_bonus = 0.25
		self.values.pistol.stacking_hit_damage_multiplier[2].max_stacks = 6
		self.values.pistol.stacking_hit_damage_multiplier[2].damage_bonus = 0.25
		self.skill_descs.trigger_happy.multibasic3 = "4"
		self.skill_descs.trigger_happy.multibasic4 = "25%"
		self.skill_descs.trigger_happy.multipro2 = "4"
		self.skill_descs.trigger_happy.multipro3 = "6"
		self.skill_descs.trigger_happy.multipro4 = "25%"

		-- Nine Lives bleed out health increase (50% -> 100%)
		self.values.player.bleed_out_health_multiplier[1] = 2
		self.skill_descs.nine_lives.multibasic2 = "100%"

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

		-- Leech - Increase segments (5 -> 8 / 10 -> 16), reduce heal amount (5% -> 3% / 10% -> 6%)
		self.values.player.copr_static_damage_ratio[1] = 0.125
		self.values.player.copr_static_damage_ratio[2] = 0.0625
		self.values.player.copr_teammate_heal[1] = 0.03
		self.values.player.copr_teammate_heal[2] = 0.06
		self.specialization_descs[22][1].multiperk2 = "12.5%"
		self.specialization_descs[22][1].multiperk4 = "3%"
		self.specialization_descs[22][5].multiperk3 = "6%"
		self.specialization_descs[22][9].multiperk = "6.25%"

		-- WEAPONS

		-- Movement speed penalty for lmgs and miniguns
		self.weapon_movement_penalty.lmg = 0.85
		self.weapon_movement_penalty.minigun = 0.85

	end)

elseif RequiredScript == "lib/tweak_data/weaponfactorytweakdata" then

	Hooks:PostHook(WeaponFactoryTweakData, "create_ammunition", "shc_create_ammunition", function (self)

		-- Reduce buckshot rays
		self.parts.wpn_fps_upg_a_custom.custom_stats.rays = 9
		self.parts.wpn_fps_upg_a_custom_free.custom_stats.rays = 9

	end)

elseif RequiredScript == "lib/tweak_data/weapontweakdata" then

	-- Fix missing entries in the PICKUP table
	local up = 1
	repeat
		local n, v = debug.getupvalue(WeaponTweakData._pickup_chance, up)
		if n == "PICKUP" then
			local last_idx = table.size(v)
			v.LMG_HIGH_CAPACITY = last_idx + 1
			v.PISTOL_HIGH_CAPACITY = last_idx + 2
			v.PISTOL_LOW_CAPACITY = last_idx + 3
			v.SHOTGUN_SECOND_CAPACITY = last_idx + 4
			break
		else
			up = up + 1
		end
	until not n

	Hooks:PostHook(WeaponTweakData, "init", "shc_init", function (self)

		local FALLOFF_TEMPLATE = WeaponFalloffTemplate.setup_weapon_falloff_templates()
		local reload_stats = self.stats.reload
		local akimbo_mappings = self:get_akimbo_mappings()
		local akimbo_multiplier = 1.5

		for weap_id, weap_data in pairs(self) do
			if type(weap_data) == "table" and weap_data.stats then

				local cat_map = table.list_to_set(weap_data.categories)
				if cat_map.bow then
					-- Add armor piercing to bows, reduce bow damage in exchange for being able to fire quick shots
					weap_data.stats_modifiers = weap_data.stats_modifiers or {}
					weap_data.stats_modifiers.damage = (weap_data.stats_modifiers.damage or 1) * 0.5
					weap_data.charge_data.max_t = weap_data.charge_data.max_t * 0.7
					weap_data.armor_piercing_chance = 1
				elseif cat_map.crossbow then
					-- Add armor piercing to crossbows
					weap_data.armor_piercing_chance = 1
				elseif cat_map.minigun then
					-- Buff minigun damage in exchange for movement speed penalty
					weap_data.stats.damage = math.ceil(weap_data.stats.damage * 1.2)
					weap_data.damage_falloff = FALLOFF_TEMPLATE.LMG_FALL_MEDIUM
				elseif cat_map.shotgun then
					-- Restore shotgun pellets
					weap_data.rays = weap_data.rays and math.max(weap_data.rays, 12)
				elseif cat_map.grenade_launcher then
					-- Nerf GL pickup
					weap_data.AMMO_PICKUP[1] = 0
					weap_data.AMMO_PICKUP[2] = weap_data.AMMO_PICKUP[2] < 0.5 and weap_data.AMMO_PICKUP[2] or weap_data.AMMO_PICKUP[2] * 0.8
				end

				-- Tweak akimbo reload speeds
				if akimbo_mappings[weap_id] then
					local akimbo_weap_data = self[akimbo_mappings[weap_id]]
					if akimbo_weap_data and table.contains(akimbo_weap_data.categories, "akimbo") then
						local akimbo_reload = akimbo_weap_data.timers.reload_empty
						local reload_target = (weap_data.timers.reload_empty / reload_stats[weap_data.stats.reload]) * akimbo_multiplier
						local akimbo_reload_stat = 1
						while akimbo_reload / reload_stats[akimbo_reload_stat] > reload_target and akimbo_reload_stat < #reload_stats do
							akimbo_reload_stat = akimbo_reload_stat + 1
						end
						akimbo_weap_data.stats.reload = akimbo_reload_stat
					end
				end

			end
		end

	end)

elseif RequiredScript == "lib/player_actions/skills/playeractionexperthandling" then

	PlayerAction.ExpertHandling.Function = function (player_manager, accuracy_bonus, max_stacks, max_time)
		local co = coroutine.running()
		local current_stacks = 1
		local duration = max_time - Application:time()

		local function on_hit(unit, attack_data)
			if attack_data.attacker_unit == player_manager:player_unit() and attack_data.variant == "bullet" then
				current_stacks = current_stacks + 1
				max_time = Application:time() + duration
				player_manager:set_property("desperado", 1 - accuracy_bonus * math.min(current_stacks, max_stacks))
			end
		end

		player_manager:set_property("desperado", 1 - accuracy_bonus)
		player_manager:register_message(Message.OnEnemyShot, co, on_hit)

		while Application:time() < max_time and player_manager:is_current_weapon_of_category("pistol") do
			coroutine.yield(co)
		end

		player_manager:remove_property("desperado")
		player_manager:unregister_message(Message.OnEnemyShot, co)
	end

elseif RequiredScript == "lib/player_actions/skills/playeractiontriggerhappy" then

	PlayerAction.TriggerHappy.Function = function (player_manager, damage_bonus, max_stacks, max_time)
		local co = coroutine.running()
		local current_stacks = 1
		local duration = max_time - Application:time()

		local function on_hit(unit, attack_data)
			if attack_data.attacker_unit == player_manager:player_unit() and attack_data.variant == "bullet" then
				current_stacks = current_stacks + 1
				max_time = Application:time() + duration
				player_manager:set_property("trigger_happy", 1 + damage_bonus * math.min(current_stacks, max_stacks))
			end
		end

		player_manager:set_property("trigger_happy", 1 + damage_bonus)
		player_manager:register_message(Message.OnEnemyShot, co, on_hit)

		while Application:time() < max_time and player_manager:is_current_weapon_of_category("pistol") do
			coroutine.yield(co)
		end

		player_manager:remove_property("trigger_happy")
		player_manager:unregister_message(Message.OnEnemyShot, co)
	end

elseif RequiredScript == "lib/units/enemies/cop/copdamage" then

	-- Fixed critical hit multiplier
	function CopDamage:roll_critical_hit(attack_data)
		if not self:can_be_critical(attack_data) or math.random() >= managers.player:critical_hit_chance() then
			return false, attack_data.damage
		end

		return true, attack_data.damage * 3
	end

elseif RequiredScript == "lib/units/equipment/ammo_bag/ammobagbase" then

	-- Reduce ace duration (values are adjusted for the ammo requirement change)
	AmmoBagBase._BULLET_STORM = { 5, 15 }

	-- Rework bullet storm to require only one gun to be fully empty to get the max duration
	function AmmoBagBase:take_ammo(unit)
		if self._empty then
			return false, false
		end

		local taken = self:_take_ammo(unit)
		if taken > 0 then
			unit:sound():play("pickup_ammo")
			managers.network:session():send_to_peers_synched("sync_ammo_bag_ammo_taken", self._unit, self._ammo_amount <= 0 and self._max_ammo_amount or taken)
		end

		if self._ammo_amount <= 0 then
			self:_set_empty()
		else
			self:_set_visual_stage()
		end

		return taken > 0, self._bullet_storm_level and self._bullet_storm_level > 0 and self._BULLET_STORM[self._bullet_storm_level] * math.min(1, taken) or false
	end

	-- Return the actual amount of ammo taken when the bag is used up
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

elseif RequiredScript == "lib/units/equipment/sentry_gun/sentrygunbase" then

	-- Eco Sentry cost reduction (5% -> 10%)
	SentryGunBase.DEPLOYEMENT_COST[3] = 0.85

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

elseif RequiredScript == "lib/units/weapons/bowweaponbase" then

	-- Make bow quick shots actually usable
	function BowWeaponBase:charge_fail()
		return false
	end

	-- Increase minimum projectile speed
	function BowWeaponBase:projectile_speed_multiplier()
		return math.lerp(0.5, 1, self:charge_multiplier())
	end

	-- Easier to do this than go through all arrows and change their damage
	function BowWeaponBase:projectile_damage_multiplier()
		return math.lerp(0.1, 0.5, self:charge_multiplier())
	end

elseif RequiredScript == "lib/units/weapons/raycastweaponbase" then

	-- No aim assist
	Hooks:PostHook(RaycastWeaponBase, "init", "shc_init", function (self)
		if self._autohit_data then
			self._autohit_current = 0
			self._autohit_data.INIT_RATIO = 0
			self._autohit_data.MIN_RATIO = 0
			self._autohit_data.MAX_RATIO = 0
		end
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

elseif RequiredScript == "lib/units/weapons/trip_mine/tripminebase" then

	-- Fix fire position when tripmines are placed against walls
	local fire_pos = Vector3()
	local origin_pos = Vector3()
	function TripMineBase:_spawn_environment_fire(user_unit, added_time, range_multiplier)
		local data = tweak_data.env_effect:trip_mine_fire()
		local rotation = self._unit:rotation()
		local normal = rotation:y()

		mvector3.set(origin_pos, normal)
		mvector3.multiply(origin_pos, 30)
		mvector3.add(origin_pos, self._unit:position())

		local range = data.range * range_multiplier
		local dot = math.abs(mvector3.dot(normal, math.UP))
		mvector3.set(fire_pos, normal)
		mvector3.multiply(fire_pos, math.lerp(range * 2, 0, dot))
		mvector3.add(fire_pos, origin_pos)

		local col_ray = World:raycast("ray", origin_pos, fire_pos, "slot_mask", managers.slot:get_mask("molotov_raycasts"))
		mvector3.set(fire_pos, normal)
		mvector3.multiply(fire_pos, col_ray and col_ray.distance * 0.5 or math.lerp(range, 0, dot))
		mvector3.add(fire_pos, origin_pos)

		EnvironmentFire.spawn(fire_pos, rotation, data, dot < 0.5 and math.UP or normal, user_unit, added_time, range_multiplier)
	end

end
