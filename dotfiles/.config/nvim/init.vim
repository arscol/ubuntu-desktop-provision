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

call plug#end()

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

lua require('config/nvim-tree')
lua require'nvim-treesitter.configs'.setup{highlight={enable=true}}

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'sh': ['shellcheck'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\}

let g:ale_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

nnoremap <silent> <C-Space> <cmd>Telescope find_files<CR>
nnoremap <silent> <C-f> <cmd>Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent> <C-S-f> <cmd>Telescope live_grep<CR>
nnoremap <silent> <C-e> :lua require("nvim-tree.api").tree.toggle({ focus = false })<CR>
nnoremap <silent> <C-r> :NvimTreeRefresh<CR>
nnoremap <silent> <C-n> :NvimTreeFindFile<CR>

augroup my_autocommands
  autocmd!
  autocmd BufEnter * :set hlsearch!
  autocmd VimEnter * silent! NvimTreeOpen
  autocmd BufWritePre * %s/\s\+$//e
augroup END
