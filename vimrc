"" VIM configuration file
"" Louis-Philippe Rousseau
"" September 2013

"" Vundle stuff (instead of Pathogen)
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" to manage Vundle
Bundle 'VundleVim/Vundle.vim'

" plugins list
" standard/reasonable options
Bundle 'tpope/vim-sensible'
" improved quoting/parenthezing
Bundle 'tpope/vim-surround'
" enable repeat for plugins
Bundle 'tpope/vim-repeat'
" autoclose quotes/parentheses/etc.
Bundle 'Raimondi/delimitMate'
" commenting mappings
Bundle 'scrooloose/nerdcommenter'

" syntax checking
"Bundle 'scrooloose/syntastic'
" display tags in a sidebar
"Bundle 'majutsushi/tagbar'
" completions with tabs
Bundle 'ervandew/supertab'

" fuzzy finder for files, buffers, etc.
"Bundle 'kien/ctrlp.vim'
" tree explorer
"Bundle 'scrooloose/nerdtree'
" undo tree explorer
"Bundle 'sjl/gundo.vim'

" snippets manager (or check vim-snipmate)
Bundle 'sirver/ultisnips'
" collection of snippets
Bundle 'honza/vim-snippets'

" solarized color theme
Bundle 'altercation/vim-colors-solarized'
" improved status line
Bundle 'bling/vim-airline'
"Bundle 'Lokaltog/powerline'  " heavier than vim-airline

" Git wrapper
"Bundle 'tpope/vim-fugitive'

" syntax files
"Bundle 'scy/vim-remind'
"Bundle 'smancill/conky-syntax.vim'
"Bundle 'hdima/python-syntax'
"Bundle 'MatlabFilesEdition'

call vundle#end()
filetype plugin indent on
"" end of Vundle stuff

" load the editexisting macro
runtime! macros/editexisting.vim

"" colorscheme configuration
set background=dark
" solarized theme
let g:solarized_termcolors = 16
let g:solarized_termtrans = 0
"let g:solarized_contrast = 'high'
"let g:solarized_visibility = 'high'
colorscheme solarized

"" status line configuration
" vim-airline
"let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 0

let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = ['trailing']
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#whitespace#trailing_format = 'end[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'tab[%s]'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#tabline#fnamemod = ':p:.'

let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#syntastic#enabled = 1
"let g:airline#extensions#tagbar#enabled = 1
"let g:airline#extensions#ctrlp#enabled = 1

"let g:airline_section_a = ''
"let g:airline_section_b = ''
"let g:airline_section_c = ''
"let g:airline_section_gutter = ''
"let g:airline_section_x = ''
"let g:airline_section_y = ''
"let g:airline_section_z = ''
"let g:airline_section_warning = ''
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 79,
    \ 'x': 60,
    \ 'y': 79,
    \ 'z': 45 }

" don't show the mode (already displayed by vim-airline)
set noshowmode

" custom status line (if no status line plugin used)
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%03v][%p%%]\ [LC=%L]

"" delimitMate configuration
set matchpairs+=<:>
let delimitMate_expand_space = 1
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1
"let delimitMate_exluded_ft = ''

"" NerdCommenter configuration
let NERDDefaultNesting = 0
let NERDSpaceDelims = 0
let NERDCompactSexyComs = 0
"let g:NERDCustomDelimiters = {
"        \ 'filetype': { 'left': 'symb', 'leftAlt': 'symb' } }

"" tagbar configuration
nnoremap <silent> <F8> :TagbarToggle<CR>

"" ultisnips configuration
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsSnippetDirectories = ["UltiSnips", "bundle/vim-snippets/UltiSnips"]

" let :UltiSnipsEdit split the window for editing
let g:UltiSnipsEditSplit = "vertical"

"" vim-fugitive configuration


"" Asymptote support
augroup filetypedetect
    au BufNewFile,BufRead *.asy setf asy
augroup END


"" personal options
" print line numbers
set number
" highlight search results
set hlsearch
" smartly ignore case in search patterns
set ignorecase
set smartcase
" hide abandoned buffers
set hidden
" number of spaces in indent
set shiftwidth=4
" use spaces instead of tabs
set tabstop=4
"set softtabstop=4
set expandtab
" better line break (instead of character)
set linebreak
" create windows at the bottom and on the right of the current
set splitbelow
set splitright
" enable mouse in all modes
set mouse=a
" command to use for grep
set grepprg=grep\ -nH\ $*

" commands autocompletion behaviour
set wildmode=full

" enable autocompletion feature
"set omnifunc=syntaxcomplete#Complete

" latex filetype for .tex extension (instead of plaintex)
let g:tex_flavor='latex'

"" new mappings
" change the leader (default:\)
let mapleader=","
nnoremap <Leader>w :w<CR>

" copy until the end of line
map Y y$
" better visual indentation
vnoremap > >gv
vnoremap < <gv
" use spacebar for search
nmap <Space> /
" better search regexes
"nnoremap / /\v
"vnoremap / /\v
"cnoremap s/ s/\v
"cnoremap %s/ %s/\v
" easier copy and paste using the system clipboard
"nnoremap <Leader>y "+y
vnoremap <Leader>y "+y
nnoremap <Leader>p "+p
" better movement with cursor keys
inoremap <Up> <C-O>gk
inoremap <Down> <C-O>gj
nnoremap <Up> gk
nnoremap <Down> gj
vnoremap <Up> gk
vnoremap <Down> gj
nnoremap j gj
nnoremap k gk
" movement between splits
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
" buffers management
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :b#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>d :bd<CR>

" save file using sudo (useful for root config files)
command W w !sudo tee % > /dev/null

" locally change to the directory of the current file
nnoremap <Leader>cd :lcd %:p:h<CR>

" remove any trailing whitespace in the current file
"autocmd BufWrite * if ! &bin | %s/\s\+$//e | endif

" jump to last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
            \ | exe "normal! g'\"" | endif

