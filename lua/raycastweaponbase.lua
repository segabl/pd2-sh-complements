-- No aim assist
Hooks:PostHook(RaycastWeaponBase, "init", "shc_init", function(self)
	if self._autohit_data then
		self._autohit_current = 0
		self._autohit_data.INIT_RATIO = 0
		self._autohit_data.MIN_RATIO = 0
		self._autohit_data.MAX_RATIO = 0
	end
end)

-- Allow shooting with empty mag during bullet storm
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

-- Allow friendly fire hits with Revive dart
function ReviveInstantBulletBase:chk_friendly_fire()
	return false
end

function ReviveInstantBulletBase:give_revive_damage(hit_unit, user_unit)
	if not alive(hit_unit) then
		return
	end

	local base_ext = hit_unit:base()
	local dmg_ext = hit_unit:character_damage()
	if not base_ext or not dmg_ext or dmg_ext:dead() then
		return
	end

	local needs_revive
	if base_ext.is_husk_player then
		needs_revive = hit_unit:interaction():active() and hit_unit:movement():need_revive() and hit_unit:movement():current_state_name() ~= "arrested"
	elseif dmg_ext.need_revive then
		needs_revive = hit_unit:interaction() and dmg_ext:need_revive()
	end

	if needs_revive then
		hit_unit:interaction():interact(user_unit)
		return
	end

	if not hit_unit:movement().cool or hit_unit:movement():cool() then
		return
	end

	local char_tweak = base_ext and base_ext.char_tweak and base_ext:char_tweak()
	if not char_tweak or char_tweak.can_be_healed == false then
		return false
	end

	if dmg_ext and dmg_ext.do_medic_heal_and_action then
		dmg_ext:do_medic_heal_and_action(true)
	end
end
