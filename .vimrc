"$Id: .vimrc,v 1.6 2004-11-30 11:03:00 hitier Exp $
"pif

set hls

filetype plugin on
filetype indent on

syntax on
syntax enable

set foldmethod=syntax
set foldenable
syn region foldBraces start=/{/ end=/}/ transparent fold


set autowriteall     "quitter changer sans sauver a la main

"map gf :e <cfile><CR> " n'expand pas le ~ :(

set matchpairs+=<:> " pour la cmd '%"
set showmatch

set ignorecase      " recherche intelligente
set smartcase
"set hlsearch

set nocompatible	" supprimer  compatibilite -vi-

set autoindent
set tabstop=4
set shiftwidth=4
set expandtab

set ruler
set nobackup

set tw=60
set fo=tcqr
set bg=dark
set nowrap

set encoding=utf8

source ~/.vim/.vim_autocmd
source ~/.vim/.vim_mappings


" TABS Configuration

" Couleur du tab actif
hi TabLineSel ctermfg=White ctermbg=Blue gui=bold guifg=#ffffff guibg=#005f87

" Couleur des tabs inactifs
hi TabLine ctermfg=Black ctermbg=Grey guifg=#888888 guibg=#303030 gui=NONE cterm=NONE

" Couleur de la partie après le dernier tab
hi clear TabLineFill 
