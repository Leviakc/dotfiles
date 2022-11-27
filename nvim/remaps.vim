let mapleader=" "

inoremap jk <ESC>
inoremap kj <ESC>

"Show output with no browser needed  
nmap <leader>nn :w !node<CR>

nmap <leader>scl :set conceallevel=0<CR>

nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>e :x<CR>
nmap <leader>as :q!<CR>

"Highlight searh
nnoremap <leader>to :set hlsearch!<cr>

nnoremap <leader>so :source%<cr>

"nmap <leader>; $a;<CR>
nmap <leader>rr <c-r><CR>
nmap <leader>do :t.<CR>

"Terminals hor and ver
nnoremap <leader>tv :botright vnew <Bar> :terminal<cr>
nnoremap <leader>th :botright new <Bar> :terminal<cr>

"Move lines like vscode
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-1<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"Emoji 
nmap <leader>em :Telescope symbols<CR>

"Screen Shot
vmap <leader>ss :TakeScreenShot<CR>

"Split resize 
nnoremap <leader>1 4<C-w>>
nnoremap <leader>2 4<C-w>< 
nnoremap <leader>up :resize -3<CR>
nnoremap <leader>dn :resize +3<CR>  

"Window move
nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l 

"Rnvimr
map <leader>ra :RnvimrToggle<CR>
map <leader>rs :RnvimrResize<CR>

"Markdown
map <leader>M :MarkdownPreviewToggle<CR>

"Nvim todo list
nmap <leader>td :TodoLocList<CR>

"Delete all
nmap <leader>da :%d<CR>

"Yank all
nmap <leader>ya :%y<CR>

"Select all 
nmap <leader>va ggVG<CR>


" ^ and $ is too uncomfortable to type
"normal mode
nmap <leader>0 ^ 
nmap <leader>4 $
"visual mode
vmap <leader>0 ^
vmap <leader>4 $

"Hop
nmap <leader>hw :HopWord<CR>
nmap <leader>hc :HopChar1<CR>
nmap <leader>hp :HopPattern<CR>

"Nvim-tree
nmap <leader>nt :NvimTreeToggle<CR>
nmap <leader>ntf :NvimTreeFindFileToggle<CR>

"tabnext 
"nnoremap <silent>    <A-l> <Cmd>tabnext<CR>
"tabprevious
"nnoremap <silent>    <A-h> <Cmd>tabprevious<CR>
