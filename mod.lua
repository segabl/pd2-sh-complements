if not StreamHeistComplements then

	StreamHeistComplements = {
		mod_path = ModPath,
		required = {}
	}

	Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInitStreamlinedHeistingComplements", function (loc)

		local function swap_tier_descriptions(desc_id)
			local basic, basic_desc, pro, pro_desc = loc:text(desc_id):match("(.-\n)(.+)\n\n(.-\n)(.+)")
			return tostring(basic) .. tostring(pro_desc) .. "\n\n" .. tostring(pro) .. tostring(basic_desc)
		end

		local th_basic, th_basic_desc, th_pro = loc:text("menu_trigger_happy_beta_desc"):match("(.-\n)(.+)\n\n(.-\n)")
		loc:add_localized_strings({
			menu_single_shot_ammo_return_beta_desc = loc:text("menu_single_shot_ammo_return_beta_desc"):gsub("bullet", "bullets"),
			menu_far_away_beta_desc = swap_tier_descriptions("menu_far_away_beta_desc"),
			menu_trigger_happy_beta_desc = th_basic .. th_basic_desc .. "\n\n" .. th_pro .. th_basic_desc:gsub("multibasic", "multipro"),
			menu_bloodthirst_desc = swap_tier_descriptions("menu_bloodthirst_desc"),
			-- Restore Sociopath first perk name
			menu_deck9_1 = "No Talk",
			-- Remove cooldown text from Gambler - Ammo Give Out
			menu_deck10_3_desc = loc:text("menu_deck10_3_desc"):gsub("\n.-%$multiperk2[^\n]+", ""),
			-- Remove dodge bonus description from Hacker - Botnet
			menu_deck21_9_desc = loc:text("menu_deck21_9_desc"):gsub("[^%.\n]+%$multiperk2[^\n]+", "")
		})

	end)

end

if RequiredScript and not StreamHeistComplements.required[RequiredScript] then

	local fname = StreamHeistComplements.mod_path .. RequiredScript:gsub(".+/(.+)", "lua/%1.lua")
	if io.file_is_readable(fname) then
		dofile(fname)
	end

	StreamHeistComplements.required[RequiredScript] = true

end
