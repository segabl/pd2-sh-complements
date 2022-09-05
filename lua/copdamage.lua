-- Fixed critical hit multiplier
function CopDamage:roll_critical_hit(attack_data)
	if not self:can_be_critical(attack_data) or math.random() >= managers.player:critical_hit_chance() then
		return false, attack_data.damage
	end

	return true, attack_data.damage * 3
end
