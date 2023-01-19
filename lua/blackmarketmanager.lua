-- Uncouple melee knockdown from damage
Hooks:OverrideFunction(BlackMarketManager, "equipped_melee_weapon_damage_info", function (self, lerp_value)
	lerp_value = lerp_value or 0
	local melee_entry = self:equipped_melee_weapon()
	local stats = tweak_data.blackmarket.melee_weapons[melee_entry].stats
	local primary = self:equipped_primary()
	local bayonet_id = self:equipped_bayonet(primary.weapon_id)
	local player = managers.player:player_unit()

	local dmg = math.lerp(stats.min_damage, stats.max_damage, lerp_value)
	local dmg_effect = 0.1 * math.lerp(stats.min_damage_effect, stats.max_damage_effect, lerp_value)

	if bayonet_id and player:movement():current_state()._equipped_unit:base():selection_index() == 2 and melee_entry == "weapon" then
		stats = tweak_data.weapon.factory.parts[bayonet_id].stats
		dmg = dmg + math.lerp(stats.min_damage, stats.max_damage, lerp_value)
		dmg_effect = dmg_effect + math.lerp(stats.min_damage_effect, stats.max_damage_effect, lerp_value)
	end

	return dmg, dmg_effect
end)
