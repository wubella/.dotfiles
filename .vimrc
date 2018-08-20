syntax enable 
colorscheme base16-tomorrow
"hi Normal ctermfg=lightgrey ctermbg=Black
set t_Co=16
"show filename in title bar
set title
set titleold=""
set titlestring=%{substitute(getcwd(),\ $HOME,\ '~',\ '')}"%{getcwd()}

set nocompatible
filetype plugin on
syntax on

"need to make custom colors right on session restore
set sessionoptions-=options
"display current dir and filename in status bar
set laststatus=2
set statusline=%F "%!getcwd()
set statusline +=%m                "modified flag
set statusline +=%=%l              "current line
set statusline +=%=/%L             "total lines
"hi StatusLine ctermfg=LightGray ctermbg=Black
hi StatusLine cterm=underline ctermfg=White ctermbg=Black
"set autochdir

"setup line numbers
set number "add line numbers
"set relativenumber "add relative line numbers
hi LineNr ctermbg=Black ctermfg=DarkGray
hi CursorLineNr ctermbg=Black ctermfg=DarkGray

hi MatchParen cterm=underline ctermbg=Black ctermfg=Gray
hi Search ctermbg=Black
hi Explorer cterm=underline ctermbg=Black
hi Folded ctermbg=Black
hi DiffChange cterm=none ctermbg=DarkYellow ctermfg=Black
hi DiffText   cterm=none ctermbg=DarkBlue ctermfg=Black
hi DiffDelete cterm=none ctermbg=DarkRed ctermfg=Black
hi DiffAdd    cterm=none ctermbg=DarkGreen ctermfg=Black

nnoremap <Leader>t :tabedit 
nnoremap <Leader><Tab> :tabnext<CR>
nnoremap <Leader><S-Tab> :tabprevious<CR>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

"file formatting
set tabstop=2 expandtab shiftwidth=2
autocmd FileType c setlocal autoindent cindent expandtab
au BufRead,BufNewFile *.md set filetype=pandoc

"prettify split boundaries
set splitbelow
set splitright
set fillchars+=vert:\|
hi VertSplit ctermbg=Black ctermfg=White
hi StatusLineNC cterm=underline ctermfg=darkGray ctermbg=Black

"Prettify tab ui
"set showtabline=2
hi TabLineFill term=none cterm=none ctermbg=Black ctermfg=DarkGray
hi TabLine term=none cterm=none ctermbg=Black ctermfg=Gray
hi TabLineSel term=underline cterm=underline ctermbg=Black ctermfg=Gray

"gitgutter brighter colors
hi GitGutterDelete ctermfg=Red ctermbg=Black
hi GitGutterAdd ctermfg=Green ctermbg=Black
hi GitGutterChange ctermfg=Yellow ctermbg=Black
hi GitGutterChangeDelete ctermbg=Black

"tabcomplete attempt needs more work
set wildmode=longest,list,full
set wildmenu
set completeopt=longest,menuone

execute pathogen#infect()

function MyTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
      " select the highlighting
      if i + 1 == tabpagenr()
        let s .= '%#TabLineSel#'
      else
        let s .= '%#TabLine#'
      endif

      " set the tab page number (for mouse clicks)
      let s .= '%' . (i + 1) . 'T'
      let s .= ' '
      let s .= i + 1 . ' '
      let m = 0       " &modified counter

      for b in tabpagebuflist(i + 1)
        if getbufvar( b, "&modified" )
          let m += 1
        endif
      endfor

      let n = i + 1
      let buflist = tabpagebuflist(n)
      let winnr = tabpagewinnr(n)
      " the label is made by MyTabLabel()
      let s .= fnamemodify(bufname(buflist[winnr - 1]), ':t')
      if m > 0
        let s .= '[+]'
      endif
      let s .= ' '
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
      let s .= '%=%#TabLine#%999X'
    endif

    return s
  endfunction

"
set tabline=%!MyTabLine()  " custom tab pages line

function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>
