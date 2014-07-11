


"colorscheme vividchalk
"set background=light
"set background=dark
"Bundle 'mru.vim'
"Bundle 'greplace.vim'

filetype plugin indent on     " required!

"=============================================================================
"" General settings
"=============================================================================
""GUI setting""""""""""""""""""""""""""""""""""""""""
"let $VIMFILES = $HOME.'/.vim'
colo evening
if has("gui_running")&& has("autocmd")
    set guioptions-=T
    set guitablabel=%{tabpagenr()}.%t\ %m
    set guitabtooltip=%F
    set mouse=a

    set showtabline=2
else
    set wrap
endif

syntax on "syntax highlight
"set visualbell "use visual bell
"set noerrorbel "no error bell
set ignorecase "searching ignore case
"set smartcase "better search 
set hlsearch " set hight light search
set incsearch " do incremental searching
set hid " you can change buffer without saving
set showmatch " show matching brackets
"set list
"set mat=5 " how many tenths of a second to blink matching brackets for

set cursorline
"set im!  "
set nu  "show number
set nowrap " set no wrap
set backspace=2 "set backspace key as it should be
"set complete=.,b,u,s,i      " words-completion modes.
set complete=.,w,b,u      " words-completion modes.
set shiftwidth=4
set history=1000
set completeopt=longest,menu,preview
set viminfo+=! "netrw bookmarks
""fold setting"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set foldenable " Turn on folding
"set foldmethod=indent " Make folding indent sensitive
"set foldlevel=100 " Don't autofold anything (but I can still fold manually)
"set foldopen-=search " don't open folds when you search into them
"set foldopen-=undo " don't open folds when you undo stuff

"set statusline=%<%F%h%m%r%=\ [%{&ff}]\ type=\%y\ [len=\%L]\ [pos=%\P]
"set statusline=%<%F%h%m%r%=\ [%{&ff}]\ [len=\%L]\ [pos=\%l,\%c]
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{fugitive#statusline()}\ %{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
set laststatus=2
"tab view settings


set fileformats=unix,dos "use unix format as default
set fileformat=unix "use unix format as default

"set   clipboard=unnamed
"set clipboard+=unnamed
"set clipboard*=unnamed
"wildmenu"""""""""""""""""""""""""""""""""""""""""
set wildmenu
"set wildignore=*.bak,*.o,*.e,*~
"set wildignore=*/.git/*,*/.hg/*,*/.svn/*,*.o,*.class,*.pyc,*.pyo
set wildignore=*/.hg/*,*/.svn/*

" return OS type, eg: windows, or linux, mac, et.st..
function! MySys()
    if has("win16") || has("WIN32") || has("win64") || has("win95")
	return "windows"
    elseif has("unix")
	return "linux"
    endif
endfunction

" $VIMFILES
if MySys() == "windows"
    let $VIMFILES = $VIM.'/vimfiles'
    "let $VIMFILES = $VIM.'/vimfiles'
    " backup"""""""""""""""""""""""
    set backup
    set backupdir=$TMP "backup directory
    "swap dir
    set directory=$TMP
    " view dir"""""""""""""""""""""""
    "set viewdir=$TMP/.vim/view "view directory
elseif MySys() == "linux"
    let $VIMFILES = $HOME.'/.vim'
endif



"text formating""""""""""""""""""""""""""""""""""""""""
set fo+=mB "make gq can deal with Chinese charactor 
"set textwidth=75


"abbreviate""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xtime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>
iab xdate <c-r>=strftime("%Y-%m-%d")<cr>
nmap <f6> o========================================================= <cr>
imap <f6> <cr>========================================================= <cr>
nmap <c-f6> o--------------------------------------------------------- <cr>
imap <c-f6> <cr>--------------------------------------------------------- <cr>

"imap <c-enter> <c-o>o
"map <m-space> :simalt ~<cr>


"on load buf ,run""""""""""""""""""""""""""""""""""""

"map marker jump"""""""""""""""""""""""""
map <c-]> g<c-]>
imap <c-]> <c-o>g<c-]>
"imap <c-p> <c-x><c-p>

vnoremap <C-Insert> "+y
if has("mac")
    vmap Y :w !pbcopy<CR><CR>
    nmap YY :.w !pbcopy<CR><CR>
else 
    vmap Y "+y
    nmap YY "+yy
endif
map <S-Insert> "+gP
imap <S-Insert> <c-o>"+gP
vnoremap <silent> ,/     y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR> 
vnoremap <silent> ,?     y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
map g/ //b<cr>v//e<cr>
"find first happen in a buffer.
"vnoremap <silent> ,f     y/\%^\_.\{-}\zs<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"nnoremap ,f     /\%^\_.\{-}\zs
"map ,s :source %<cr>
nmap ,t :tabnew 
nmap ,c :ConqueTermTab 
nmap ,w :set wrap<cr>
map ,ig :set  ignorecase<cr>
map ,nig :set noignorecase<cr>

" Disable Middle mouse button to paste
map  <MiddleMouse> <Nop>
map! <MiddleMouse> <Nop>
map  <2-MiddleMouse> <Nop>
map!  <2-MiddleMouse> <Nop>
map <3-MiddleMouse> <Nop>
map! <3-MiddleMouse> <Nop>

" Cursor movement
"nnoremap <Down> gj
"nnoremap <Up> gk
"vnoremap <Down> gj
"vnoremap <Up> gk
"inoremap <Down> <C-o>gj
"inoremap <Up> <C-o>gk

"nnoremap <End> g$
"nnoremap <Home> g0
"vnoremap <End> g$
"vnoremap <Home> g0
"inoremap <End> <C-o>g$
"inoremap <Home> <C-o>g0

"imap <c-j> <down>
"imap <c-k> <up>
"imap <c-h> <left>
"imap <c-l> <right>
"imap <c-w> <c-o><c-w>w

" Move lines
nmap <C-Down> :<C-u>move .+1<CR>
nmap <C-Up> :<C-u>move .-2<CR>

imap <C-Down> <C-o>:<C-u>move .+1<CR>
imap <C-Up> <C-o>:<C-u>move .-2<CR>

vmap <C-Down> :move '>+1<CR>gv
vmap <C-Up> :move '<-2<CR>gv

vmap > >gv
vmap < <gv

"map close buf
map <c-F4> :bd!<cr>
"search diary
set grepprg=grep\ -I\ -nrH\ --devices=skip\ --exclude\ \"*.svn-base\"\ --exclude\ \"tags\"\ $*\ \* 


"quickfix window open in buffer
au FileType qf :nnoremap <buffer> v <Enter>zz:wincmd p<Enter>

"Get the vim command output    
command! -nargs=* Mc redir @"> | try | exe "<args>" | finally | redir END | endtry

"lcd %:p:h
" current file fullname
"map <F1> :let @+=expand("%:p")<cr>
"imap <F1> <esc>:let @+=expand("%:p")<cr>
let g:I = 0
func! INC()
    let g:I +=1
    return g:I
endfunction

" ============================================================================
" Plugins settings
" ============================================================================

" ========================================================= 
" filtering.vim
nnoremap ,F :call Gather(input("Filter on term: "), 0)<CR>
" nnoremap ,f :call Gather(@/, 0)<CR>:echo<CR>
nnoremap ,g :call GotoOpenSearchBuffer()<CR>
nnoremap ,d :call CloseAllSearchWindows()<CR>

"--------------------------------------------------------- 
"NERD comment
let NERD_c_alt_style=1

let g:NERDCustomDelimiters = {
    \ 'c': { 'leftAlt': '//','rightAlt': '', 'left': '/* ', 'right': '*/' },
