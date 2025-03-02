-- Fix fire position when tripmines are placed against walls
local fire_pos = Vector3()
local origin_pos = Vector3()
function TripMineBase:_spawn_environment_fire(user_unit, added_time, range_multiplier)
	local data = tweak_data.env_effect:trip_mine_fire()
	local rotation = self._unit:rotation()
	local normal = rotation:y()

	mvector3.set(origin_pos, normal)
	mvector3.multiply(origin_pos, 30)
	mvector3.add(origin_pos, self._unit:position())

	local range = data.range * range_multiplier
	local dot = math.abs(mvector3.dot(normal, math.UP))
	mvector3.set(fire_pos, normal)
	mvector3.multiply(fire_pos, math.lerp(range * 2, 0, dot))
	mvector3.add(fire_pos, origin_pos)

	local col_ray = World:raycast("ray", origin_pos, fire_pos, "slot_mask", managers.slot:get_mask("molotov_raycasts"))
	mvector3.set(fire_pos, normal)
	mvector3.multiply(fire_pos, col_ray and col_ray.distance * 0.5 or math.lerp(range, 0, dot))
	mvector3.add(fire_pos, origin_pos)

	local _, time_until_destruction = EnvironmentFire.spawn(fire_pos, rotation, data, dot < 0.5 and math.UP or normal, user_unit, self._unit, added_time, range_multiplier)

	return time_until_destruction
end
