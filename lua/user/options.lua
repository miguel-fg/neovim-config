-- :help options

local options = {
backup = false,					                  -- creates a backup file
clipboard = "unnamedplus",			          -- allows neovim to access the system clipboard
cmdheight = 2,					                  -- more space in the neovim command line for displaying messages
completeopt = { "menuone", "noselect" }, 	-- mostly just for cmp
conceallevel = 0,				                  -- so that `` is visible in markdown files
fileencoding = "utf-8",				            -- the encoding written to a file
hlsearch = true,					                -- highlight all matches on previous search patterns
ignorecase = true,				                -- ignore case in search patterns
mouse = "a",					                    -- allow the mouse to be used in neovim
pumheight = 10,					                  -- pop up menu height
showtabline = 2,					                -- always show tabs
smartcase = true,				                  -- smart case
showmode = false,
smartindent = true,				                -- make indenting smarter again
splitbelow = true,				                -- force all horizontal splits to go below current window
splitright = true,				                -- force all vertical splits to go to the right of current window
swapfile = false,				                  -- creates a swapfile
termguicolors = true,				              -- set term gui colors (most terminals support this) 
timeoutlen = 1000,				                -- time to wait for a mapped sequence to complete (in milliseconds)
undofile = true,					                -- enable persistent undo
updatetime = 300,				                  -- faster completion (4000ms default)
writebackup = false,				              -- if a file is being edited by another program (or was written to file while editing another program),
expandtab = true,				                  -- convert tabs to spaces
shiftwidth = 2,					                  -- the number of spaces inserted for each indentation
tabstop = 2,					                    -- insert 2 spaces for a tab
cursorline = true,				                -- highlight the current line
number = true,					                  -- set numbered lines
relativenumber = false,				            -- set relative numbered lines
numberwidth = 4,					                -- set number column width to 2 {default 4}
signcolumn = "yes",				                -- always show the sign column, otherwise it would shift the text each time
scrolloff = 8,					                  -- is one of my fav
sidescrolloff = 8,
guifont = "monospace:h17",			          -- the font used in graphical neovim applications
shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
shellquote = "",
shellxquote = "",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]
