
" --------------------------------------------------------------------------------
" plugins
" --------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-obsession'

Plug 'christoomey/vim-tmux-navigator'

Plug 'Shougo/unite.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

Plug 'easymotion/vim-easymotion'
Plug 'fatih/vim-go'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Townk/vim-autoclose'
" Plug 'SirVer/ultisnips'
" Plug 'vim-syntastic/syntastic'
Plug 'sheerun/vim-polyglot'
Plug 'nazo/pt.vim'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/a.vim'
Plug 'chriskempson/base16-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'sbdchd/neoformat'
Plug 'lervag/vimtex'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/tagbar'
Plug 'vim-scripts/scratch.vim'
Plug 'AndrewRadev/splitjoin.vim'

Plug 'joshdick/onedark.vim'
Plug 'buoto/gotests-vim'

Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-github.nvim'

Plug 'pwntester/octo.nvim', {'do': 'octo.setup()'}
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'ryanoasis/vim-devicons'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'chrisbra/unicode.vim'
Plug 'chrisbra/csv.vim'
Plug 'sebdah/vim-delve'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'projekt0n/github-nvim-theme'

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
set shiftwidth=2

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
set nofoldenable
set foldlevelstart=10
set foldcolumn=0

" show quotes in json
set conceallevel=0

" omni-completion - we use lsp for this
" set omnifunc=syntaxcomplete#Complete

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
set nobackup
set noswapfile " IMPORTANT: comment this line if you are working on a remote host
set wildignore=*.swp,*.bak,*.pyc,*.class

" autocompletion with tabs
set wildmode=longest,list,full
set wildmenu

set noshowmode

" set signcolumn=yes

set fillchars+=vert:│

set mouse=a

" wrap word in quotes
nmap <leader>" ysiw"<CR>
nmap <leader>' ysiw'<CR>

" insert line after the current line in cmd mode
nmap <CR> o<Esc>

" yank in word
nmap <leader>w yiw<CR>
nmap <leader>w yiw<CR>
nnoremap YY ^y$

" save file
" inoremap <c-s> <c-o>:update<CR><ESC>
" noremap <c-s> :update<CR><ESC>
inoremap <c-q> <c-o>:quit<CR><ESC>
noremap <c-q> :quit<CR><ESC>

" map the leader key \ to ,
let mapleader = ";"
let maplocalleader = " "

" make backspace delete in normal mode
" nnoremap <BS> <BS>x
" xnoremap <BS> x
" inoremap <C-BS> <C-w>

" toggle linenumbers
noremap <c-s> :set invnumber<CR>
inoremap <c-s> :set invnumber<CR>

" use spell-checking and column-width for git commits
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype *.md setlocal spell textwidth=72

" activates filetype detection
filetype plugin indent on

" stop highlighting when switching to insert mode
for s:c in ['a', 'A', '<Insert>', 'i', 'I', 'gI', 'gi', 'o', 'O']
    exe 'nnoremap ' . s:c . ' :nohlsearch<CR>' . s:c
endfor

" edit files in the currently jopened files directory
" cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

" remap record key to Q
nnoremap Q q
nnoremap q <Nop>

noremap Zz <c-w>_ \| <c-w>\|
noremap Zo <c-w>=

" remove the split line
" set fillchars+=vert:\ 

" --------------------------------------------------------------------------------
"  macros
"  --------------------------------------------------------------------------------

let @c='oI- [ xA '
let @p='o fmt.Println()h'
let @f='ofmt.Printf("%+v\n",)ha'
let @l='"xyiwofor _,"xpxa:=range "xpa{}O'
let @s='"xyiwospew.Dump()i""xpa"ospew.Dump()b"xp'
let @d='"xyiwo=strftime("%d.%m.%Y")a;"xpa;'

nmap <F3> i<C-R>=strftime("%d.%m.%y")<CR><Esc>
imap <F3> <C-R>=strftime("%d.%m.%y")<CR>

" --------------------------------------------------------------------------------
"  status line
"  --------------------------------------------------------------------------------