\ }

"-------------------------------------------------------- 
"netrw
let g:netrw_ftp_list_cmd      = 'ls'
let g:netrw_ftpmode           = 'ascii'
let g:netrw_browse_split      = 3

let g:netrw_cygwin = 0
let g:netrw_ssh_cmd  = '"plink.exe" -batch -T -ssh'
let g:netrw_scp_cmd  = '"pscp.exe"  -q -scp'
"let g:netrw_sftp_cmd  = '"pscp.exe"  -q -sftp'
let g:netrw_sftp_cmd = '"psftp.exe"'

" ========================================================= 
"let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
let g:ctrlp_max_depth = 140
let g:ctrlp_max_files = 20000
let g:ctrlp_working_path_mode = 0 " use NerdTree to change the directory, we have so many code files.
  "let g:ctrlp_custom_ignore = {
    "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
    "\ 'file': '\v\.(exe|so|dll)$',
    "\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    "\ }
let g:ctrlp_custom_ignore={ 
	    \ 'dir': '\.git$\|\.hg$\|\.svn$',
	    \ 'file': '\.class$\|\.o$\|\.d$|\.pyc$',
	    \}

"--------------------------------------------------------- 
" Tlist
"set title titlestring=%<%f\ %([%{Tlist_Get_Tagname_By_Line()}]%)
"let Tlist_Inc_Winwidth = 0
let Tlist_WinWidth=25
"set titlestring=%<%f\ %([%{Tlist_Get_Tagname_By_Line()}]%)
"let Tlist_Inc_Winwidth = 1
"let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
map <F8> :Tlist<cr>

