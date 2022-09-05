-- No aim assist
Hooks:PostHook(RaycastWeaponBase, "init", "shc_init", function (self)
	if self._autohit_data then
		self._autohit_current = 0
		self._autohit_data.INIT_RATIO = 0
		self._autohit_data.MIN_RATIO = 0
		self._autohit_data.MAX_RATIO = 0
	end
end)

-- Make ammo pickup add remainder of previous pickup
Hooks:OverrideFunction(RaycastWeaponBase, "add_ammo", function (self, ratio, add_amount_override)
	local function _add_ammo(ammo_base, ratio, add_amount_override)
		if ammo_base:get_ammo_max() == ammo_base:get_ammo_total() then
			return false, 0
		end

		local multiplier_min = 1
		local multiplier_max = 1
		if ammo_base._ammo_data and ammo_base._ammo_data.ammo_pickup_min_mul then
			multiplier_min = ammo_base._ammo_data.ammo_pickup_min_mul
		else
			multiplier_min = managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)
			multiplier_min = multiplier_min + managers.player:upgrade_value("player", "pick_up_ammo_multiplier_2", 1) - 1
			multiplier_min = multiplier_min + managers.player:crew_ability_upgrade_value("crew_scavenge", 0)
		end

		if ammo_base._ammo_data and ammo_base._ammo_data.ammo_pickup_max_mul then
			multiplier_max = ammo_base._ammo_data.ammo_pickup_max_mul
		else
			multiplier_max = managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1)
			multiplier_max = multiplier_max + managers.player:upgrade_value("player", "pick_up_ammo_multiplier_2", 1) - 1
			multiplier_max = multiplier_max + managers.player:crew_ability_upgrade_value("crew_scavenge", 0)
		end

		local pickup, picked_up
		if add_amount_override then
			pickup = add_amount_override * (ratio or 1)
			picked_up = true
		else
			local pickup_min = ammo_base._ammo_pickup[1] * multiplier_min
			local pickup_max = ammo_base._ammo_pickup[2] * multiplier_max
			picked_up = pickup_max > 0
			pickup = math.lerp(pickup_min, pickup_max, math.random()) * (ratio or 1) + (ammo_base._pickup_leftover or 0)
		end

		local add_amount = math.floor(pickup)

		ammo_base._pickup_leftover = pickup - add_amount

		ammo_base:set_ammo_total(math.clamp(ammo_base:get_ammo_total() + add_amount, 0, ammo_base:get_ammo_max()))

		return picked_up, add_amount
	end

	local picked_up, add_amount
	picked_up, add_amount = _add_ammo(self, ratio, add_amount_override)

	if self.AKIMBO then
		local akimbo_rounding = self:get_ammo_total() % 2 + #self._fire_callbacks
		if akimbo_rounding > 0 then
			_add_ammo(self, nil, akimbo_rounding)
		end
	end

	for _, gadget in ipairs(self:get_all_override_weapon_gadgets()) do
		if gadget and gadget.ammo_base then
			local p, a = _add_ammo(gadget:ammo_base(), ratio, add_amount_override)
			picked_up = p or picked_up
			add_amount = add_amount + a

			if self.AKIMBO then
				local akimbo_rounding = gadget:ammo_base():get_ammo_total() % 2 + #self._fire_callbacks
				if akimbo_rounding > 0 then
					_add_ammo(gadget:ammo_base(), nil, akimbo_rounding)
				end
			end
		end
	end

	return picked_up, add_amount
end)
