local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim... ")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
  max_jobs = 10,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used in lots of plugins
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})

	-- Completions
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- Buffer completions
	use("hrsh7th/cmp-path") -- Path completions
	use("hrsh7th/cmp-cmdline") -- Cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- Snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- LSP completions
	use("hrsh7th/cmp-nvim-lua") -- Lua completions

	-- Snippets
	use("L3MON4D3/LuaSnip") -- Snippet engine
	use("rafamadriz/friendly-snippets") -- More snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- Enable LSP
	use("williamboman/mason.nvim") -- Simple to use language server installer
	use("williamboman/mason-lspconfig.nvim")
	use("nvimtools/none-ls.nvim") -- LSP diagnostics and code actions

	-- TypeScript Tools
	use({
		"pmizio/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" }
	})

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use("nvim-telescope/telescope-media-files.nvim") -- Doesn't seem to work, missing dependencies!

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	-- use "p00f/nvim-ts-rainbow" DEPRECATED!
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Autopairs
	use("windwp/nvim-autopairs")

	-- Comments
	use("numToStr/Comment.nvim")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- Nvim Tree
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	-- Bufferline
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")

	-- Lualine
	use("nvim-lualine/lualine.nvim")

	-- Toggleterm
	use("akinsho/toggleterm.nvim")

	-- Color schemes
	use("lunarvim/colorschemes")
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- Indent line
	use("lukas-reineke/indent-blankline.nvim")

	-- Alpha
	use("goolord/alpha-nvim")

	-- Projects
	use("ahmedkhalf/project.nvim")

	-- Which key
	use("folke/which-key.nvim")

	-- Discord Rich Presence
	use("andweeb/presence.nvim")

	-- Color Highlighting
	use("brenoprata10/nvim-highlight-colors")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
