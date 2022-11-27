call plug#begin('~/.config/nvim/plugged')

"Some shit
Plug 'dhruvasagar/vim-table-mode'
"Plug 'SergioRibera/vim-screenshot', { 'do': 'npm install --prefix Renderizer' }
Plug 'narutoxy/silicon.lua'

" Markdown
" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

"Themes and colors
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'brenoprata10/nvim-highlight-colors'
Plug 'ziontee113/color-picker.nvim'

"Status bar and tabs
"Plug 'romgrk/barbar.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
"Plug 'tiagovla/scope.nvim'
"This is needed for bufferline
Plug 'moll/vim-bbye'
Plug 'nvim-lualine/lualine.nvim'

"IDE
Plug 'mattn/emmet-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'kylechui/nvim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'alvan/vim-closetag'
Plug 'jiangmiao/auto-pairs'
Plug 'folke/todo-comments.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'scrooloose/nerdcommenter'
" Track the engine.
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'joaohkfaria/vim-jest-snippets'

"Treesiter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'p00f/nvim-ts-rainbow'
Plug 'windwp/nvim-ts-autotag'

"Navigate
Plug 'petertriho/nvim-scrollbar'
Plug 'kevinhwang91/rnvimr' "Range inside neovim
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'nvim-telescope/telescope.nvim'
Plug 'phaazon/hop.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'

"Icons
Plug 'kyazdani42/nvim-web-devicons'

"Git
Plug 'sindrets/diffview.nvim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"For lua plugs
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'

call plug#end()

"Plug 'maximbaz/lightline-ale'
""Test
""Plug 'tyewang/vimux-jest-test'
""Plug 'janko-m/vim-test'
"Plug 'mhartington/oceanic-next'
"Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
"Plug 'edluffy/hologram.nvim'
""Plug 'folke/twilight.nvim'
"Plug 'NTBBloodbath/rest.nvim'
"Plug 'mfussenegger/nvim-dap'
" Context-commentstring
"Plug 'numToStr/Comment.nvim'
"indent
"Plug 'yggdroot/indentline'

