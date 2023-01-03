local function on_ammo_pickup(unit, pickup_chance, increase)
	if unit == managers.player:player_unit() then
		if math.random() < pickup_chance then
			managers.player:add_grenade_amount(1, true)
			return true, pickup_chance
		else
			pickup_chance = pickup_chance + increase
		end
	end
	return false, pickup_chance
end

PlayerAction.FullyLoaded.Function = function (player_manager, pickup_chance, increase)
	local co = coroutine.running()
	local gained_throwable = false

	-- Convert multiplicative increase to additive
	increase = increase > 1 and increase - 1 or increase

	local function on_ammo_pickup_message(unit)
		gained_throwable, pickup_chance = on_ammo_pickup(unit, pickup_chance, increase)
	end

	player_manager:register_message(Message.OnAmmoPickup, co, on_ammo_pickup_message)
	player_manager:register_message(Message.OnAmmoPickup, co, on_ammo_pickup)

	while not gained_throwable do
		coroutine.yield(co)
	end

	player_manager:unregister_message(Message.OnAmmoPickup, co)
end
