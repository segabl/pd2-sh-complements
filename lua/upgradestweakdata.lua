Hooks:PostHook(UpgradesTweakData, "init", "shc_init", function (self)

	-- SKILLS

	-- Combat Medic revive health multiplier (30% -> 15%)
	self.revive_health_multiplier[1] = 1.15
	self.skill_descs.combat_medic.multipro = "15%"

	-- Inspire cooldown (20s -> 40s)
	self.values.cooldown.long_dis_revive[1][2] = 40
	self.skill_descs.inspire.multipro2 = "40"

	-- Forced Friendship ace damage absorption (0.5 -> 1.5 / 8 max -> 4 max)
	self.values.team.damage.hostage_absorption[1] = 0.15
	self.values.team.damage.hostage_absorption_limit = 4
	self.skill_descs.triathlete.multipro = "1.5"
	self.skill_descs.triathlete.multipro2 = "4"

	-- Confident intimidation multiplier
	self.values.player.intimidation_multiplier[1] = 1.5

	-- Partners in Crime ace damage reduction (54% -> 50%)
	self.values.player.passive_convert_enemies_health_multiplier[2] = 0.05
	self.skill_descs.control_freak.multipro4 = "50%"

	-- Ammo Efficiency (1 bullet -> 2 bullets)
	self.values.player.head_shot_ammo_return[1].ammo = 2
	self.values.player.head_shot_ammo_return[2].ammo = 2
	self.skill_descs.spotter_teamwork.multibasic3 = "2"

	-- Aggressive Reload (100% -> 75%)
	self.values.temporary.single_shot_fast_reload[1][1] = 1.75
	self.skill_descs.speedy_reload.multipro = "75%"

	-- Far away accuracy increase (40% -> 75%)
	self.values.shotgun.steelsight_accuracy_inc[1] = 0.25
	self.skill_descs.far_away.multibasic = "75%"

	-- Overkill duration (20s -> 10s)
	self.values.temporary.overkill_damage_multiplier[1][2] = 10
	self.skill_descs.overkill.multibasic2 = "10"

	-- Bullet Storm duration (20s -> 15s)
	self.skill_descs.ammo_reservoir.multipro2 = "10"

	-- Saw Massacre wear (50% -> 95%)
	self.values.saw.enemy_slicer[1] = 1
	self.skill_descs.carbon_blade.multibasic2 = "95%"

	-- Eco Sentry cost reduction (5% -> 10%)
	self.skill_descs.eco_sentry.multibasic = "10%"

	-- Hardware Expert restart chance (10% -> 30%)
	self.values.player.drill_autorepair_1[1] = 0.3
	self.skill_descs.hardware_expert.multipro3 = "30%"

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

	-- Heavy impact (5% -> 10% / 20% -> 30%)
	self.values.weapon.knock_down[1] = 0.1
	self.values.weapon.knock_down[2] = 0.3
	self.skill_descs.heavy_impact.multibasic = "10%"
	self.skill_descs.heavy_impact.multipro = "30%"

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

	-- Up you go revive health (40% -> 100%)
	self.values.player.revived_health_regain[1] = 2
	self.skill_descs.up_you_go.multipro = "100%"

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

	-- Infiltrator - Advanced close combat damage boost duration (7s -> 5s)
	self.values.melee.stacking_hit_expire_t[1] = 5
	self.specialization_descs[8][5].multiperk2 = "5"

	-- Sociopath - No Talk state correct damage boost duration
	self.specialization_descs[9][1].multiperk2 = "5"

	-- Gambler - Medical Supplies cooldown (3s -> 2s)
	for _, v in pairs(self.values.temporary.loose_ammo_restore_health) do
		v[2] = 2
	end
	self.specialization_descs[10][1].multiperk3 = "2"

	-- Gambler - Ammo Give Out cooldown (5s -> 3s)
	self.values.temporary.loose_ammo_give_team[1][2] = 3
	self.specialization_descs[10][3].multiperk2 = "3"

	-- Anarchist - Lust for Life amount (30 -> 20)
	for _, v in pairs(self.values.player.damage_to_armor[1]) do
		v[1] = 2
	end
	self.specialization_descs[15][9].multiperk = "20"

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

	-- Copycat - Instant swap duration (3 -> 10), instant swap revert
	self.values.weapon.mrwi_swap_speed_multiplier[1] = 5
	self.values.weapon.primary_reload_swap_secondary[1] = 10
	self.values.weapon.secondary_reload_swap_primary[1] = 10
	self.specialization_descs[23][1].multiperk2 = "10"

	-- WEAPONS

	-- Movement speed penalty for lmgs and miniguns
	self.weapon_movement_penalty.lmg = 0.85
	self.weapon_movement_penalty.minigun = 0.85

end)


-- Fix Copycat perk descriptions
local mrwi_deck9_options_original = UpgradesTweakData.mrwi_deck9_options
function UpgradesTweakData.mrwi_deck9_options(...)
	local options = mrwi_deck9_options_original(...)

	-- Burglar
	options[7].custom_editable_descs[3] = "20%"

	return options
end
