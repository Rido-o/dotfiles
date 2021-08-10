-- Basics
vim.o.syntax = 'true'               -- Enables syntax highlighting
--filetype plugin on                  -- Enables filetypes to be used
vim.o.compatible = false            -- Required for some other settings
vim.o.encoding = 'utf-8'            -- The encoding displayed
vim.o.fileencoding = 'utf-8'
vim.o.fileencodings = 'utf-8'       -- Causes problems with fugitive
vim.o.splitbelow = true             -- Split down instead of up
vim.o.splitright = true             -- Split right instead of left
vim.o.clipboard = 'unnamedplus'     -- Copy and paste between everything
vim.o.number = true
vim.o.relativenumber    = true         -- Enables the relative numberline
vim.o.cursorline = true             -- Change the cursor in insert mode
vim.o.linespace = 0                 -- Set the space between lines
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4               -- Set the width of tabs and space tabs
vim.o.shiftwidth = 4                -- Change the number of space character for indentation
vim.o.smartindent = true            -- Makes indenting smart
vim.o.wrap = false                  -- Display long lines as just one line
vim.o.swapfile = false              -- Disable swap files
vim.o.backup = false                -- Disable backup files
vim.o.undofile = true               -- Allow undo files
vim.o.incsearch = true              -- Allow included search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.colorcolumn = '0'             -- Set how far the color column should be
vim.o.scrolloff = 5                 -- How close the cursor should be before the page scrolls
vim.o.timeoutlen = 500              -- Default is 1000, used for which key
vim.o.updatetime = 100              -- For vim signify
vim.o.hidden = true                 -- Enables hidden buffers
vim.o.autoread = true               -- Enables auto reading of files for open buffers
vim.o.signcolumn = 'yes:1'          -- Add permanant column for signs
vim.o.undodir = vim.fn.stdpath 'cache' .. '/undo'-- Undo directory

-- List settings
vim.o.list = true
vim.o.listchars = 'trail:-,tab:  '
--vim.o.listchars = ''
--vim.o.listchars = vim.o.listchars .. 'trail:­,'
--vim.o.listchars = vim.o.listchars .. 'tab:  '
--vim.o.listchars = vim.o.listchars .. 'extends:»'
--vim.o.listchars = vim.o.listchars .. 'precedes:«'
--vim.o.listchars = vim.o.listchars .. 'nbsp:⣿'
--vim.o.listchars = vim.o.listchars .. 'eol:¬'

-- Disable auto-commenting
vim.cmd('autocmd BufWinEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')

-- Set shell to Windows PowerShell if on windows. Relies on function in init.vim
--if g:os == 'Windows' then
    --set shell=powershell shellquote= shellpipe=\| shellxquote=
    --set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
    --set shellredir=\|\ Out-File\ -Encoding\ UTF8
--end

--autocmd User Fugitive command! -buffer -bar Gmylog exe 'terminal' FugitivePrepare(['log', '--oneline', '--decorate', '--graph', '--all'])
--let color.ui=always
