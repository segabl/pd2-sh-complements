-- Rework tombstone
Hooks:PostHook(DOTTweakData, "init", "shc_init", function (self)
	self.dot_entries.poison.ammo_rip.hurt_animation_chance = 0.25
	self.dot_entries.poison.ammo_rip.dot_damage = 4
	self.dot_entries.poison.ammo_rip.dot_length = 10
end)
