"           ~~~~~Vundle stuff~~~~~
set nocompatible "be iMproved, required
filetype off "required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"can add a path where Vundle should install plugins in ()
"call vundle#begin('~/vundle')

"~~~Between this and the next are Vundle install on GitHub defaults~~~
"the following are examples of different formats supported
"keep Plugin commands between vundle#begin/end
"plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"Git plugins not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
"git repos on local machine (i.e. when working on your own plugin)
"   Plugin 'file:///home/gmarik/path/to/plugin'
"the sparkup vim script is in a subdirectory of this repo called vim
"pass the path to set the runtimepath properly
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"install L9 and avoid Naming conflict if you've already installed a
"different version somewhere else
"Plugin 'ascenator/L9', {'name', 'newL9'}
"               ~~~~~End of GitHub defaults~~~~~

"####################Begin Copa Plugins#########################

"NerdTree which is a file explorer
Plugin 'preservim/nerdtree'

"gives Nerd Tree dev icons
Plugin 'ryanoasis/vim-devicons'

"shows git status in Nerd Tree
Plugin 'Xuyuanp/nerdtree-git-plugin'

"enables Nerd Tree to open, delete, move or copy multiple files in visual mode
Plugin 'PhilRunninger/nerdtree-visual-selection'

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Vim-Surround
"a quoting/paren/bracket/etc+more ez add script
"while inside 'hello world' cs"' will change it to \"hello world"
Plugin 'tpope/vim-surround'

"status bar
Plugin 'vim-airline/vim-airline'

"nonsense to make airline look good
Plugin 'vim-airline/vim-airline-themes'

"gruvbox hoes
Plugin 'morhetz/gruvbox'

"code commenter
Plugin 'preservim/nerdcommenter'

"fuzzy finder
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }

"tryin out python autocomplete here.
"Plugin 'davidhalter/jedi-vim'

"autoclose paren etc
Plugin 'townk/vim-autoclose'

"css and color display
Plugin 'ap/vim-css-color'

"get hexokinase for colors.
"need to install golang which i dont wanna rn

"auto sort python imports
Plugin 'fisadev/vim-isort'

"python linter
"Plugin 'pycqa/pylint'
Plugin 'pylint.vim'

"better linter, we'll try pylint later
Plugin 'neomake/neomake'

"colors?
Plugin 'chrisbra/Colorizer'

"deoplete and fzf need updated vim. do that soon.

"all of your plugins must be added before the following line
call vundle#end() "required
filetype plugin indent on "required
"to ignore plugin indent changes, instead us
"filetype plugin on
"
"brief help
":PluginList - lists configured plugins
":PluginInstall - installs plugins; append '!' to update or just
":PluginUpdate
":PluginSearch foo - searches for foo; append '!' to refresh local cache
":PluginClean - confirms removal of unused plugins; append '!' to
"auto-approve removal
"
"see :h vundle for more details or wiki for FAQ
"put your non-Plugin stuff after this line
"
"           ~~~~~Vundle Stuff End~~~~~

"################Plugin Settings####################
"
"#######Nerd Tree#######
"nerdtree mapping
map <F3> :NERDTreeToggle<CR>

"let NerdTreeChDirMode = 2
"let NerdTreeShowBookmarks = 1

"#######Airline#######
"displays buffers when only one tab is open
let g:airline#extensions#tabline#enabled = 1

"path formatter change. this is the best one by a long shot imo
let g:airline#extensions#tabline#formatter = 'unique_tail'

"set the airline theme
let g:airline_theme = 'wombat'

"####### isort #######

"isort default keybind
let g:vim_isort_map = '<C-i>'

"isort python version
let g:vim_isort_python_version = 'python3'

"neomake full config mode
call neomake#configure#automake('nrwi', 500)

"####### fzf #######

"turns on colors to match vim and enables history feature
"g:fzf_colors configure this some time
let g:fzf_history_dir = '~/.local/share/fzf-history'

"           ~~~~~~Vim Stuff Begin~~~~~

"attempt to determine the type of a file based on its name and possibly its
"contents. Use this to allow intelligent auto-indenting for each filetype,
"and for plugins that are filetype specific.
filetype indent plugin on

"enable syntax highlighting
syntax on

