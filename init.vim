" --------------------------------------------------------------------------------
" plugins
" --------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'Townk/vim-autoclose'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'SirVer/ultisnips'
Plug 'vim-syntastic/syntastic'
Plug 'nazo/pt.vim'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/a.vim'
Plug 'chriskempson/base16-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'sbdchd/neoformat'

call plug#end()

" --------------------------------------------------------------------------------
" settings
" --------------------------------------------------------------------------------

" show line numbers
set nonumber

" indent when moving to the next
set autoindent

" auto save before build
set autowrite

" show command in right corner
set showcmd

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" higlight matching parenthesis
set showmatch

" show command in bottom bar
set showcmd

set wildmenu

" do not use multiline sentences
set wrap

" allows you to deal with multiple unsaved buffers simultaneously
set hidden

set backspace=indent,eol,start

" set the folding mehtod
set foldmethod=syntax

" do not fold on startup
set foldlevelstart=10

" show quotes in json
set conceallevel=0

" omni-completion
set omnifunc=syntaxcomplete#Complete

" ignore .csv file in autocomplete
set include=^\\s*#\\s*include\ \\(.csv\\)\\@!

"list chars
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:␣,trail:·,eol:↲

" tabs
set ts=4 " 4 spaces tabs
set expandtab " expand tabs into spaces
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop

" history
set history=1000 " remember more commands and search history
set undolevels=1000 " use many much levels of undo

" swap files
set nobackup " disable
set noswapfile " IMPORTANT: comment this line if you are working on a remote host
set wildignore=*.swp,*.bak,*.pyc,*.class

" autocompletion with tabs
set wildmode=longest,list,full
set wildmenu

" wrap word in quotes
nmap <leader>" ysiw"
nmap <leader>' ysiw'

" insert line after the current line in cmd mode
nmap <CR> o<Esc>

" yank in word
nmap <leader>w yiw

" save file
inoremap <c-s> <c-o>:update<CR><ESC>
noremap <c-s> :update<CR><ESC>

" map the leader key \ to ,
let mapleader = ","

" make backspace delete in normal mode
nnoremap <BS> <BS>x
xnoremap <BS> x
inoremap <C-BS> <C-w>

" toggle linenumbers
noremap <c-w> :set invnumber<CR>
inoremap <c-w> :set invnumber<CR>
noremap <c-e> :set invrelativenumber<CR>
inoremap <c-e> :set invrelativenumber<CR>

" use spell-checking and column-width for git commits
autocmd Filetype gitcommit setlocal spell textwidth=72

" activates filetype detection
filetype plugin indent on

" stop highlighting when switching to insert mode
for s:c in ['a', 'A', '<Insert>', 'i', 'I', 'gI', 'gi', 'o', 'O']
    exe 'nnoremap ' . s:c . ' :nohlsearch<CR>' . s:c
endfor

" edit files in the currently opened files directory
" cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>e :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%

" remap record key to Q
nnoremap Q q
nnoremap q <Nop>

" --------------------------------------------------------------------------------
"  status line
"  --------------------------------------------------------------------------------

set laststatus=2                             " always show statusbar
set statusline=
set statusline+=%-10.3n\                     " buffer number
" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" fugitive vim
set statusline+=%{FugitiveStatusline()}
set statusline+=%=                           " right align remainder
set statusline+=%f\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
" set statusline+=0x%-8B                       " character value
" set statusline+=%-14(%l,%c%V%)               " line, character
" set statusline+=%<%P                         " file position
set statusline+=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

" --------------------------------------------------------------------------------
" copy & paste
" --------------------------------------------------------------------------------

" faster clipboard copying/pastig
nnoremap <leader>y "*y
nnoremap <leader>Y "+Y
nnoremap <leader>p "*p
nnoremap <leader>P "+P

" automatically enable paste mode before pasting and disable afterwards. this
" avoids auto indentation for pasted text
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" --------------------------------------------------------------------------------
" buffers
" --------------------------------------------------------------------------------

