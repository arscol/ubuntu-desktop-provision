require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
        preserve_window_proportions = true,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
        custom = {},
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 500,
    },
    actions = {
        open_file = {
            quit_on_open = false,
            window_picker = {
                enable = false,
            },
        },
    },
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
        if vim.fn.argv(0) == '' then
            require("nvim-tree.api").tree.open()
        end
    end
})
