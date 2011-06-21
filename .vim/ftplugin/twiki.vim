"============================================================================
"
" TWiki syntax file
"
" Language:        TWiki
" Last Change: Fri Jul  6 16:13:02 UTC 2007
" Maintainer:  Rainer Thierfelder <rainer{AT}rainers-welt{DOT}de>
" Additions:   Eric Haarbauer <ehaar{DOT}com{AT}grithix{DOT}dyndns{DOT}org>
" License:     GPL (http://www.gnu.org/licenses/gpl.txt)
"    Copyright (C) 2004-2006  Rainer Thierfelder
"
"    This program is free software; you can redistribute it and/or modify
"    it under the terms of the GNU General Public License as published by
"    the Free Software Foundation; either version 2 of the License, or
"    (at your option) any later version.
"
"    This program is distributed in the hope that it will be useful,
"    but WITHOUT ANY WARRANTY; without even the implied warranty of
"    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"    GNU General Public License for more details.
"
"    You should have received a copy of the GNU General Public License
"    along with this program; if not, write to the Free Software
"    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
"
"============================================================================
" Notes:    {{{1
"============================================================================
"
" This scripts contains options settings and functions for TWiki files
" (http://www.twiki.org).
"
" Options:
"
"   Customize the behavior of this ftplugin by setting values for the
"   following options in your .vimrc file.
"
"   g:Twiki_FoldAtHeadings
"     This variable, if set to a non-zero value, enables folding on TWiki
"     heading lines.  The fold level is defined by the number of plus-signs in
"     the heading marker.  For example, a line beginning with "---++" sets a
"     fold level of two until the next heading marker in the file.  If not
"     set, the option defaults to off.
"
"   g:Twiki_SourceHTMLSyntax
"     This Variable, if set to a non-zero value, enalbes sourcing of
"     HTLM-Syntax
"
" TODO
"   g:Twiki_Functions
"     If set, some (usefull) functions will be set
"
"============================================================================
" Initialization:    {{{1
"============================================================================
" Only do this when not done yet for this buffer
if exists("b:did_twiki_ftplugin")
  finish
endif

let b:did_twiki_ftplugin = 1

let b:undo_twiki_ftplugin = "setl com< cms< fdm< fo< foldexpr< wrap<"

let g:Twiki_FoldAtHeadings=1

" General options: {{{1

" Prevent textwidth formatting because TWiki files are wrapped on the client
" side at rendering time.
" rhi: bugware for set formatoptions-=taq
setlocal formatoptions-=t
setlocal formatoptions-=a
setlocal formatoptions-=q
setlocal wrap
setlocal commentstring=<!--%s-->

" Three-space indentation is significant to TWiki
setlocal tabstop=3
setlocal shiftwidth=3
setlocal softtabstop=3
" tabs should be converted to spaces
setlocal expandtab

" rhi: mardi 8 juin 2010, 10:30:53 (UTC+0200)
set textwidth=0
set linebreak
set wrapmargin=20
set showbreak=+


" Folding options and functions: {{{1

if exists("g:Twiki_FoldAtHeadings") &&
 \ g:Twiki_FoldAtHeadings != 0

    setlocal foldmethod=expr
    setlocal foldexpr=Twiki_GetFoldValue(v:lnum)

    " Set foldlevel equal to the level of TWiki heading
    function Twiki_GetFoldValue(lineNumber)

        let lineText  = getline(a:lineNumber)
        let foldValue = "="

        if lineText =~ "^---[#\|+]\\+"
            let pluses    = matchstr(lineText, "[#\|+]\\+", 3)
            let foldLevel = strlen(pluses)
            let foldValue = ">".foldLevel
        endif
        
        return foldValue

    endfunction " Twiki_GetFoldValue()
endif " Twiki_FoldAtHeadings

" Functions : {{{1
if exists("g:Twiki_Functions") &&
 \ g:Twiki_Functions != 0

    " function {{{2
    " TODO
    function TwikiUnderlineWord(word)
      s/a:word/_&_/
    endfunction "TWikiUnderlineWord(word)
endif

" Mapings : {{{1
if exists("g:Twiki_Mapings") &&
      \ g:Twiki_Mapings != 0 
  :map <F12> :call TWikiUnderlineWord("<cword>")<CR>
endif

" Mapings : {{{1
if exists("g:Twiki_Mapings") &&
      \ g:Twiki_Mapings != 0
endif
" Autoconfigure vim indentation settings
" vim:fdm=marker
