Hooks:PostHook(CopDamage, "convert_to_criminal", "shc_convert_to_criminal", function(self)
	self._damage_reduction_multiplier = self._damage_reduction_multiplier * 0.25
end)
