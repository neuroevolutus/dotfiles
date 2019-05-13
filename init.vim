" Location: ~/.config/nvim/init.vim

set number relativenumber
" To keep the cursor vertically
" centered on the screen
set scrolloff=999
set tabstop=4
set noexpandtab
set mouse=nicr
set clipboard=unnamed
set ttimeoutlen=100

filetype plugin on

" To perform escape using home row keys
imap jj <Esc>
vmap nn <Esc>

" Navigate window splits more easily
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Veonim configuration
if exists('veonim')
        let g:vscode_extensions = [
                \'rust-lang.rust',
                \'ms-python.python',
        \]

        set guifont='14pt\ Hasklig\ Medium'
        set linespace=10

        " multiple nvim instances
        nno <silent> <c-t>c :Veonim vim-create<cr>
        nno <silent> <c-g> :Veonim vim-switch<cr>
        nno <silent> <c-t>, :Veonim vim-rename<cr>

        " workspace functions
        nno <silent> ,f :Veonim files<cr>
        nno <silent> ,e :Veonim explorer<cr>
        nno <silent> ,b :Veonim buffers<cr>
        nno <silent> ,d :Veonim change-dir<cr>
        "or with a starting dir: nno <silent> ,d :Veonim change-dir ~/proj<cr>

        " searching text
        nno <silent> <space>fw :Veonim grep-word<cr>
        vno <silent> <space>fw :Veonim grep-selection<cr>
        nno <silent> <space>fa :Veonim grep<cr>
        nno <silent> <space>ff :Veonim grep-resume<cr>
        nno <silent> <space>fb :Veonim buffer-search<cr>

        " language features
        nno <silent> sr :Veonim rename<cr>
        nno <silent> sd :Veonim definition<cr>
        nno <silent> si :Veonim implementation<cr>
        nno <silent> st :Veonim type-definition<cr>
        nno <silent> sf :Veonim references<cr>
        nno <silent> sh :Veonim hover<cr>
        nno <silent> sl :Veonim symbols<cr>
        nno <silent> so :Veonim workspace-symbols<cr>
        nno <silent> sq :Veonim code-action<cr>
        nno <silent> sk :Veonim highlight<cr>
        nno <silent> sK :Veonim highlight-clear<cr>
        nno <silent> ,n :Veonim next-usage<cr>
        nno <silent> ,p :Veonim prev-usage<cr>
        nno <silent> sp :Veonim show-problem<cr>
        nno <silent> <c-n> :Veonim next-problem<cr>
        nno <silent> <c-p> :Veonim prev-problem<cr>
endif

call plug#begin("~/.local/share/nvim/plugged")

" https://github.com/arcticicestudio/nord-vim
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
" https://github.com/junegunn/fzf.vim
Plug 'https://github.com/junegunn/fzf.vim'
" https://github.com/w0rp/ale#standard-installation
Plug 'w0rp/ale'
" https://github.com/OmniSharp/omnisharp-vim
Plug 'OmniSharp/omnisharp-vim'
" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
" https://github.com/godlygeek/tabular
Plug 'godlygeek/tabular'
" https://github.com/romgrk/winteract.vim
Plug 'romgrk/winteract.vim'
" https://github.com/907th/vim-auto-save
Plug '907th/vim-auto-save'
Plug 'vim-scripts/restore_view.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

call plug#end()

" AutoSave configuration
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" NERDTree configuration
map <C-n> :NERDTreeToggle<CR>

" Winteract configuration
nmap <leader>w :InteractiveWindow<CR>

" Nord configuration
colorscheme nord
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
" The below attribute was deprecated 
" let g:nord_comment_brightness = 12
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1

" --------------------------------- OmniSharp configuration --------------------------------- 
let g:OmniSharp_server_use_mono = 1
" OmniSharp won't work without this setting
filetype plugin on


" --------------------------------- OmniSharp configuration --------------------------------- 
let g:OmniSharp_server_use_mono = 1
" OmniSharp won't work without this setting
filetype plugin on

" Set the type lookup function to use the preview window instead of echoing it
let g:OmniSharp_typeLookupInPreview = 1

" Timeout in seconds to wait for a response from the server
let g:OmniSharp_timeout = 5

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview' if you
" don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview

" Fetch full documentation during omnicomplete requests.
" There is a performance penalty with this (especially on Mono).
" By default, only Type/Method signatures are fetched. Full documentation can
" still be fetched when you need it with the :OmniSharpDocumentation command.
"let g:omnicomplete_fetch_full_documentation = 1

" Set desired preview window height for viewing documentation.
" You might also want to look at the echodoc plugin.
set previewheight=5

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

augroup omnisharp_commands
    autocmd!

    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck

    " Show type information automatically when the cursor stops moving
    autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>


    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

nnoremap <Leader>cf :OmniSharpCodeFormat<CR>

" Start the omnisharp server for the current solution
nnoremap <Leader>ss :OmniSharpStartServer<CR>
nnoremap <Leader>sp :OmniSharpStopServer<CR>

" Add syntax highlighting for types and interfaces
nnoremap <Leader>th :OmniSharpHighlightTypes<CR>

" Enable snippet completion
let g:OmniSharp_want_snippet=1

" --------------------------------- End OmniSharp configuration --------------------------------- 

" ALE
let g:ale_linters = { 'cs': ['OmniSharp'] }

" NerdTree configuration
nnoremap <C-H> <C-W><C-H>

