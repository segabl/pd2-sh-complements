Hooks:PostHook(BlackMarketTweakData, "init", "shc_init", function (self)

	-- Make melee weapons not ignore weapon movement penalty
	for _, weap_data in pairs(self.melee_weapons) do
		weap_data.stats.remove_weapon_movement_penalty = nil
	end

end)
