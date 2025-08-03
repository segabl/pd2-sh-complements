-- Fix melee weapon stat display
Hooks:PreHook(BlackMarketGui, "reload", "shc_reload", function(self)
	self._shc_patch = nil
end)

Hooks:PreHook(BlackMarketGui, "on_slot_selected", "shc_on_slot_selected", function(self)
	if self._shc_patch then
		return
	end
	for _, v in pairs(self._mweapon_stats_shown) do
		if v.name == "damage_effect" then
			v.multiple_of = nil
			self._shc_patch = true
			return
		end
	end
end)

Hooks:PostHook(BlackMarketGui, "_setup", "shc__setup", function(self)
	if not self._mweapon_stats_shown then
		return
	end

	for _, stat in ipairs(self._mweapon_stats_shown) do
		for column_name, text in pairs(self._mweapon_stats_texts[stat.name]) do
			if column_name ~= "name" then
				text:set_font_size(text:font_size() * 0.9)
				text:set_vertical("center")
			end
		end
	end
end)
