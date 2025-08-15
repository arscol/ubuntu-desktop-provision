lua <<EOF
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    "bash", "c", "cpp", "css", "go", "html", "java", "javascript",
    "json", "lua", "python", "rust", "typescript", "vim", "markdown", "yaml",
    "rust", "php"
  },

  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true,
    disable = { "python", "yaml" },
  },

  autotag = {
    enable = true,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})
EOF
