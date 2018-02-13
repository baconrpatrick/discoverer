
set nocompatible

set belloff=all
set cmdheight=3
set history=100	" keep 50 lines of command line history
set hlsearch    " highlight searches
set ignorecase
set incsearch	" do incremental searching
set laststatus=2
set lines=40 columns=140
set lines=42 columns=195
set noeb
set novb
set number
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set showmatch
set smartcase
set wildmode=list:full

filetype plugin on
filetype plugin indent on
syntax on

" **********cursor ****************
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" *********************************
" remove menu and tool bar for gui
"
set guioptions -=m 
set guioptions -=T

" *********************************
"
"
"set spell spelllang=en_us
"set nospell
"-----------default/unnamed register = clipboard-------
"set clipboard+=unnamed

"-----------Powershell for Shell ----------------------
" for vimdiff, comment the shell and shellcmdflag settings
"set shell=powershell
"set shellcmdflag=-command
"set shellpipe=|
"set shellredir=>

"-----------I use Oracle SQL --------------------------

let g:sql_type_default = 'Oracle'
"let s:SQL_SetType('Oracle')

"-----------Formatting --------------------------------
" Formatting {
" set list "this is for showing the end of lines

set autoindent " indent at the same level of the previous line
set expandtab " tabs are spaces, not tabs
set pastetoggle=<F12> " pastetoggle (sane indentation on pastes)
set shiftwidth=4 " use indents of 4 spaces
set softtabstop=4 " let backspace delete indent
set tabstop=4 " an indentation every four columns
set wrap " wrap long lines

autocmd FileType sql,pkb,pks,c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }
"
"
"----------Mappings-----------------------------------
" use space key for visual inner word selection
" http://learnvimscriptthehardway.stevelosh.com/chapters/03.html
"
"
let mapleader = "-"
map <space> viw
" proper case for Single word
"imap <BS> <ESC>j
" want to have standard behavior 
"
nnoremap <leader>eh :vert help index 
nnoremap <leader>ev :vsplit $MYVIMRC
nnoremap <leader>lc :let @*=@
nnoremap <leader>pc lbguw~b 
nnoremap <leader>sv :source $MYVIMRC
nnoremap <leader>u YpVr-


" conemu backspace issue resolution
"https://conemu.github.io/en/VimXterm.html#vim-bs-issue

"inoremap <Char-0x07F> <BS>
"nnoremap <Char-0x07F> <BS>




"----------Abbreviations------------------------------
ab cformat# column col_1 format a30
ab constraint#  select <CR>* <CR>from <CR>all_constraints cons, <CR>all_cons_columns conc <CR>where <CR>1=1 <CR>and conc.table_name = '&table' <CR>and cons.owner = conc.owner <CR>and cons.table_name = conc.table_name <CR>and cons.constraint_name = conc.constraint_name
ab createt# CREATE TABLE SCOTT.DEPT1(<CR>DEPTNO NUMBER(2,0), <CR>DNAME VARCHAR2(14 BYTE), <CR>LOC VARCHAR2(13 BYTE), <CR>PRIMARY KEY (DEPTNO) <CR>USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 <CR>STORAGE(INITIAL 106496 NEXT 106496 MINEXTENTS 1 MAXEXTENTS 505 PCTINCREASE 100 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) <CR>TABLESPACE SYSTEM  ENABLE) <CR>SEGMENT CREATION IMMEDIATE PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 <CR>NOCOMPRESS LOGGING STORAGE(INITIAL 106496 NEXT 106496 MINEXTENTS 1 MAXEXTENTS 505 PCTINCREASE 100 FREELISTS 1 FREELIST GROUPS 1 <CR>BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE XXCMFG_DATA/
ab index#  select <CR>* <CR>from all_indexes ind, <CR>all_ind_columns icol <CR>where <CR>1=1 <CR>and ind.table_name = '&table' <CR>and ind.owner = icol.index_owner <CR>and ind.table_name = icol.table_name <CR>and ind.index_name = icol.index_name
ab meeting# ---------------------------------------------------------<CR>--      meeting notes                                  --<CR>--                                                     --<CR>--                                                     --<CR>---------------------------------------------------------<CR>
ab spool# spool C:\temp\temp1.lst
ab with# with t(a_col) <CR>as<CR>(select 'stuff' a_col from dual) <CR>select<CR> * <CR>from t

"
"
"-----------Runtime Setting---------------------------



