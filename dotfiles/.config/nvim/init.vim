set encoding=utf-8
set number
set relativenumber
set mouse=a
set ignorecase
set smartcase
set hidden
set termguicolors
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus

call plug#begin('~/.local/share/nvim/plugged')

Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-ts-autotag'
Plug 'dense-analysis/ale'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

call plug#end()

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

lua require('config/nvim-tree')
lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}
lua require('config/bufferline')

let g:ale_linters = {
\   'sh': ['shellcheck'],
\   'javascript': ['eslint'],
\   'rust': ['analyzer'],
\   'toml': ['taplo'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'rust': ['rustfmt'],
\}

let g:ale_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = 'ℹ'
let g:ale_rust_rustfmt_options = '--edition 2018'
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_rust_cargo_use_clippy = 1

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

nnoremap <silent> <C-Space> <cmd>lua require('telescope.builtin').find_files({
  \ hidden = true,
  \ no_ignore = false,
  \ no_ignore_parent = true,
  \ file_ignore_patterns = { "^.git/" },
  \ })<CR>
nnoremap <silent> <C-f> <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent> <C-S-f> <cmd>Telescope live_grep<CR>

nnoremap <silent> <C-e> :lua require("nvim-tree.api").tree.toggle({ focus = false })<CR>
nnoremap <silent> <C-n> :NvimTreeFindFile<CR>

command! T botright split | resize 10 | terminal

augroup my_autocommands
  autocmd!
  autocmd BufEnter * :set hlsearch!
  autocmd VimEnter * silent! NvimTreeOpen
  autocmd BufWritePre * %s/\s\+$//e
augroup END

highlight Normal guibg=NONE ctermbg=NONE
highlight NonText guibg=NONE ctermbg=NONE
highlight LineNr guibg=NONE ctermbg=NONE
highlight Folded guibg=NONE ctermbg=NONE
highlight EndOfBuffer guibg=NONE ctermbg=NONE
highlight SignColumn guibg=NONE ctermbg=NONE
highlight NvimTreeNormal guibg=NONE ctermbg=NONE
highlight TelescopeNormal guibg=NONE ctermbg=NONE
highlight BufferLineBackground guibg=NONE ctermbg=NONE

if executable('wl-copy')
    let g:clipboard = {
        \   'name': 'wl-clipboard',
        \   'copy': {
        \      '+': 'wl-copy --foreground --type text/plain',
        \      '*': 'wl-copy --foreground --type text/plain --primary',
        \    },
        \   'paste': {
        \      '+': 'wl-paste --no-newline',
        \      '*': 'wl-paste --no-newline --primary',
        \   },
        \   'cache_enabled': 1,
        \ }
endif
