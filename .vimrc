"
" NOTES
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

" settings for code
syntax on
set showmatch
colorscheme ron 
set number
set showcmd
set ruler
" tab replace and display
" 50
  set expandtab
set tabstop=2

" Pictures
autocmd BufEnter *.png,*.jpg,*gif exec "! ~/.iterm2/imgcat ".expand("%") | :bw


" cursor display iterm2 and tmux
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

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


"movement
nnoremap j gj
nnoremap k gk

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
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>



" Plugins
set nocp
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'mbbill/undotree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'preservim/nerdtree'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()
filetype plugin indent on

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
    exec '!clear && ' . commands[&ft] .
    \ args_str
    endif
endfunction

command! -nargs=? Run call Run(<f-args>)

highlight Pmenu ctermfg=255 ctermbg=236 guifg=#00d700 guibg=#ffffff
highlight PmenuSel ctermfg=12 ctermbg=0

 augroup vimrc

   autocmd!

   autocmd ColorScheme * highlight Pmenu ctermfg=255 ctermbg=236 guifg=#00d700 guibg=#ffffff | highlight PmenuSel ctermfg=12 ctermbg=0

 augroup END
