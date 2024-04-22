local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok  then
  return
end

local stat_ok, comments = pcall(require, "ts_context_commentstring")
if not stat_ok then
  return
end

configs.setup {
  ensure_installed = {"c", "lua", "vim", "cpp", "css", "dart", "html", "java", "javascript", "json", "python", "toml", "tsx", "typescript", "vue", "yaml" },
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing 
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension 
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  indent = { enable = true, disable = { "yaml" } },
}

comments.setup {
  enable_autocmd = false,
  languages = {
    typescript = "// %s",
  },
}
