require("bufferline").setup{
    options = {
        offsets = {
            {
                filetype = "NvimTree",
                text_align = "left",
            }
        },
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        diagnostics = "nvim_lsp",
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true,
        separator_style = "thin",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
    }
}

vim.api.nvim_set_keymap('n', '<C-w>', '<cmd>bdelete<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-w>', '<Esc><cmd>bdelete<CR>', { noremap = true, silent = true })
