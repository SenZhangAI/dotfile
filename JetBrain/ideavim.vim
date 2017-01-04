set hlsearch
set incsearch
set ignorecase
set smartcase
set showmode
set number
set relativenumber
set scrolloff=3
set history=100000
set clipboard+=unnamed

" clear the highlighted search result
nnoremap <Space> :nohlsearch<CR>

" Quit insert mode
inoremap jk <Esc>

" Comment
nnoremap \\ :action CommentByLineComment<CR>

" Reformat
nnoremap ,af :action ReformatCode<CR>