set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F11> :b <C-Z>

" go to buffer number with Ngb
let c = 1
while c <= 99
  execute "nnoremap " . c . "gb :" . c . "b\<CR>"
  let c += 1
endwhile

" faster buffer switching
nnoremap <leader>l :ls<cr>:b<space>

" --------------------------------------------------------------------------------
" search
" --------------------------------------------------------------------------------

set incsearch " incremental search
set hlsearch " highlight search terms
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise
set ignorecase " ignore case when searching

" search with ctrl+s
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

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

" make search results appear in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" do not jump to next search result by default
nnoremap * :keepjumps normal! mi*`i<CR>

" --------------------------------------------------------------------------------
" encoding
" --------------------------------------------------------------------------------

" use utf-8 encoding
set encoding=utf8
set termencoding=utf-8

" don't do any encoding conversion
set fileencodings=

" --------------------------------------------------------------------------------
" fonts
" --------------------------------------------------------------------------------

" fonts, see http://vimdoc.sourceforge.net/htmldoc/options.html#%27guifontwide%27
set guifontwide=MingLiU:h10
set guifont=Consolas:h11:cANSI

" --------------------------------------------------------------------------------
" colors
" --------------------------------------------------------------------------------

" let $nvim_tui_enable_true_color=1
" let base16colorspace=256
" colorscheme base16-nord
" set termguicolors

" enable syntax highlighting
syntax enable

" --------------------------------------------------------------------------------
" navigation
" --------------------------------------------------------------------------------

" in insert or command mode, move normally by using ctrl
"inoremap <C-h> <Left>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-l> <Right>
"cnoremap <C-h> <Left>
"cnoremap <C-j> <Down>
"cnoremap <C-k> <Up>
"cnoremap <C-l> <Right>

" move lines up and down with Alt+j/k
nnoremap ê :m .+1<CR>==
inoremap ê <Esc>:m .+1<CR>==gi
inoremap ë <Esc>:m .-2<CR>==gi
vnoremap ê :m '>+1<CR>gv=gv
vnoremap ë :m '<-2<CR>gv=gv
nnoremap ë :m .-2<CR>==

" nnoremap fj :m .+1<CR>==
" nnoremap fk :m .-2<CR>==
" inoremap fj <Esc>:m .+1<CR>==gi
" inoremap fk <Esc>:m .-2<CR>==gi

vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" map the Esc key to jj
imap jj <Esc>

" jump between errors in quickfix window
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" navigate between buffers
map bn :bn<cr>
map bp :bp<cr>
map bd :bd<cr>

" --------------------------------------------------------------------------------
" key bindings
" --------------------------------------------------------------------------------

" make the Alt key working; requires modifier to be set to Alt in .Xresources to
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

" <F2> cursorcolumn
if version >= 703
  if exists('+colorcolumn')
    highlight ColorColumn ctermbg=DarkGray
    command! ToggleCC :let &cc = &cc == '' ? '80' : ''
    nnoremap <F2> :let &cc = &cc == '' ? '80' : ''<CR>
  endif
endif

" <F9> explore
nnoremap <F9> :Explore . <cr>

" <F5> spell check toggle
map <F5> :setlocal spell! spelllang=en_us<CR>

" --------------------------------------------------------------------------------
"  helper functions
" --------------------------------------------------------------------------------

" highlight all instances of word under cursor, when idle.
" type z/ to toggle highlighting on/off.
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

" --------------------------------------------------------------------------------
" markdown
" --------------------------------------------------------------------------------

" markdown settings
au BufRead,BufNewFile *.md set filetype=markdown

" --------------------------------------------------------------------------------
"  ultisnips
"  --------------------------------------------------------------------------------

" do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<a-n>"
let g:UltiSnipsJumpForwardTrigger="<a-m>"
let g:UltiSnipsJumpBackwardTrigger="<a-b>"

" --------------------------------------------------------------------------------
"  yankstack
"  --------------------------------------------------------------------------------

" Alt p and Alt P
nmap <Esc>p <Plug>yankstack_substitute_older_paste
nmap <Esc>P <Plug>yankstack_substitute_newer_paste

" --------------------------------------------------------------------------------
" nerdtree
" --------------------------------------------------------------------------------

"let g:NERDTreeWinSize=40
"" let g:nerdtree_tabs_autofind=1
"let NERDTreeIgnore = ['\.pyc$', 'tags']
""autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"nmap <silent> <leader>j :NERDTreeToggle <CR>
"" find currently open buffer in nerdtree
"map <Leader>f :NERDTreeFind<cr>
"" open Nerd Tree in folder of file in active buffer
"map <Leader>nt :NERDTree %:p:h<CR>

" --------------------------------------------------------------------------------
" CtrlP
" --------------------------------------------------------------------------------

" change default mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ar'
"set runtimepath^=~/.vim/bundle/ctrlp.vim

" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" search word under the cursor
nn <leader>d :let g:ctrlp_default_input = expand('<cword>')<cr>
map <leader>k :let g:ctrlp_default_input = 0<cr>:CtrlP<cr>

" exclude files and directories using Vim's wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*tags   " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" --------------------------------------------------------------------------------
" syntastic
" --------------------------------------------------------------------------------

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" --------------------------------------------------------------------------------
" tern settings
" --------------------------------------------------------------------------------
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1

" --------------------------------------------------------------------------------
" golang
" --------------------------------------------------------------------------------

" generate ctags when saving go files exclude js files
" au BufWritePost *.go silent! !ctags -R --exclude='*node_modules' --exclude='*vendor' &

" " ctags for go
" let g:tagbar_type_go = {
"     \ 'ctagstype' : 'go',
"     \ 'kinds'     : [
"         \ 'p:package',
"         \ 'i:imports:1',
"         \ 'c:constants',
"         \ 'v:variables',
"         \ 't:types',
"         \ 'n:interfaces',
"         \ 'w:fields',
"         \ 'e:embedded',
"         \ 'm:methods',
"         \ 'r:constructor',
"         \ 'f:functions'
"     \ ],
"     \ 'sro' : '.',
"     \ 'kind2scope' : {
"         \ 't' : 'ctype',
"         \ 'n' : 'ntype'
"     \ },
"     \ 'scope2kind' : {
"         \ 'ctype' : 't',
"         \ 'ntype' : 'n'
"     \ },
"     \ 'ctagsbin'  : 'gotags',
"     \ 'ctagsargs' : '-sort -silent'
" \ }

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" update the status bar with the type info of the identifier under the cursor every 100ms
let g:go_auto_type_info = 1
set updatetime=100

" open godoc in browser
au FileType go nmap <Leader>db <Plug>(go-doc-browser)

" show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

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

" build and run go files
au FileType go map <leader>gr :!go run %<CR>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>b :GoTestCompile <CR>
au FileType go nmap <Leader>m ]]
au FileType go nmap <Leader>n [[
au FileType go nmap <Leader>d :GoAlternate <CR>
au FileType go nmap <Leader>tf :GoTestFunc <CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" use gopls language server
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" --------------------------------------------------------------------------------
" python
" --------------------------------------------------------------------------------

" enable all Python syntax highlighting features
let python_highlight_all = 1
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4


" hide column on the left
set foldcolumn=0
set signcolumn=no

" --------------------------------------------------------------------------------
" coc.nvim / language server default settings
" --------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
" set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" --------------------------------------------------------------------------------
" CocCommand explorer
" --------------------------------------------------------------------------------

nmap <silent> <leader>j :CocCommand explorer <CR>

" --------------------------------------------------------------------------------
" Neoformat / prettier
" --------------------------------------------------------------------------------

autocmd BufWritePre *.js Neoformat

