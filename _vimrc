set nocompatible
set number
set cmdheight=3
set history=100	" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch	" do incremental searching
set hlsearch    " highlight searches
set laststatus=2
set ignorecase
set smartcase
set wildmode =full
set lines=40 columns=140
set showmatch

filetype plugin on
filetype plugin indent on
syntax on

" **********cursor ****************
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" *********************************
"set spell spelllang=en_us
"set nospell
"-----------default/unnamed register = clipboard-------
"set clipboard+=unnamed
"-----------status line -------------------------------

"set statusline=[%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%\ \ \  TIME:\ %{strftime('%c')}
"set statusline=\PATH:\ %r%F\ \ \ \ \line:%l/%L\ col:%c\ TIME:\ %{strftime('%c')}

"-----------Powershell for Shell ----------------------
" for vimdiff, comment the shell and shellcmdflag settings
"set shell=powershell
"set shellcmdflag=-command
"set shellpipe=|
"set shellredir=>

"-----------I use Oracle SQL --------------------------

let g:sql_type_default = 'Oracle'

"-----------Formatting --------------------------------
" Formatting {
" set list "this is for showing the end of lines
set wrap " wrap long lines
set autoindent " indent at the same level of the previous line
set shiftwidth=4 " use indents of 4 spaces
set expandtab " tabs are spaces, not tabs
set tabstop=4 " an indentation every four columns
set softtabstop=4 " let backspace delete indent
"set matchpairs+=<:> " match, to be used with %
set pastetoggle=<F12> " pastetoggle (sane indentation on pastes)
"set comments=sl:/*,mb:*,elx:*/ " auto format comment blocks
" Remove trailing whitespaces and ^M chars
autocmd FileType sql,pkb,pks,c,cpp,java,php,js,python,twig,xml,yml autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
" }
"
"----------Mappings-----------------------------------
" use space key for visual inner word selection
" http://learnvimscriptthehardway.stevelosh.com/chapters/03.html
"
"
let mapleader = "-"
map <space> viw
" proper case for Single word
map <c-p> lbguw~b 
nnoremap <leader>ev :vsplit $MYVIMRC
nnoremap <leader>sv :source $MYVIMRC

"----------Abbreviations------------------------------

"    source $VIMRUNTIME\abbreviations\my_abbreviations.vim
" newline characters into your mapping by pressing <Ctrl-v><Enter>
" for uniqueness so that not invoked accidently, place a '#' after abb form
" lhs. 
"
ab cformat# column col_1 format a30
ab with# with t(a_col) <CR>as<CR>(select 'stuff' a_col from dual) <CR>select<CR> * <CR>from t
ab constraint#  select <CR>* <CR>from <CR>all_constraints cons, <CR>all_cons_columns conc <CR>where <CR>1=1 <CR>and conc.table_name = '&table' <CR>and cons.owner = conc.owner <CR>and cons.table_name = conc.table_name <CR>and cons.constraint_name = conc.constraint_name
ab index#  select <CR>* <CR>from all_indexes ind, <CR>all_ind_columns icol <CR>where <CR>1=1 <CR>and ind.table_name = '&table' <CR>and ind.owner = icol.index_owner <CR>and ind.table_name = icol.table_name <CR>and ind.index_name = icol.index_name
ab spool# spool C:\temp\temp1.lst
ab createt# CREATE TABLE SCOTT.DEPT1(<CR>DEPTNO NUMBER(2,0), <CR>DNAME VARCHAR2(14 BYTE), <CR>LOC VARCHAR2(13 BYTE), <CR>PRIMARY KEY (DEPTNO) <CR>USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 <CR>STORAGE(INITIAL 106496 NEXT 106496 MINEXTENTS 1 MAXEXTENTS 505 PCTINCREASE 100 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) <CR>TABLESPACE SYSTEM  ENABLE) <CR>SEGMENT CREATION IMMEDIATE PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 <CR>NOCOMPRESS LOGGING STORAGE(INITIAL 106496 NEXT 106496 MINEXTENTS 1 MAXEXTENTS 505 PCTINCREASE 100 FREELISTS 1 FREELIST GROUPS 1 <CR>BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE XXCMFG_DATA/
ab meeting# -------------------------------------------------------<CR>\|      meeting notes                                  \|<CR>\|                                                     \|<CR>\|                                                     \|<CR>-------------------------------------------------------<CR>

"
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

if has("gui_running") && has("gui_gtk2")
   set guifont=Inconsolata\ 12
endif

if has("gui_win32")
  set guifont=Consolas:h11:cANSI
endif

if !has("unix") && !has("gui_running") 
"    source $VIMRUNTIME\plugin\csapprox\plugin\CSApprox.vim
"    source $VIMRUNTIME\plugin\vim-csexact\plugin\CSExact.vim
endif

if has("unix")
"    source $VIMRUNTIME/plugin/csapprox/plugin/CSApprox.vim
"    source $VIMRUNTIME/plugin/vim-csexact/plugin/CSExact.vim
endif

"-----------Plugins ----------------------------------
" see help runtimepath or rtp, echo $HOME
"  http://stackoverflow.com/questions/8709091/plugins-in-gvim-not-working
"
if has("unix") 
	source $VIMRUNTIME/colors/desert.vim
	source $VIMRUNTIME/plugin/vimballPlugin.vim
	source $HOME/vim/plugin/showmarks.vim
	source $HOME/vim/plugin/SQLUtilities.vim
"	throws a lot of errors in cygwin
"	source $HOME/vim/plugin/easy_align.vim 
"	source $HOME/vim/plugin/Tabular.vim 
endif

if !has("unix")
	source $VIMRUNTIME\vimrc_example.vim
	source $VIMRUNTIME\mswin.vim
	source $VIMRUNTIME\colors\desert.vim
	source $VIMRUNTIME\plugin\vimballPlugin.vim
	source $HOME\vim\plugin\showmarks.vim
	source $HOME\vim\plugin\SQLUtilities.vim
	source $HOME\vim\plugin\easy_align.vim 
	source $HOME\vim\plugin\Tabular.vim 
endif
"-----------end plugins -------------------------------

if !has("unix") 
   behave mswin
endif



"-----------Encoding    -------------------------------
"
set fileencodings=utf8
set encoding=utf8
set termencoding=utf8
set fileencoding=utf8

"-----------end encoding ------------------------------

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
