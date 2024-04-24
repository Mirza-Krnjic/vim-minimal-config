" INSTALLATION INSTRUCTIONS
" -------------------------
" 1. Install Vim:
"    - Linux: Install Vim using your package manager, e.g., sudo apt install vim (for Ubuntu)
"    - macOS: Install Vim using Homebrew with the command, brew install vim
" 2. Install vim-plug:
"    - Run the following command in your terminal:
"      curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 3. Add this vimrc file to your home directory as .vimrc
" 4. Open vim and run :PlugInstall to install the plugins listed below

" Begin vim-plug plugin manager block
call plug#begin()
" NERDTree plugin for file system explorer
Plug 'preservim/nerdtree'
" vim-airline for status/tabline
Plug 'vim-airline/vim-airline'
" Tokyo Night color scheme
Plug 'ghifarit53/tokyonight-vim'
call plug#end()

" Set Tokyo Night color scheme settings
let g:tokyonight_style = 'night' " Set style of Tokyo Night theme
let g:tokyonight_transparent_background=1 " Enable transparent background
colorscheme tokyonight " Apply the Tokyo Night color scheme

" Set system clipboard to be used by Vim
set clipboard=unnamedplus

" Enable 24-bit RGB color in the terminal
set termguicolors
" Enable line numbers
set number
" Enable mouse support in all modes
set mouse=a
" Enable syntax highlighting
syntax enable

" Set the <Space> key as the leader key
let mapleader = " "

" Navigation mappings
nnoremap J 5j " Map 'J' to move down 5 lines
nnoremap K 5k " Map 'K' to move up 5 lines
nnoremap ; 0 " Map ';' to move to the beginning of the line
nnoremap <leader>f :Rg<CR> " Map '<leader>f' to run :Rg command
nnoremap <leader>q :q!<CR> " Map '<leader>q' to quit without saving
nnoremap <leader>p :Files<CR> " Map '<leader>p' to open file search
nnoremap <leader>w :w<CR> " Map '<leader>w' to save the current file
nnoremap <leader>c :bdelete<CR> " Map '<leader>c' to close the current buffer
nnoremap <Leader>t :terminal zsh<CR> " Map '<leader>t' to open zsh terminal

" Cursor appearance settings
let &t_SI = "\<Esc>[6 q" " Set cursor to a thin vertical bar in insert mode
let &t_EI = "\<Esc>[2 q" " Set cursor to a block in normal mode

" Map <Esc><BS> in insert mode to delete the entire word
imap <Esc><BS> <C-w>

" NERDTree toggle setup
let g:NERDTreeToggleFind = 0
function! ToggleNERDTreeFind()
  if g:NERDTreeToggleFind == 0
    NERDTreeFind
    let g:NERDTreeToggleFind = 1
  else
    NERDTreeClose
    let g:NERDTreeToggleFind = 0
  endif
endfunction
nnoremap <leader>e :call ToggleNERDTreeFind()<CR>

" Additional NERDTree configuration
let g:NERDTreeHijackNetrw = 0
let NERDTreeChDirMode = 2
let NERDTreeWinPos = "tab"
let g:airline#extensions#tabline#enabled = 1
nnoremap <silent> L :bn<CR> " Map 'L' to switch to the next buffer
nnoremap <silent> H :bp<CR> " Map 'H' to switch to the previous buffer
autocmd FileType nerdtree map <buffer> l o " In NERDTree, map 'l' to open a directory or file
autocmd FileType nerdtree map <buffer> h x " In NERDTree, map 'h' to close a directory
