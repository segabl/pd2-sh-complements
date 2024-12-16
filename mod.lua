if not StreamHeistComplements then

	StreamHeistComplements = {
		mod_path = ModPath,
		save_path = SavePath .. "streamlined_heisting_complements.json",
		required = {},
		settings = {
			incremental_recoil = false
		}
	}

	Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInitStreamlinedHeistingComplements", function (loc)

		local function swap_tier_descriptions(desc_id)
			local basic, basic_desc, pro, pro_desc = loc:text(desc_id):match("(.-\n)(.+)\n\n(.-\n)(.+)")
			return tostring(basic) .. tostring(pro_desc) .. "\n\n" .. tostring(pro) .. tostring(basic_desc)
		end

		local ovk_basic, ovk_basic_desc, ovk_pro, ovk_pro_desc = loc:text("menu_overkill_beta_desc"):match("(.-\n)(.+)\n\n(.-\n)(.+)")
		local th_basic, th_basic_desc, th_pro = loc:text("menu_trigger_happy_beta_desc"):match("(.-\n)(.+)\n\n(.-\n)")
		loc:add_localized_strings({
			menu_single_shot_ammo_return_beta_desc = loc:text("menu_single_shot_ammo_return_beta_desc"):gsub("bullet", "bullets"),
			menu_far_away_beta_desc = swap_tier_descriptions("menu_far_away_beta_desc"),
			menu_overkill_beta_desc = ovk_basic .. ovk_basic_desc .. "\n\n" .. ovk_pro .. ovk_basic_desc:gsub("multibasic2", "multipro2") .. "\n\n" .. ovk_pro_desc,
			menu_trigger_happy_beta_desc = th_basic .. th_basic_desc .. "\n\n" .. th_pro .. th_basic_desc:gsub("multibasic", "multipro"),
			menu_bloodthirst_desc = swap_tier_descriptions("menu_bloodthirst_desc"),
			-- Restore Sociopath first perk name
			menu_deck9_1 = "No Talk",
			-- Remove cooldown text from Gambler - Ammo Give Out
			menu_deck10_3_desc = loc:text("menu_deck10_3_desc"):gsub("\n.-%$multiperk2[^\n]+", ""),
			-- Remove dodge bonus description from Hacker - Botnet
			menu_deck21_9_desc = loc:text("menu_deck21_9_desc"):gsub("[^%.\n]+%$multiperk2[^\n]+", "")
		})

		if HopLib then
			HopLib:load_localization(StreamHeistComplements.mod_path .. "loc/", loc)
		else
			loc:load_localization_file(StreamHeistComplements.mod_path .. "loc/english.txt")
		end

	end)

	Hooks:Add("MenuManagerBuildCustomMenus", "MenuManagerBuildCustomMenusStreamlinedHeistingComplements", function(_, nodes)

		local menu_id = "shc_menu"

		MenuHelper:NewMenu(menu_id)

		function MenuCallbackHandler:shc_toggle(item)
			StreamHeistComplements.settings[item:name()] = (item:value() == "on")
		end

		function MenuCallbackHandler:shc_save()
			io.save_as_json(StreamHeistComplements.settings, StreamHeistComplements.save_path)
		end

		MenuHelper:AddToggle({
			id = "incremental_recoil",
			title = "shc_menu_incremental_recoil",
			desc = "shc_menu_incremental_recoil_desc",
			callback = "shc_toggle",
			value = StreamHeistComplements.settings.incremental_recoil,
			menu_id = menu_id,
			priority = 99
		})

		nodes[menu_id] = MenuHelper:BuildMenu(menu_id, { back_callback = "shc_save" })
		MenuHelper:AddMenuItem(nodes["blt_options"], menu_id, "shc_menu_main")

	end)

	if io.file_is_readable(StreamHeistComplements.save_path) then
		StreamHeistComplements.settings = io.load_as_json(StreamHeistComplements.save_path) or StreamHeistComplements.settings
	end

end

if RequiredScript and not StreamHeistComplements.required[RequiredScript] then

	local fname = StreamHeistComplements.mod_path .. RequiredScript:gsub(".+/(.+)", "lua/%1.lua")
	if io.file_is_readable(fname) then
		dofile(fname)
	end

	StreamHeistComplements.required[RequiredScript] = true

end