"Nerd tree--------------------------------------------------------- 
let NERDTreeIgnore=['^CVS$', '.svn$','.pyc$']
let NERDTreeShowBookmarks=1
let NERDTreeChDirMode=2
map <F2> :NERDTree <cr>

"Nerd comment--------------------------------------------------------- 
let NERDShutUp=1

"--------------------------------------------------------- 
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,*.svn*,*.so,*.a,*.o,*.pyc" 

"========================================================= 
" jedi-vim
let g:jedi#call_signature_escape=1 

"========================================================= 
" emmet
let g:user_emmet_expandabbr_key='<c-e>' 
"execute current line
map ,ssh 0y$:call conque_term#open('ssh '.@",['tabnew'])<cr>


"========================================================= 
" ConqueTerm

"if MySys() != "windows"
    ""let g:ConqueTerm_TERM='xterm' 
    "let g:ConqueTerm_PromptRegex = '^\w\+@[0-9A-Za-z_.-]\+:[0-9A-Za-z_./\~,:-]\+\$'
"endif

"========================================================= 
"clang_complete
let g:clang_exec='clang++'
"let g:clang_hl_errors=1
let g:clang_complete_copen=1
let g:clang_periodic_quickfix=1
"let g:clang_snippets=1
"let g:clang_close_preview=1
nmap <leader>uq :call g:ClangUpdateQuickFix()
"let g:clang_user_library=1

"========================================================= 
"ultisnips
   let g:UltiSnipsExpandTrigger="<tab>"
   let g:UltiSnipsJumpForwardTrigger="<tab>"
   let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


"=============================================================================
" Programming setting
"=============================================================================

augroup filetypedetect
    au BufNewFile,BufRead *.auiml setf xml
    au BufNewFile,BufRead *.pcml setf xml
    au BufNewFile,BufRead *.htmldoc setf html
    au BufNewFile,BufRead *.htm setf html
    au BufNewFile,BufRead *.m setf c 
    autocmd FileType make setlocal noexpandtab
    autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
    autocmd FileType sh set tabstop=4|set shiftwidth=4|set expandtab
augroup END


command! -nargs=? -range Dec2hex call s:Dec2hex(<line1>, <line2>, '<args>')
function! s:Dec2hex(line1, line2, arg) range
    if empty(a:arg)
	if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
	    let cmd = 's/\%V\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
	else
	    let cmd = 's/\<\d\+\>/\=printf("0x%x",submatch(0)+0)/g'
	endif
	try
	    execute a:line1 . ',' . a:line2 . cmd
	catch
	    echo 'Error: No decimal number found'
	endtry
    else
	echo printf('%x', a:arg + 0)
    endif
endfunction

command! -nargs=? -range Hex2dec call s:Hex2dec(<line1>, <line2>, '<args>')
function! s:Hex2dec(line1, line2, arg) range
    if empty(a:arg)
	if histget(':', -1) =~# "^'<,'>" && visualmode() !=# 'V'
	    let cmd = 's/\%V0x\x\+/\=submatch(0)+0/g'
	else
	    let cmd = 's/0x\x\+/\=submatch(0)+0/g'
	endif
	try
	    execute a:line1 . ',' . a:line2 . cmd
	catch
	    echo 'Error: No hex number starting "0x" found'
	endtry
    else
	echo (a:arg =~? '^0x') ? a:arg + 0 : ('0x'.a:arg) + 0
    endif
