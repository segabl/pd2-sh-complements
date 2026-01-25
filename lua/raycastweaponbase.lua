-- No aim assist
Hooks:PostHook(RaycastWeaponBase, "init", "shc_init", function(self)
	if self._autohit_data then
		self._autohit_current = 0
		self._autohit_data.INIT_RATIO = 0
		self._autohit_data.MIN_RATIO = 0
		self._autohit_data.MAX_RATIO = 0
	end
end)

Hooks:PostHook(RaycastWeaponBase, "clip_empty", "shc_clip_empty", function(self)
	if self._setup.user_unit == managers.player:player_unit() and managers.player:has_active_temporary_property("bullet_storm") then
		return false
	end
end)

Hooks:PostHook(RaycastWeaponBase, "out_of_ammo", "shc_out_of_ammo", function(self)
	if self._setup.user_unit == managers.player:player_unit() and managers.player:has_active_temporary_property("bullet_storm") then
		return false
	end
end)
