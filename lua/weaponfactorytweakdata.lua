Hooks:PostHook(WeaponFactoryTweakData, "create_ammunition", "shc_create_ammunition", function (self)

	-- Reduce buckshot rays
	self.parts.wpn_fps_upg_a_custom.custom_stats.rays = 9
	self.parts.wpn_fps_upg_a_custom_free.custom_stats.rays = 9

end)
