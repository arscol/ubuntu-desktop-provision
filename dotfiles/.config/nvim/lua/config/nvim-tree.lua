local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', '<C-e>', api.tree.close, opts('Close'))
  vim.keymap.set('n', '<C-n>', api.tree.find_file, opts('Find File'))

  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))

  vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))

  vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
  vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
  vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
  vim.keymap.set('n', 'H', api.node.navigate.sibling.prev, opts('Previous Sibling'))
  vim.keymap.set('n', 'L', api.node.navigate.sibling.next, opts('Next Sibling'))

  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))

  vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
end

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 30,
        side = "left",
        preserve_window_proportions = true,
    },
    renderer = {
        group_empty = true,
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
        },
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
    on_attach = on_attach,
})

vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
        if vim.fn.argv(0) == '' then
            require("nvim-tree.api").tree.open()
        end
    end
})
