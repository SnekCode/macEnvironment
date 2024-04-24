"r
" 'NOTES'
"
"Mapping
"nnoremap – Allows you to map keys in normal mode.
"inoremap – Allows you to map keys in insert mode.
"vnoremap – Allows you to map keys in visual mode.
"<silent> means do not display output.
"
"
"
"
" leader map
let mapleader=" "
nnoremap <SPACE> <Nop>

" wild menu
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" set timeout delay / escape key delay fix
set timeoutlen=1000 ttimeoutlen=0

" swap files
set swapfile
set directory=/tmp

" settings for code
syntax on
set showmatch
colorscheme onedarkhc
set number
set showcmd
set ruler
" tab replace and display
" 50
  set expandtab
set tabstop=2
set encoding=UTF-8
" Pictures
autocmd BufEnter *.png,*.jpg,*gif exec "! ~/.iterm2/imgcat ".expand("%") | :bw

"coc keymaps
"rename 
nmap <leader>rn <Plug>(coc-rename)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Allow tab to traverse options in auto-complete window, refresh on backspace    
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>":<SID>check_back_space() ? "\<TAB>":coc#refresh()               
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"      
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    
" Check if backspace was just pressed      
function! s:check_back_space() abort                    
  let col = col('.') - 1    
  return !col || getline('.')[col - 1]  =~# '\s'    
endfunction   



" cursor display iterm2 and tmux
" let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
" let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
" let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"


if exists('$TMUX')
      let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
  else
      let &t_SI = "\e[5 q"
      let &t_EI = "\e[2 q"
  endif

" undo
nnoremap <F5> :UndotreeToggle<CR>
set undodir=~/.vim/undo/
set undofile

" search
set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap <leader>/ :nohlsearch<CR>
nnoremap n nzz
nnoremap N Nzz

"paste
xnoremap p pgvy

"movement
nnoremap j gj
nnoremap k gk
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
" inoremap <leader>k <Esc>:m .+1<CR>==gi
" inoremap <leader>j <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

"commands
command QQ q!
command W wq

" Panes
nnoremap <leader>h :sp <CR>
nnoremap <leader>v :vsp <CR>



" Pane Resize
nnoremap <silent><Down> :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent><Up> :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent><Right> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent><Left> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

" Leader commands


" Key mapping
nnoremap <leader>n :NERDTreeFocusToggle<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeTabsToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" nerd tree
set modifiable
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree



" git
set updatetime=100
set signcolumn=yes
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" python syntax
let g:python_highlight_all = 1
syntax match pythonComment "\v#$"
highlight link pythonComment Comment



" python syntax style
highlight pythonComment ctermfg=2



" Plugins
set nocp
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-python/python-syntax'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'mbbill/undotree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mjbrownie/swapit'
Plugin 'ryanoasis/vim-devicons'
Plugin 'preservim/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'PhilRunninger/nerdtree-visual-selection'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin 'ycm-core/YouCompleteMe'
call vundle#end()

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()







filetype plugin indent on

function Test(...)
    " Map each type of file to the command used to
    "  execute it
    "
    " NOTE: % is the path and name of the current
    "  file. To see this we can run the command:
    "  :exec '!echo %'
    let commands = {
    \ 'python': 'pytest %'
    \ }

    " Current file's type is mapped onto a command
    if has_key(commands, &ft)
        let args_str = ''

    " Escape each argument for use
    "  in the shell
    for arg in a:000
        let args_str .= ' ' .
        \ shellescape(arg)
    endfor
    exec 'w'
    " In the shell, clear any previous
    "  output and run the command using
    "  the arguments provided to this
    "  function
    exec '! clear && ' . commands[&ft] .
    \ args_str
    endif
endfunction

command! -nargs=? Test call Test(<f-args>)

function Run(...)
    " Map each type of file to the command used to
    "  execute it
    "
    " NOTE: % is the path and name of the current
    "  file. To see this we can run the command:
    "  :exec '!echo %'
    let commands = {
    \ 'sh': 'bash %',
    \ 'python': 'python3 %'
    \ }

    " Current file's type is mapped onto a command
    if has_key(commands, &ft)
        let args_str = ''

    " Escape each argument for use
    "  in the shell
    for arg in a:000
        let args_str .= ' ' .
        \ shellescape(arg)
    endfor
    exec 'w'
    " In the shell, clear any previous
    "  output and run the command using
    "  the arguments provided to this
    "  function
    exec '! clear && ' . commands[&ft] .
    \ args_str
    endif
endfunction

command! -nargs=? Run call Run(<f-args>)


" styles
set fillchars+=vert:\ 
highlight VertSplit ctermbg=236 ctermfg=32

highlight Pmenu ctermfg=255 ctermbg=236 guifg=#00d700 guibg=#ffffff
highlight PmenuSel ctermfg=12 ctermbg=0

 augroup vimrc

   autocmd!

   autocmd ColorScheme * highlight Pmenu ctermfg=255 ctermbg=236 guifg=#00d700 guibg=#ffffff | highlight PmenuSel ctermfg=12 ctermbg=0

 augroup END
