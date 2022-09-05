PlayerAction.TriggerHappy.Function = function (player_manager, damage_bonus, max_stacks, max_time)
	local co = coroutine.running()
	local current_stacks = 1
	local duration = max_time - Application:time()

	local function on_hit(unit, attack_data)
		if attack_data.attacker_unit == player_manager:player_unit() and attack_data.variant == "bullet" then
			current_stacks = current_stacks + 1
			max_time = Application:time() + duration
			player_manager:set_property("trigger_happy", 1 + damage_bonus * math.min(current_stacks, max_stacks))
		end
	end

	player_manager:set_property("trigger_happy", 1 + damage_bonus)
	player_manager:register_message(Message.OnEnemyShot, co, on_hit)

	while Application:time() < max_time and player_manager:is_current_weapon_of_category("pistol") do
		coroutine.yield(co)
	end

	player_manager:remove_property("trigger_happy")
	player_manager:unregister_message(Message.OnEnemyShot, co)
end
