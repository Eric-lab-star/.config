local M = {}

local function GetFileExtension(url)
	return url:match("^.+(%..+)$")
end

function M.IsImage(url)
	local extension = GetFileExtension(url)

	if extension == ".bmp" then
		return true
	elseif extension == ".jpg" or extension == ".jpeg" then
		return true
	elseif extension == ".png" then
		return true
	elseif extension == ".gif" then
		return true
	end

	return false
end


function M.PreviewImage(absolutePath)
	if M.IsImage(absolutePath) then
		local cmd = string.format(
			"!wezterm cli split-pane -- zsh -c 'wezterm imgcat %s; read'",
			absolutePath
		)
		vim.api.nvim_create_user_command("Image", cmd, {})
		vim.api.nvim_cmd({
			cmd = "Image",
			mods = {
				silent = true,
			}
		}, {})
	else
		print("No preview for file " .. absolutePath)
	end
end

function M.PreviewImageOil()
	local use, imported = pcall(require, "oil")
	if use then
		local entry = imported.get_cursor_entry()

		if entry["type"] == "file" then
			local dir = imported.get_current_dir()
			local fileName = entry["name"]
			local fullName = dir .. fileName

			M.PreviewImage(fullName)
		end
	else
		return ""
	end
end

vim.keymap.set("n", "<leader>p", M.PreviewImageOil)
