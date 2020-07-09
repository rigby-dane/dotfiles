set nocompatible
set mouse=a
set backspace=2
set nowrap
set encoding=utf8
set hidden

set relativenumber
set number

set shiftwidth=4
set tabstop=4
set expandtab

set autoindent
set smartindent

set cursorline
set cursorcolumn
set ic
set splitbelow

set incsearch

""Settings for coc.nvim
set updatetime=300
set shortmess+=c
set signcolumn=yes
set re=0

let mapleader = ';'

syntax on

packadd termdebug

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'airblade/vim-rooter'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-fugitive'
call plug#end()


" Colorscheme
colorscheme gruvbox

" TODO: Organize into seperate files?

" Highlighting options
let g:python_highlight_all=1

" Airline Settings
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts=1 
let g:airline#extensions#tabline#enabled=1

" COC Settings

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
      let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

let g:coc_global_extensions = [
    \'coc-tsserver', 
    \'coc-prettier',
    \'coc-json', 
    \'coc-python',
    \'coc-rls',
    \]


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
"
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position.
" " Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
"
" " Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
"
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
"
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

nnoremap <leader>r <Plug>(coc-range-select) 

" Using CocList
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

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

" NerdTree Settings

noremap <silent> <leader>n :NERDTreeToggle <CR>

" NerdCommenter Settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
"
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" FZF Settings

nnoremap <leader>f :Files<cr>
nnoremap <leader>t :Tags<cr>

let g:fzf_layout = { 'down': '~25%' }


" Tagfile Settings
set tags=./tags
set cpoptions+=d

" Closetag settings
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx,typescriptreact'
let g:closetag_filetypes = 'html,xhtml,jsx,tsx,typescriptreact'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Vim-Fugitive Settings

nmap <leader>gs :G<CR>
nmap <leader>gl :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>


" Language Specific Settings
autocmd FileType javascript,jsx,typescript,tsx,typescriptreact,xml setlocal shiftwidth=2|setlocal tabstop=2

" Misc Settings/Keybinds
nnoremap <silent> <S-Tab> :bp <CR>
nnoremap <silent> <Tab> :bn <CR>
nnoremap <silent> <leader>d :bd <CR>

nnoremap ? ;
vnoremap ? ;

" Trying this out to see if I like this bind to normal mode
inoremap kj <Esc>

" Custom Scripts

" For a transparent background -> Remove if not needed/wanted
" highlight Normal ctermbg=none
" highlight NonText ctermbg=none

nnoremap <leader>r :call CompileAndRunSingleFile()<CR>

function! CompileAndRunSingleFile()
    if &filetype != 'cpp' && &filetype != 'c'
        echo "This command is only available in C/C++"
        return
    endif

    let l:cmd = ""
    if &filetype == 'cpp'
        let l:cmd = 'clang++'
    endif
    if &filetype == 'c'
        let l:cmd = 'clang'
    endif

    let l:cmd=l:cmd.' -g '.expand('%:p').' -o '.expand('%:r').' && ./'.expand('%:r')
    let l:currentWindow=winnr()
    let l:height=winheight('%') / 4
    exec (l:height)." new "
    setlocal buftype=nofile
    setlocal bufhidden=hide
    let s:created_buf=bufnr('%')
    let s:lines = ['']
    let s:line_num = 1
    func! s:on_event(job_id, data, event) dict
      let eof = (a:data == [''])
      " Complete the previous line.
      let s:lines[-1] .= a:data[0]
      " Append (last item may be a partial line, until EOF).
      call extend(s:lines, a:data[1:])
      if len(s:lines) > 1
          call nvim_buf_set_lines(s:created_buf, 0, s:line_num, v:false, s:lines[:-2])
          let s:line_num += 1
      endif
    endf
    let s:job_id = jobstart(l:cmd, {'on_stdout': function('s:on_event'), 'on_stderr': function('s:on_event')})
    call jobwait([s:job_id])
    call nvim_buf_set_lines(s:created_buf, 0, s:line_num, v:false, s:lines)
endfunction