"Vim with default settings does not allow easy switching between 
"multiple files in the same editor window. Users can use multiple 
"split windows or multiple tab pages to edit multiple files, but 
"it is still best to enable an option to allow easier switching 
"between files. One such option is the 'hidden' option, which 
"allows you to re-use the same window and switch from an unsaved 
"buffer without saving it first. Also allows you to keep an undo 
"history for multiple files when re-using the same window in this 
"way. Note that using persistent undo also lets you undo in 
"multiple files even in the same window, but is less efficient 
"and is actually designed for keeping undo history after closing 
"Vim entirely. Vim will complain if you try to quit without 
"saving, and swap files will keep you safe if your computer 
"crashes.
set hidden

set wildmenu    " better command-line completion

set showcmd     " show partial commands at the bottom of Vim

"##### Search && Spell Check Settings #####
set ignorecase  " /the will return THE the The
set smartcase   " and this makes it so if search contains an
                " uppercase letter search will be case 
                " sensitive
set incsearch   " search as characters are entered
set hlsearch    " highlights search results

" use http://fpt.vim.org/vim/runtime/spell/ for finding
" codes to put in spell check
set spell spelllang=en_us,en_au,en_nz,en_gb
                            " spell check on and set to
                            " english. additional languages
                            " must follow the laid out way
                            " us = USA
                            " au = Australia
                            " nz = New Zealand
                            " gb = Britain

"when opening a new line and no filetype-specific indenting is
"enabled it will keep the same indent as the line you're
"currently on. useful for things like READMEs
set autoindent

"displays the cursor position on the last line of the screen or
"in the status line of a window
set ruler

"instead of failing a command because of unsaved changes, raise
"a dialogue asking if you wish to save changed files
set confirm

"visual bell instead of beeping when something is wrong
set visualbell

"command window height to 2 lines to avoid a lot of 'push
"enter to continue'
set cmdheight=2

"display line numbers on the left
set number

"indentation settings for using 4 spaces instead of tabs
"do not change 'tabstop' from its default value of 8 with
"this setup
set shiftwidth=4
set softtabstop=4
set expandtab
set softtabstop=4
set tabstop=8

"shows line endings
"set listchars=eol:⏎,
set list lcs=eol:⏎,trail:·,tab:»·,extends:⟩,precedes:⟨,nbsp:␣

"shows line break in opposite fashion of eol
set showbreak=↪\

"########## Split Functionality ##########

"sets it so splits open logically
"on the right for vertical
"on the bottom for horizontal
set splitbelow splitright

"sets it so ctrl + hjkl changes split focus, rather than ctrl + w + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Makes adjusting the size of splits a bit faster and more friendly
nnoremap <silent> <C-Left> :vertical resize +3<CR>
nnoremap <silent> <C-Right> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

"changes splits from vert to hor and vice versa
map <leader>th <C-w>t<C-w>H
map <leader>tk <C-w>t<C-w>K

" clears search values
"map <silent> <leader><space> :let@/=""<CR>

"            ~~~~~dotshare.it/dots/7/~~~~~

"highlight cursor line
"set cursorline

"ask to print errors instead of just printing
set confirm

"always show statusline
set statusline=2

"we'll find out
"set lines=40
"set columns=85

"#####FOLDING#####
set foldmethod=indent " folds based on indent level
set foldnestmax=10    " max 10 depth
set foldenable        " don't fold files by default on open
nnoremap <space> za   
"^^^ this will open and close folds
set foldlevelstart=10 " start with fold level 1

"	    ~~~~~Colourscheme info N Stuff~~~~~
"
"https://github.com/rafi/awesome-vim-colorschemes
"^^^^For a list of schemes with examples and codes^^^^
"Likes:
"alduin, 256noir, anderson, gotham, 
"colorscheme alduin

"almost black background
"let g:alduin_Shout_Dragon_Aspect = 1
"colorscheme alduin

"black background
"let g:alduin_Shout_Become_Ethereal = 1
"colorscheme alduin

"adds deep red colour for special highlighting groups
"let g:alduin_Shout_Fire_Breath = 1
"colorscheme alduin

"removes block matchparens setting and adds an underline
"let g:alduin_Shout_Aura_Whisper = 1
"colorscheme alduin

"Fuck Alduin. We like miromiro now.
"colorscheme miromiro

"Fuck miromiro. We like Dracula now.
"colorscheme dracula

"That lasted five seconds
colorscheme gruvbox
set bg=dark

let fancy_symbols_enabled = 1

" these set it so the 80th character is cyan
" as 79 is supposed to be the go to standard
highlight ColorColumn ctermbg=cyan
call matchadd('ColorColumn', '\%80v', 100)

"set colorcolumn=72

"######################## key remaps ######################

"turns off spacebar map
nnoremap <space> <Nop>

"changes leader key
let mapleader = " "
