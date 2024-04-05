-- Hacky way to revert copycat weapon swap functionality, replace the instant swap with increased swap speed
local upgrade_value_original = PlayerManager.upgrade_value
function PlayerManager:upgrade_value(category, upgrade, ...)
	if category == "weapon" and upgrade == "mrwi_swap_speed_multiplier" then
		if self._temporary_properties:has_active_property("intant_swap_to_secondary") or self._temporary_properties:has_active_property("intant_swap_to_primary") then
			-- Called twice, once on unequip once on equip, so track that
			if self._mrwi_swap_speed_multiplier_called then
				self:remove_temporary_property("intant_swap_to_secondary")
				self:remove_temporary_property("intant_swap_to_primary")
				self._mrwi_swap_speed_multiplier_called = false
			else
				self._mrwi_swap_speed_multiplier_called = true
			end
			return tweak_data.upgrades.values.weapon.mrwi_swap_speed_multiplier[1]
		end
	end

	return upgrade_value_original(self, category, upgrade, ...)
end

local has_active_temporary_property_original = PlayerManager.has_active_temporary_property
function PlayerManager:has_active_temporary_property(name, ...)
	if name ~= "intant_swap_to_secondary" and name ~= "intant_swap_to_primary" then
		return has_active_temporary_property_original(self, name, ...)
	end
end

-- Prevent healing with Copycat when Berserker is active
local on_headshot_dealt_original = PlayerManager.on_headshot_dealt
function PlayerManager:on_headshot_dealt(...)
	PlayerDamage.force_chk_health_ratio = true
	on_headshot_dealt_original(self, ...)
	PlayerDamage.force_chk_health_ratio = false
end
