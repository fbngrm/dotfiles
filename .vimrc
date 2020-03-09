"colorscheme  github

" be iMproved
set nocompatible

" enhanced command-line completion
set wildmenu

" disable beeping and flashing
" see http://vim.wikia.com/wiki/Disable_beeping
set noerrorbells visualbell t_vb= " don't beep
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" enhanced cursor

" set cursorcolumn
if version >= 703
  if exists('+colorcolumn')
    highlight ColorColumn ctermbg=DarkGray
    command! ToggleCC :let &cc = &cc == '' ? '80' : ''
    nnoremap <F2> :let &cc = &cc == '' ? '80' : ''<CR>
  endif
endif

" highlight current line
set nocursorline

" enable syntax highlighting
syntax enable

" show line numbers
set nonumber

" map the leader key \ to ,
let mapleader = ","

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" auto save before build
set autowrite

" expand tabs into spaces
set expandtab

" show command in right corner
set showcmd

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show the matching part of the pair for [] {} and ()
set showmatch

" set spellcheck
"setlocal spell! spelllang=en_us

" enable all Python syntax highlighting features
let python_highlight_all = 1

filetype plugin indent on
syntax on

" use utf-8 encoding
set encoding=utf8
set termencoding=utf-8
" Don't do any encoding conversion
set fileencodings=
" fonts, see http://vimdoc.sourceforge.net/htmldoc/options.html#%27guifontwide%27
" display mixed character sets
set guifontwide=MingLiU:h10
set guifont=Consolas:h11:cANSI

" history
" remember more commands and search history
set history=1000
" use many much levels of undo
set undolevels=1000

" no swap files
set nobackup
set noswapfile " IMPORTANT: comment this line if you are working on a remote host
set wildignore=*.swp,*.bak,*.pyc,*.class

" open new split panes to right and bottom, which feels more natural than default Vim behaviour
" set splitbelow
" set splitright
" when navigating a folder, hitting <v> opens a window at right side (default is left side)
" let g:netrw_altv = 1

" show command in bottom bar
set showcmd

set wildmenu
"set lazyredraw

" higlight matching parenthesis
" set showmatch

" better search
" incremental search
set incsearch
" insert tabs on the start of a line according to shiftwidth, not tabstop
set smarttab
" highlight search terms
set hlsearch
" show search matches as you type
set incsearch
" ignore case if search pattern is all lowercase, case-sensitive otherwise
set smartcase
" ignore case when searching
set ignorecase

" nerdtree settings
" let g:nerdtree_tabs_autofind=1
let NERDTreeIgnore = ['\.pyc$', 'tags']
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <silent> <leader>j :NERDTreeToggle <CR>
" find currently open buffer in nerdtree
map <Leader>f :NERDTreeFind<cr>
" open Nerd Tree in folder of file in active buffer
map <Leader>nt :NERDTree %:p:h<CR>

" pathogen package manager
execute pathogen#infect()

" generate ctags when saving go files exclude js files
au BufWritePost *.go silent! !ctags -R --exclude='*node_modules' --exclude='*vendor' &

" include CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" tagbar toggle
nmap <F10> :TagbarToggle<CR>

" ctags for go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" markdown settings
au BufRead,BufNewFile *.md set filetype=markdown

" python specific tab settings
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" wrap word in quotes
nmap <leader>" ysiw"
nmap <leader>' ysiw'

" yank in word
nmap <leader>w yiw

" autocomplete for css
:set omnifunc=csscomplete#CompleteCSS"
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

