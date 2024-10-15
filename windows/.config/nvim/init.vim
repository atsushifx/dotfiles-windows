"" neovim settings
"" @(#) vim user specific settings[
""
"
" @versiion  1.0.0
" @author    Furukawa, Atsushi <atsushifx@aglabo.com>
" @date      2023-03-26
" @license   MIT
"

""
" viminfo
set viminfofile=$XDG_CACHE_HOME/nvim/_nviminfo


"" for plugins package
set packpath+="$XDG_CONFIG_HOME/nvim"

"" vim common settings
" shell
" set shell=pwsh

" encoding : default display Japanese
set fenc=utf-8
set encoding=utf-8
set fileformats=unix


" disp line number
set number

set virtualedit=block
set backspace=indent,eol,start

"" Plugins
" load jetpack to autoload
let s:jetpackfile = stdpath('config') . '/autoload/jetpack.vim'
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if !filereadable(s:jetpackfile)
  let s:jetpackloader = printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl)
  call system(s:jetpackloader)
endif

" packadd vim-jetpack

" plugins
call jetpack#begin()
Jetpack 'tani/vim-jetpack', { 'opt': 1 }  " bootstrap

" load plugins
Jetpack 'gpanders/editorconfig.nvim'
Jetpack 'wakatime/vim-wakatime'

Jetpack 'lambdalisue/fern.vim'       " File Manager

call jetpack#end()

" auto install plugins
for name in jetpack#names()
  if !jetpack#tap(name)
    call jetpack#sync()
    break
  endif
endfor
