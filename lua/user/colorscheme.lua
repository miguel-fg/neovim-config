--vim.cmd "colorscheme default"
require("catppuccin").setup({
  flavour = "macchiato",
  no_italic = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
  }
})

vim.cmd.colorscheme "catppuccin"
