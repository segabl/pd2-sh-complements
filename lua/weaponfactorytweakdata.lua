Hooks:PostHook(WeaponFactoryTweakData, "create_ammunition", "shc_create_ammunition", function (self)

	-- Reduce buckshot/poison rays
	self.parts.wpn_fps_upg_a_custom.custom_stats.rays = 9
	self.parts.wpn_fps_upg_a_custom_free.custom_stats.rays = 9
	self.parts.wpn_fps_upg_a_rip.custom_stats.rays = 9

	-- Increase AP slug accuracy
	self.parts.wpn_fps_upg_a_slug.stats.moving_spread = 6
	self.parts.wpn_fps_upg_a_slug.stats.spread = 6

end)
