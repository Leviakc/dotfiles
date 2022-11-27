set splitright
set number
set mouse=a
set numberwidth=1
set clipboard+=unnamedplus
syntax enable
set showcmd 
set ruler 
set encoding=UTF-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode
set shiftwidth=2
set colorcolumn=80
set textwidth=79
set smartindent
set tabstop=2
set softtabstop=4
set autoindent 
set exrc
set hidden
set noerrorbells
set scrolloff=6
set signcolumn=yes
set noswapfile
set nobackup
set updatetime=100
set backupcopy=yes " Necessary for ParcelJS to work
set conceallevel=0
set termguicolors
set t_Co=256
"b:coc_nav
set hlsearch
set nohlsearch
set cursorline

" don't know what it is for
"set listchars+=eol:↲ 

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Give more space for displaying messages.
set cmdheight=1

so ~/.config/nvim/remaps.vim
so ~/.config/nvim/plugins.vim
so ~/.config/nvim/config.lua
so ~/.config/nvim/vimscript-config.vim

let g:LanguageClient_serverCommands = {
\ 'prolog': ['swipl',
\            '-g', 'use_module(library(lsp_server)).',
\            '-g', 'lsp_server:main',
\            '-t', 'halt',
\            '--', 'stdio']
\ }

"command! -nargs=0 Prettier :CocCommand prettier.formatFile

"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html Prettier

"Theme
" Vim Script
"let g:catppuccin_flavour = "latte" "latte, frappe, macchiato, mocha
colorscheme catppuccin-mocha
"colorscheme tokyonight 

"rainbow colors
hi rainbowcol1 guifg=#ced4da 
hi rainbowcol2 guifg=#b197fc
hi rainbowcol3 guifg=#ffd8a8
hi rainbowcol4 guifg=#91a7ff
hi rainbowcol5 guifg=#96f2d7 
hi rainbowcol6 guifg=#da77f2
hi rainbowcol7 guifg=#ffc9c9

"hi  LineNrAbove guifg=#91a7ff
"hi  LineNrBelow guifg=#91a7ff
hi  LineNr guifg=#91a7ff
hi  CursorLineNr guifg=#fff

"NvimTree
"vim.g.loaded_netrw = 1
"
"vim.g.loaded_netrwPlugin = 1

"We can do math operations in insert mode with <ctrl-r> = <number> <cr> for
"example <ctrl-r> = 21+21 <cr> 
"
"
"
  ""suggest.completionItemKindLabels": {
    ""function": "\uf794 Function",
    ""method": "\uea8c Method",
    ""variable": "\uea88 Variable",
    ""constant": "\ueb5d Constant",
    ""struct": "\uea91 Struct",
    ""class": "\ueb5b Class",
    ""interface": "\ueb61 Interface",
    ""text": "\uf15c Text",
    ""enum": "\uea95 Enum",
    ""enumMember": "\ueb5e EnumMember",
    ""module": "\ufa72 Module",
    ""color": "\ueb5c Color",
    ""property": "\ueb65 Property",
    ""field": "\ueb5f Field",
    ""unit": "\uf475",
    ""file": "\uea7b File",
    ""value": "\uf8a3",
    ""event": "\uea86 Event",
    ""folder": "\uea83 Folder",
    ""keyword": "\ueb62 Keyword",
    ""snippet": "\ueb66 Snippet",
    ""operator": "\ueb64 Operator",
    ""reference": "\ueb36 Reference",
    ""typeParameter": "\uf278",
    ""default": "\ue612 Default"
