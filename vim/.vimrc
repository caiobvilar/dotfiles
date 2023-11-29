set background=dark
set number
syntax on
set smartindent
filetype indent plugin on
set shiftwidth=2
set tabstop=2
set smarttab
" Set 'comments' to format dashed lists in comments."
setlocal comments=s0:*\ -,m0:*\ \ ,ex0:*/,s1:/*,mb:*,ex:*/,://
set formatoptions+=r
autocmd BufNewFile,BufRead *.md set filetype=markdown