set laststatus=2                             " always show statusbar
set statusline=
set statusline+=%-10.3n\                     " buffer number
" syntastic settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" fugitive vim
set statusline+=%{FugitiveStatusline()}
set statusline+=%=                           " right align remainder
set statusline+=%f\                          " filename
" set statusline+=%h%m%r%w                     " status flags
" set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
" set statusline+=0x%-8B                       " character value
set statusline+=%14(%l,%c%V%)               " line, character
" set statusline+=%<%P                         " file position
" set statusline+=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

" --------------------------------------------------------------------------------
" copy & paste
" --------------------------------------------------------------------------------

" PRIMARY - This is copy-on-select, and can be pasted with the middle mouse button.
" CLIPBOARD - This is copied with (usually) ^C, and pasted with ^V (It's like MS Windows).
" * uses PRIMARY; mnemonic: Star is Select (for copy-on-select)
" + uses CLIPBOARD; mnemonic: CTRL PLUS C (for the common keybind)

" automatically interface with the system's clipboard
" set it to unnamed to use * (PRIMARY, on select)
" set it to unnamedplus to use + (CLIPBOARD, ^C)
" set clipboard=unnamedplus

" faster clipboard copying/pastig
" nnoremap <leader>y "+y
" nnoremap <leader>P "*p
" nnoremap <leader>Y "*y
" nnoremap <leader>p "+p

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
nnoremap <F10> :b <C-Z>

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
nnoremap <silent> <leader>h :execute "Pt --ignore=vendor --ignore=tags " . expand("<cword>") <CR>

" search in project PT +Unite
nnoremap <silent> <leader>g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
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
" set guifontwNde=MingLiU:h10
" set guifont=Consolas:h11:cANSI

" --------------------------------------------------------------------------------
" navigation
" --------------------------------------------------------------------------------

" in insert or command mode, move normally by using ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" map the Esc key to jj
" imap jj <Esc>

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
" make uralt send alt as Esc to vim
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

" <F2> cursor column
if version >= 703
  if exists('+colorcolumn')
    highlight ColorColumn ctermbg=DarkGray
    command! ToggleCC :let &cc = &cc == '' ? '120' : ''
    nnoremap <F2> :let &cc = &cc == '' ? '120' : ''<CR>
  endif
endif

" <F9> explore
nnoremap <F9> :Explore . <cr>

" <F4> explore
nnoremap <expr> <f4> &foldlevel ? 'zM' :'zR'


" --------------------------------------------------------------------------------
"  spell checking
" --------------------------------------------------------------------------------

" <F5> spell check toggle
map <F5> :setlocal spell! spelllang=en_gb,de_de<CR>

" limit spelling suggestions
set spellsuggest+=10

