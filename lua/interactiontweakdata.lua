-- Reduce drill upgrade time
Hooks:PostHook(InteractionTweakData, "init", "shc_init", function (self)
	self.drill_upgrade.timer = 5
	self.lance_upgrade.timer = 5
	self.gen_int_saw_upgrade.timer = 5
end)
