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