" use first spelling suggestion <c-v> l
nmap zs 1z=
nmap zn ]s
nmap zb [s
imap <C-z><C-s> <Esc>[s1z=`]a

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

" format XML
function! DoPrettyXML()
  " save the file type so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the XML header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid XML.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " XML lint will insert an <?xml?> header. it's easy enough to delete
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
" fugitive
" --------------------------------------------------------------------------------

" silent git commands
function! s:ftplugin_fugitive() abort
  nnoremap <buffer> <silent> cc :Git commit --quiet<CR>
  nnoremap <buffer> <silent> ca :Git commit --quiet --amend<CR>
  nnoremap <buffer> <silent> ce :Git commit --quiet --amend --no-edit<CR>
endfunction
augroup grm_fugitive
  autocmd!
  autocmd FileType fugitive call s:ftplugin_fugitive()
augroup END

" --------------------------------------------------------------------------------
" markdown
" --------------------------------------------------------------------------------

" markdown settings
au BufRead,BufNewFile *.md set filetype=markdown

" --------------------------------------------------------------------------------
"  ultisnips
"  --------------------------------------------------------------------------------

" do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<a-n>"
" let g:UltiSnipsJumpForwardTrigger="<a-m>"
" let g:UltiSnipsJumpBackwardTrigger="<a-b>"

" --------------------------------------------------------------------------------
"  yankstack
"  --------------------------------------------------------------------------------

" Alt p and Alt P
" nmap <leader>p <Plug>yankstack_substitute_older_paste
" nmap <leader>P <Plug>yankstack_substitute_newer_paste
" Map yankstack to Alt p and Alt P
nmap <Esc>p <Plug>yankstack_substitute_older_paste
nmap <Esc>P <Plug>yankstack_substitute_newer_paste

" delete to the black hole register
" nnoremap d "_d
" vnoremap d "_d

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
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'ar'
""set runtimepath^=~/.vim/bundle/ctrlp.vim

"" ignore files in .gitignore
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"" search word under the cursor
"nn <leader>d :let g:ctrlp_default_input = expand('<cword>')<cr>
"map <leader>k :let g:ctrlp_default_input = 0<cr>:CtrlP<cr>

"" exclude files and directories using Vim's wildignore
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*tags   " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }

" --------------------------------------------------------------------------------
" syntastic
" --------------------------------------------------------------------------------

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

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

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>
" open godoc in browser
au FileType go nmap <Leader>db <Plug>(go-doc-browser)

" show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

nmap <leader>gg :!go generate %<cr>

" highlight go
" let g:go_auto_sameids = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" sometimes when using both vim-go and syntastic Vim will start lagging while
" saving and opening files. The following fixes this:
" let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" another issue with vim-go and syntastic is that the location list window that
" contains the output of commands such as :GoBuild and :GoTest might not appear. To resolve this:
let g:go_list_type = "quickfix"
" go - map :GoFmt to goimports to auto-import modules
let g:go_fmt_command = "gofmt"
" autocmd FileType go autocmd BufWritePre <buffer> !gofmt -s -w %
au BufWritePost *.go silent! !gofmt -s -w %

let g:go_addtags_transform = "camelcase"

" build and run go files
au FileType go map <leader>gr :!go run %<CR>
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
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
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" --------------------------------------------------------------------------------
" python
" --------------------------------------------------------------------------------

" enable all Python syntax highlighting features
let python_highlight_all = 1
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" --------------------------------------------------------------------------------
" CocCommand explorer
" --------------------------------------------------------------------------------

" " have vim start coc-explorer if vim started with folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'CocCommand explorer' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
nmap <silent> <leader>j :CocCommand explorer <CR>

" --------------------------------------------------------------------------------
" Neoformat / prettier
" --------------------------------------------------------------------------------

autocmd BufWritePre *.js Neoformat

" --------------------------------------------------------------------------------
" vimtex
" --------------------------------------------------------------------------------

" let g:vimtex_compiler_latexmk = { 
"         \ 'executable' : 'latexmk',
"         \ 'options' : [ 
"         \   '-xelatex',
"         \   '-file-line-error',
"         \   '-synctex=1',
"         \   '-interaction=nonstopmode',
"         \ ],
"         \}
let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \}
let g:tex_matchcheck= '[{}]'
nnoremap <leader>xc :VimtexCompile<CR>

" need xelatex for fontspec compilation
" nnoremap <leader>xc :execute "!xelatex " . expand('%')<CR>

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'evince'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" --------------------------------------------------------------------------------
" tagbar
" --------------------------------------------------------------------------------

nmap <F8> :TagbarToggle<CR>

function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

" --------------------------------------------------------------------------------
" gitgutter
" --------------------------------------------------------------------------------

" This is like :GitGutterNextHunk but when it gets to the last hunk in the buffer
" it cycles around to the first.
function! GitGutterNextHunkCycle()
  let line = line('.')
  silent! GitGutterNextHunk
  if line('.') == line
    1
    GitGutterNextHunk
  endif
endfunction

function! GitGutterPrevHunkCycle()
  let line = line('.')
  silent! GitGutterPrevHunk
  if line('.') == line
    1
    GitGutterPrevHunk
  endif
endfunction

nmap <leader>hn :call GitGutterNextHunkCycle()<CR>
nmap <leader>hm :call GitGutterPrevHunkCycle()<CR>

function! NextHunkAllBuffers()
  let line = line('.')
  GitGutterNextHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bnext
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      1
      GitGutterNextHunk
      return
    endif
  endwhile
endfunction

function! PrevHunkAllBuffers()
  let line = line('.')
  GitGutterPrevHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bprevious
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! G
      GitGutterPrevHunk
      return
    endif
  endwhile
endfunction

nmap <leader>hN :call NextHunkAllBuffers()<CR>
nmap <leader>hM :call PrevHunkAllBuffers()<CR>

" --------------------------------------------------------------------------------
" diffs
" --------------------------------------------------------------------------------

function! DiffLines()
    let f1=tempname()
    let f2=tempname()

    exec ".write " . f1
    exec ".+1write " . f2

    exec "tabedit " . f1
    exec "vert diffsplit " . f2
endfunction

" --------------------------------------------------------------------------------
" gotests
" --------------------------------------------------------------------------------

" let g:gotests_template_dir = '/home/f/work/src/gitlab.com/pentoapp/pento/server/tmpl/gotests/'

" --------------------------------------------------------------------------------
" ts
" --------------------------------------------------------------------------------

autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
nmap <leader>i :CocCommand tsserver.organizeImports<cr>

" --------------------------------------------------------------------------------
" telescope
" --------------------------------------------------------------------------------

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" --------------------------------------------------------------------------------
" nvim-tree
" --------------------------------------------------------------------------------

"let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
"let g:nvim_tree_quit_on_open = 0 "0 by default, closes the tree when you open a file
"let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
"let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
"let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
"let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
"let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
"let g:nvim_tree_disable_window_picker = 0 "0 by default, will disable the window picker.
"let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
"" let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
"let g:nvim_tree_respect_buf_cwd = 0 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
"let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
"let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
"let g:nvim_tree_window_picker_exclude = {
"    \   'filetype': [
"    \     'notify',
"    \     'packer',
"    \     'qf'
"    \   ],
"    \   'buftype': [
"    \     'terminal'
"    \   ]
"    \ }
"" Dictionary of buffer option names mapped to a list of option values that
"" indicates to the window picker that the buffer's window should not be
"" selectable.
"let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
"let g:nvim_tree_show_icons = {
"    \ 'git': 1,
"    \ 'folders': 0,
"    \ 'files': 0,
"    \ 'folder_arrows': 0,
"    \ }
""If 0, do not show the icons for one of 'git' 'folder' and 'files'
""1 by default, notice that if 'files' is 1, it will only display
""if nvim-web-devicons is installed and on your runtimepath.
""if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
""but this will not work when you set indent_markers (because of UI conflict)

"" default will show icon by default if no icon is provided
"" default shows no icon by default
"let g:nvim_tree_icons = {
"    \ 'default': '',
"    \ 'symlink': '->',
"    \ 'git': {
"    \   'unstaged': "✗",
"    \   'staged': "✓",
"    \   'unmerged': "",
"    \   'renamed': "➜",
"    \   'untracked': "★",
"    \   'deleted': "",
"    \   'ignored': "◌"
"    \   },
"    \ 'folder': {
"    \   'arrow_open': "+",
"    \   'arrow_closed': "",
"    \   'default': "",
"    \   'open': "",
"    \   'empty': "",
"    \   'empty_open': "",
"    \   'symlink': "",
"    \   'symlink_open': "",
"    \   }
"    \ }
"nnoremap <A-n> :NvimTreeToggle<CR>
"nnoremap <A-r> :NvimTreeRefresh<CR>
"nnoremap <A-f> :NvimTreeFindFile<CR>

"" a list of groups can be found at `:help nvim_tree_highlight`
"" highlight NvimTreeFolderIcon guibg=blue

"lua << EOF
"-- following options are the default
"-- each of these are documented in `:help nvim-tree.OPTION_NAME`
"require'nvim-tree'.setup {
"  update_cwd          = false,
"  diagnostics = {
"    enable = true,
"    icons = {
"      hint = "",
"      info = "",
"      warning = "",
"      error = "",
"    }
"  },
"  view = {
"    width = 40,
"    height = 30,
"    hide_root_folder = false,
"    side = 'left',
"    auto_resize = false,
"  }
"}
" EOF

" --------------------------------------------------------------------------------
" color theme
" --------------------------------------------------------------------------------

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax on
" let base16colorspace=256  " Access colors present in 256 colorspace

" set termguicolors
" colorscheme github_dark
colorscheme github_light

" --------------------------------------------------------------------------------
" lsp
" --------------------------------------------------------------------------------

" format
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)

lua << EOF
require("lsp_config")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', 'gn', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', 'gm', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
require('lspconfig')['gopls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
EOF
