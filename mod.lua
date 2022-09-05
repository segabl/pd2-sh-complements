if not StreamHeistComplements then

	StreamHeistComplements = {
		mod_path = ModPath
	}

	Hooks:Add("LocalizationManagerPostInit", "LocalizationManagerPostInitStreamlinedHeistingComplements", function (loc)

		local function swap_tier_descriptions(desc_id)
			local basic, basic_desc, pro, pro_desc = loc:text(desc_id):match("(.-\n)(.+)\n\n(.-\n)(.+)")
			loc:add_localized_strings({ [desc_id] = tostring(basic) .. tostring(pro_desc) .. "\n\n" .. tostring(pro) .. tostring(basic_desc) })
		end

		-- Swap basic and pro description of Far Away
		swap_tier_descriptions("menu_far_away_beta_desc")

		-- Trigger happy pro description
		local basic, basic_desc, pro = loc:text("menu_trigger_happy_beta_desc"):match("(.-\n)(.+)\n\n(.-\n)")
		loc:add_localized_strings({ menu_trigger_happy_beta_desc = basic .. basic_desc .. "\n\n" .. pro .. basic_desc:gsub("multibasic", "multipro") })

		-- Swap basic and pro description of Bloodthirst
		swap_tier_descriptions("menu_bloodthirst_desc")

		loc:add_localized_strings({
			-- Restore Sociopath first perk name
			menu_deck9_1 = "No Talk",
			-- Remove dodge bonus description from Hacker - Botnet
			menu_deck21_9_desc = loc:text("menu_deck21_9_desc"):gsub("[^%.\n]+%$multiperk2[^\n]+", "")
		})

	end)

end

local required = {}
if RequiredScript and not required[RequiredScript] then

	local fname = StreamHeistComplements.mod_path .. RequiredScript:gsub(".+/(.+)", "lua/%1.lua")
	if io.file_is_readable(fname) then
		dofile(fname)
	end

	required[RequiredScript] = true

end
