-- Make revive health boost additive
function PlayerDamage:set_revive_boost(revive_health_level)
	local revive_step = tweak_data.player.damage.REVIVE_HEALTH_STEPS[self._revive_health_i]
	local revive_mul = tweak_data.upgrades.revive_health_multiplier[revive_health_level]
	self._revive_health_multiplier = (1 / revive_step) * (revive_step + revive_mul - 1)
end

-- Don't trigger Copycat Grace Period on armor damage
local _calc_health_damage_original = PlayerDamage._calc_health_damage
function PlayerDamage:_calc_health_damage(attack_data, ...)
	if not self._has_mrwi_health_invulnerable or attack_data.damage > 0 or self:get_real_armor() <= 0 then
		return _calc_health_damage_original(self, attack_data, ...)
	end

	self._has_mrwi_health_invulnerable = false
	local health_subtracted = _calc_health_damage_original(self, attack_data, ...)
	self._has_mrwi_health_invulnerable = true

	return health_subtracted
end

-- Prevent healing with Copycat when Berserker is active
local restore_health_original = PlayerDamage.restore_health
function PlayerDamage:restore_health(health_restored, is_static, chk_health_ratio, ...)
	return restore_health_original(self, health_restored, is_static, self.force_chk_health_ratio or chk_health_ratio, ...)
end
