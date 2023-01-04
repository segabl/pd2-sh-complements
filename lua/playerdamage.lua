-- Make revive health boost additive
function PlayerDamage:set_revive_boost(revive_health_level)
	local revive_step = tweak_data.player.damage.REVIVE_HEALTH_STEPS[self._revive_health_i]
	local revive_mul = tweak_data.upgrades.revive_health_multiplier[revive_health_level]
	self._revive_health_multiplier = (1 / revive_step) * (revive_step + revive_mul - 1)
end
