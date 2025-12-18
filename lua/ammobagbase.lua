-- Reduce ace duration (values are adjusted for the ammo requirement change)
AmmoBagBase._BULLET_STORM = { 5, 15 }

-- Rework bullet storm to require only one gun to be fully empty to get the max duration
function AmmoBagBase:take_ammo(unit)
	if self._empty then
		return false, false
	end

	local taken = self:_take_ammo(unit)
	if taken > 0 then
		unit:sound():play("pickup_ammo")
		managers.network:session():send_to_peers_synched("sync_ammo_bag_ammo_taken", self._unit, self._ammo_amount <= 0 and self._max_ammo_amount or taken)
	end

	if self._ammo_amount <= 0 then
		self:_set_empty()
	else
		self:_set_visual_stage()
	end

	return taken > 0, self._bullet_storm_level and self._bullet_storm_level > 0 and self._BULLET_STORM[self._bullet_storm_level] * math.min(1, taken) or false
end