endfunction

" ebcdic convertion with ascii
"func! EBCDIC2ascii()
"set shellredir=>%s
"%!dd conv=ascii
"set shellredir=>%s\ 2>&1
"endfunction

"func! ASCII2ebcdic()
"set shellredir=>%s
"%!dd conv=ebcdic
"set shellredir=>%s\ 2>&1
"endfunction

"" ========================================================
"" settings of cscope.
""
"" I use GNU global instead cscope because global is faster.
set cscopetag
set cscopeprg=gtags-cscope
set cscopequickfix=c-,d-,e-,f-,g0,i-,s-,t-
nmap ,ff :lcs f f 
"map ,ff  :copen \| cs f f
"map ,FF :FindFiles **/*.\(c\\|cpp\\|h\\|m\\|hxx\\|cxx\\|hpp\\|mm\) [seach_dir]
map ,gu :!global -u<cr>
nmap <silent> <leader>fg <ESC>:lcs f g <c-r><c-w><CR>
nmap <silent> <leader>ft <ESC>:lcs f t <c-r><c-w><CR>:lw<cr>
nmap <silent> <leader>fc <ESC>:lcs f c <c-r><c-w><cr>:lw<cr>
nmap <silent> <leader>fs <ESC>:lcs f s <c-r><c-w><cr>:lw<cr>
nmap <silent> <leader>ff <ESC>:lcs f f <c-r><c-w><cr>:lw<cr>
nmap <silent> <leader>fi <ESC>:lcs f i <c-r><c-w><cr>:lw<cr>
command! -nargs=+ -complete=dir FindFiles :call FindFiles(<f-args>)
au VimEnter * call VimEnterCallback()
au BufAdd *  call FindGtags(expand('<afile>'))
au BufWritePost *.\(java\|c\|cpp\|h\|m\|hxx\|cxx\|hpp\|mm\|py\) call UpdateGtags(expand('<afile>'))
 
function! FindFiles(pat, ...)
     let path = ''
     for str in a:000
	 let path .= str . ','
     endfor
 
     if path == ''
	 let path = &path
     endif
 
     echo 'finding...'
     redraw
     call append(line('$'), split(globpath(path, a:pat), '\n'))
     echo 'finding...done!'
     redraw
endfunc
 
function! VimEnterCallback()
     for f in argv()
	 if fnamemodify(f, ':e') != 'c' && fnamemodify(f, ':e') != 'h'
	     continue
	 endif
 
	 call FindGtags(f)
     endfor
endfunc
 
function! FindGtags(f)
     let curFile= fnamemodify(a:f, ':p')
     if !filereadable(curFile)
	"we don't care about special bufs
     	return 
     endif

     let dir = fnamemodify(a:f, ':p:h')
     while 1
	 let tmp = dir . '/GTAGS'
	 " Most of our python project is using pydev
	 let tmp_python = dir . '/.pydevproject'
	 if filereadable(tmp_python)
         exec 'let $PYTHONPATH="'.dir.'/src:'.dir.'"'		     
         "exec 'set PYTHONPATH="'.dir.'/src:'.dir.'"'		     
         "exec 'export PYTHONPATH="'.dir.'/src:'.dir.'"'		     
	     exec 'py import os;os.environ["PYTHONPATH"]="'.dir.'/src:'.dir.'"'

	 endi
	 if filereadable(tmp)
	     silent echo dir
	     silent exec 'lcd' dir
	     silent exec 'cs add ' . tmp . ' ' . dir
	     break
	 elseif dir == '/' || dir =~ ':\\$' || dir =~ ':\/$'
	     break
	 endif
 
	 let dir = fnamemodify(dir, ":h")
     endwhile
endfunc
 
function! UpdateGtags(f)
     call FindGtags(a:f)
     "let dir = fnamemodify(a:f, ':p:h')
     "exe 'silent !cd ' . dir . ' && global -u &> /dev/null &'
     silent exec '!global -u &> /dev/null &'
endfunction