au FileType go nmap <Leader>m ]]
au FileType go nmap <Leader>n [[

" go - open target identifier under the cursor
au FileType go nmap <Leader>v <Plug>(go-def-vertical) <CR>
au FileType go nmap <Leader>d :GoAlternate <CR>
"au FileType go nmap <Leader>m <Plug>(go-def)
" open godoc in browser
au FileType go nmap <Leader>db <Plug>(go-doc-browser)
" show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)
" Rename the identifier under the cursor to a new name
au FileType go nmap <Leader>r <Plug>(go-rename)
" highlight go
" let g:go_auto_sameids = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
" sometimes when using both vim-go and syntastic Vim will start lagging while
" saving and opening files. The following fixes this:
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" another issue with vim-go and syntastic is that the location list window that
" contains the output of commands such as :GoBuild and :GoTest might not appear. To resolve this:
let g:go_list_type = "quickfix"
" go - map :GoFmt to goimports to auto-import modules
let g:go_fmt_command = "goimports"
" let g:go_fmt_command = "goimports -local github.com/upcload"

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" build and run go files
"autocmd FileType go nmap <leader>r  <Plug>(go-run)
au FileType go map <leader>gr :!go run %<CR>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>b :GoTestCompile <CR>

" disable scratch window for gocode autocomplete
set completeopt-=preview
" go autocomplete with Ctrl+q
nnoremap <C-q> <C-x><C-o>

" Do not use multiline sentences
:set wrap

" Switch window mappings /*{{{*/
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Ctrl+j/k to jmp between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" map <C-J> <C-W>j<C-W>_
" map <C-K> <C-W>k<C-W>_

" Move lines up and down with Alt+j/k
nnoremap ê :m .+1<CR>==
nnoremap ë :m .-2<CR>==

inoremap ê <Esc>:m .+1<CR>==gi
inoremap ë <Esc>:m .-2<CR>==gi

vnoremap ê :m '>+1<CR>gv=gv
vnoremap ë :m '<-2<CR>gv=gv

nnoremap fj :m .+1<CR>==
nnoremap fk :m .-2<CR>==
inoremap fj <Esc>:m .+1<CR>==gi
inoremap fk <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Map the Esc key to jj
:imap jj <Esc>

" Autocompletion with tabs
set wildmode=longest,list,full
set wildmenu

" activates filetype detection
filetype plugin indent on

" activates syntax highlighting among other things
syntax on

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

set backspace=indent,eol,start

" grep word under cursor
" map <F4> :execute "vimgrep /" .expand("<cword>") . "/j **" <Bar> cw<CR>

" Pt, the platinum searcher mapping
nnoremap <silent> ,h :execute "Pt --ignore=vendor --ignore=tags " . expand("<cword>") <CR>

" search in project PT +Unite
nnoremap <silent> ,g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

" buffer menu
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F11> :b <C-Z>

" go to buffer number with Ngb
let c = 1
while c <= 99
  execute "nnoremap " . c . "gb :" . c . "b\<CR>"
  let c += 1
endwhile

nnoremap <F9> :Explore . <cr>

" spell check toggle
:map <F5> :setlocal spell! spelllang=en_us<CR>

" jump between errors in quickfix window
"map <C-n> :cnext<CR>
"map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" stop highlighting when switching to insert mode
for s:c in ['a', 'A', '<Insert>', 'i', 'I', 'gI', 'gi', 'o', 'O']
    exe 'nnoremap ' . s:c . ' :nohlsearch<CR>' . s:c
endfor

" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

"Make backspace delete in normal
nnoremap <BS>    <BS>x
xnoremap <BS>    x

inoremap <C-BS> <C-w>

"Faster buffer switching
nnoremap <leader>l :ls<cr>:b<space>
" show buffer list and open buffer after index is provided
"nnoremap <leader>1 :buffers<CR>:buffer<Space>

"Faster clipboard copying/pastig
nnoremap <leader>y "*y
nnoremap <leader>Y "+Y
nnoremap <leader>p "*p
nnoremap <leader>P "+P

" navigate between buffers
map bn :bn<cr>
map bp :bp<cr>
map bd :bd<cr>

" ctrlP
" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" exclude files and directories using Vim's wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*tags   " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" ctrlP change default mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" ctrlP starting dir config
let g:ctrlp_working_path_mode = 'ar'

" omni-completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" node vim
autocmd User Node if &filetype == "javascript" | setlocal expandtab | endif
autocmd User Node if &filetype == "coffee" | setlocal expandtab | endif
autocmd User Node if &filetype == "coffeescript" | setlocal expandtab | endif

"""""""""""""""""
" Tern settings
"""""""""""""""""
let g:tern_show_argument_hints='on_hold'
" and
let g:tern_map_keys=1

" Ctrl+s saves file
inoremap <c-s> <c-o>:update<CR><ESC>
noremap <c-s> :update<CR><ESC>

let g:NERDTreeWinSize=40

" Status Line {
        set laststatus=2                             " always show statusbar
        set statusline=
        set statusline+=%-10.3n\                     " buffer number
        " syntastic settings
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
        " fugitive vim
        set statusline+=%{fugitive#statusline()}
        set statusline+=%=                           " right align remainder
        set statusline+=%f\                          " filename
        set statusline+=%h%m%r%w                     " status flags
        set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
        " set statusline+=0x%-8B                       " character value
        " set statusline+=%-14(%l,%c%V%)               " line, character
        " set statusline+=%<%P                         " file position
        set statusline+=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

"}

" Highlight all instances of word under cursor, when idle.
" Type z/ to toggle highlighting on/off.
nnoremap + :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" make search results appear in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" do not jump to next search result by default
nnoremap * :keepjumps normal! mi*`i<CR>

" format xml
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

" toggle linenumbers
"noremap <c-w> :set invnumber<CR>
"inoremap <c-w> :set invnumber<CR>

" ignore .csv file in autocomplete
set include=^\\s*#\\s*include\ \\(.csv\\)\\@!

"list chars
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:␣,trail:·,eol:↲

" Make the Alt key working; requires modifier to be set to Alt in .Xresources to
" make urxvt send alt as Esc to vim
nnoremap <silent> <Esc-h> <C-w><
nnoremap <silent> <A-h> <C-w><
nnoremap <silent> <A-k> <C-w>-
nnoremap <silent> <A-j> <C-w>+
nnoremap <silent> <A-l> <C-w>>
function! Altmap(char)
  if has('gui_running') | return ' <A-'.a:char.'> ' | else | return ' <Esc>'.a:char.' '|endif
endfunction
if $TERM == 'rxvt-unicode'&&!has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    autocmd InsertEnter * set timeoutlen=0
    autocmd InsertLeave * set timeoutlen=2000
  augroup END
  execute 'nnoremap <silent>'.Altmap('h').'<C-w><'
  execute 'nnoremap <silent>'.Altmap('k').'<C-w>-'
  execute 'nnoremap <silent>'.Altmap('j').'<C-w>+'
  execute 'nnoremap <silent>'.Altmap('l').'<C-w>>'
endif

" Map yankstack to Alt p and Alt P
nmap <Esc>p <Plug>yankstack_substitute_older_paste
nmap <Esc>P <Plug>yankstack_substitute_newer_paste

" use spell-checking and column-width for git commits
autocmd Filetype gitcommit setlocal spell textwidth=72

" insert line after the current line in cmd mode
nmap <CR> o<Esc>

" set the folding mehtod
set foldmethod=syntax

" edit files in the currently opened files directory
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>e :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%

" do not fold on startup
set foldlevelstart=10

" show quotes in json
set conceallevel=0

" remap record key to Q
nnoremap Q q
nnoremap q <Nop>

" update the status bar with the type info of the identifier under the cursor every 100ms
let g:go_auto_type_info = 1
set updatetime=100

" ultisnips trigger configuration.
" do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" automatically enable paste mode before pasting and disable afterwards. this avoids auto indentation for pasted text.
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~

  set paste
  return ""
endfunction

" use gopls language server
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