"-----------netrw file navigation settings------------
let g:netrw_altv          = 1
let g:netrw_fastbrowse    = 2
let g:netrw_keepdir       = 0
let g:netrw_liststyle     = 3
let g:netrw_retmap        = 1
let g:netrw_silent        = 1
let g:netrw_special_syntax= 1

"-----------Formatting --------------------------------
"
" saw this suggested for conemu
"if !has("gui_running")
"    set term=xterm
"    set t_Co=256
""    let &t_AB="\e[48;5;%dm"
""    let &t_AF="\e[38;5;%dm"
"endif

if has("gui_running") && has("gui_gtk2")
   set guifont=Inconsolata\ 12
endif

if has("gui_win32") || has("gui_win64")
  hi Comment ctermbg=0
  set guifont=Consolas:h11:cANSI
endif

if !has("unix") && !has("gui_running") 
"    source $VIMRUNTIME\plugin\csapprox\plugin\CSApprox.vim
"    source $VIMRUNTIME\plugin\vim-csexact\plugin\CSExact.vim
endif

if has("unix")
    set t_Co=256
"    source $VIMRUNTIME/plugin/csapprox/plugin/CSApprox.vim
"    source $VIMRUNTIME/plugin/vim-csexact/plugin/CSExact.vim
endif


"-----------Encoding    -------------------------------
"
set fileencodings=utf8
set encoding=utf8
set termencoding=utf8
set fileencoding=utf8

"-----------end encoding ------------------------------

"-----------Plugins ----------------------------------
" see help runtimepath or rtp, echo $HOME
"  http://stackoverflow.com/questions/8709091/plugins-in-gvim-not-working
"  
"  would like to use this package manager: 
"  https://github.com/k-takata/minpac
"
"  this looks interesting, but not for windows:
"  https://github.com/camfowler/vim
"
"
if has("unix") 
	source $VIMRUNTIME/colors/desert.vim
	source $VIMRUNTIME/plugin/vimballPlugin.vim
	source $HOME/vimfiles/plugin/showmarks.vim
"
"   ***moved this to pack\baconp\start**** 
"
"	source $HOME/vimfiles/plugin/AlignPlugin.vim
"   sqlutilities depends on align dr chip
"   source $HOME/vimfiles/plugin/SQLUtilities.vim
"	throws a lot of errors in cygwin
"	source $HOME/vim/plugin/easy_align.vim 
"	source $HOME/vim/plugin/Tabular.vim 
endif

if !has("unix")
	source $VIMRUNTIME\vimrc_example.vim
	source $VIMRUNTIME\mswin.vim
	source $VIMRUNTIME\colors\desert.vim
	source $VIMRUNTIME\plugin\vimballPlugin.vim
	source $HOME\vimfiles\plugin\showmarks.vim
"
"   ***moved this to pack\baconp\start**** 
"
"	source $HOME\vimfiles\plugin\AlignPlugin.vim
"   sqlutilities depends on align dr chip
"	source $HOME\vimfiles\plugin\SQLUtilities.vim
"	source $HOME\vimfiles\plugin\easy_align.vim 
"	source $HOME\vimfiles\plugin\Tabular.vim 
"	source $HOME\vimfiles\plugin\matrix.vim 
"	source $HOME\vimfiles\plugin\vimwiki.vim 
"   source $HOME\vimfiles\plugin\ttcoach\plugin\ttcplug.vim
endif
"-----------end plugins -------------------------------

if !has("unix") 
   behave mswin
endif

"-----------package manager----------------------------

"most of my plugins have been placed in \pack\baconp\start\

packadd minpac
call minpac#init()
call minpac#add('baconp/minpac', {'type': 'opt'})
" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
"call minpac#add('k-takata/minpac', {'type': 'opt'})
"call minpac#add('vim-jp/syntax-vim-ex')
"call minpac#add('vim-airline/vim-airline')
"noticed that I need to be careful about dependencies


"-----------package manager----------------------------

set diffexpr=MyDiff()

 function MyDiff()
   let opt = '-a --binary '
   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
   let arg1 = v:fname_in
   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
   let arg2 = v:fname_new
   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
   let arg3 = v:fname_out
   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
   if $VIMRUNTIME =~ ' '
     if &sh =~ '\<cmd'
       if empty(&shellxquote)
         let l:shxq_sav = ''
         set shellxquote&
       endif
       let cmd = '"' . $VIMRUNTIME . '\diff"'
     else
       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
     endif
   else
     let cmd = $VIMRUNTIME . '\diff'
   endif
   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
   if exists('l:shxq_sav')
     let &shellxquote=l:shxq_sav
   endif
 endfunction
