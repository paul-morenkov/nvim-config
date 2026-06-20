--
-- Vault layout this assumes:
--   /mnt/d/Obsidian/Neovault/
--   ├── inbox/        new notes land here (zero filing decision at capture)
--   ├── notes/        main body: ideas, books, people, hobbies, study
--   ├── projects/     active things with an outcome
--   ├── moc/          hand-curated index notes
--   ├── _templates/   templates used by :Obsidian template
--   └── _assets/      pasted images, attachments

-- Edit this single constant if your vault path differs. It's reused below
-- both for the workspace and for scoping the in-note keymaps.
local VAULT_PATH = vim.fn.expand("/mnt/d/Obsidian/Neovault")

--------------------------------------------------------------------------------
-- 1. Install
--------------------------------------------------------------------------------

vim.pack.add({
	{
		src = "https://github.com/obsidian-nvim/obsidian.nvim",
		version = vim.version.range("*"), -- latest release; remove for latest commit
	},
})

--------------------------------------------------------------------------------
-- 2. Setup
--------------------------------------------------------------------------------

require("obsidian").setup({
	legacy_commands = false, -- use the new `:Obsidian <subcmd>` interface

	workspaces = {
		{ name = "Neovault", path = VAULT_PATH },
	},

	-- New notes land in inbox/ by default, so capture never requires a filing
	-- decision. Sweep the inbox on a schedule (weekly is plenty).
	new_notes_location = "notes_subdir",
	notes_subdir = "inbox",

	-- Human-readable filenames (slugified title) instead of Zettelkasten
	-- timestamp IDs, so the file tree stays sane when browsed in the GUI.
	-- Falls back to a timestamp only when a note has no title.
	note_id_func = function(title)
		if title ~= nil then
			return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		end
		return tostring(os.time())
	end,

	-- Wikilinks: name-based, auto-update on move/rename, native in both
	-- Neovim and the Obsidian GUI. Display the title, carry the ID for
	-- unambiguous resolution.
	link = {
		style = "wiki",
		format = "shortest",
	},

	-- Minimal frontmatter: aliases + tags + a creation date. You fill the rest.
	-- Any fields you add manually to a note's frontmatter are preserved.
	frontmatter = {
		func = function(note)
			if note.title then
				note:add_alias(note.title)
			end
			local out = {
				aliases = note.aliases,
				tags = note.tags,
				created = os.date("%Y-%m-%d"),
			}
			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end
			return out
		end,
	},

	templates = {
		folder = "_templates",
		date_format = "%Y-%m-%d",
		time_format = "%H:%M",
		substitutions = {},
	},

	picker = {
		name = "snacks.picker",
	},

	attachments = {
		folder = "_assets",
	},

	-- In-buffer concealment/rendering. If it fights your existing markdown
	-- render setup, flip this to false.
	ui = {
		enable = true,
	},
})

--------------------------------------------------------------------------------
-- 3. Global keymaps (available anywhere — getting into the vault)
--------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>on", "<cmd>Obsidian new<cr>", { desc = "Obsidian: new note" })
vim.keymap.set("n", "<leader>oo", "<cmd>Obsidian quick_switch<cr>", { desc = "Obsidian: quick switch" })
vim.keymap.set("n", "<leader>os", "<cmd>Obsidian search<cr>", { desc = "Obsidian: search (ripgrep)" })
vim.keymap.set("n", "<leader>ot", "<cmd>Obsidian tags<cr>", { desc = "Obsidian: tags" })
vim.keymap.set("n", "<leader>oT", "<cmd>Obsidian template<cr>", { desc = "Obsidian: insert template" })

--------------------------------------------------------------------------------
-- 4. In-note keymaps (buffer-local, scoped to the vault)
--------------------------------------------------------------------------------
-- Guarded so they don't shadow bindings in your other markdown files
-- (OpenCAL docs, READMEs, etc.).

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function(args)
		-- Wrap text only in markdown files
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true

		local path = vim.api.nvim_buf_get_name(args.buf)
		if not path:find(VAULT_PATH, 1, true) then
			return
		end

		-- Set conceal level to properly render e.g. checkboxes
		vim.opt_local.conceallevel = 2

		local function bmap(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
		end

		-- navigation / discovery
		bmap("n", "<leader>ob", "<cmd>Obsidian backlinks<cr>", "Obsidian: backlinks")
		bmap("n", "<leader>ol", "<cmd>Obsidian links<cr>", "Obsidian: links in note")
		bmap("n", "<leader>oc", "<cmd>Obsidian toc<cr>", "Obsidian: table of contents")
		bmap("n", "<leader>oi", "<cmd>Obsidian paste_img<cr>", "Obsidian: paste image")

		-- visual-mode refactors
		bmap("v", "<leader>oe", "<cmd>Obsidian extract_note<cr>", "Obsidian: extract selection to note")
		bmap("v", "<leader>ok", "<cmd>Obsidian link<cr>", "Obsidian: link selection")
	end,
})

--------------------------------------------------------------------------------
-- Notes:
--   * <CR> (smart action), [o / ]o (link nav), and grr/grn/gra (LSP backlinks,
--     rename, code actions) are provided by default — not remapped here.
--   * `:Obsidian paste_img` and `:Obsidian open` need `wsl-open` on WSL.
--   * Some refactor commands (rename, extract_note, link) are migrating to LSP
--     code actions in a coming release — reach them via `gra` if a command moves.
--   * Run `:checkhealth obsidian` and `:Obsidian help` to verify against the
--     version you actually have installed.
--------------------------------------------------------------------------------
