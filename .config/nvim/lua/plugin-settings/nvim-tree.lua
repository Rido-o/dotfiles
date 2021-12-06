-----------------
-- Settings
-----------------

local config = {
	quit_on_open = 0,               -- 0 by default, closes the tree when you open a file
	indent_markers = 1,             -- 0 by default, this option shows indent markers when folders are open
	git_hl = 1,                     -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
    highlight_opened_files = 1,     -- 0 by default, will enable folder and file icon highlight for opened files/directories.
	root_folder_modifier = ':~',    -- This is the default. See :help filename-modifiers for more options
    add_trailing = 0,               -- 0 by default, append a trailing slash to folder names
	group_empty = 1,                -- 0 by default, compact folders that only contain a single folder into one node in the file tree
    disable_window_picker = 0,      -- 0 by default, will disable the window picker.
    icon_padding = ' ',             -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
    symlink_arrow = ' >> ',         -- defaults to ' ➛ '. used as a separator between symlinks' source and target.
    respect_buf_cwd = 0,            -- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
    create_in_closed_folder = 1,    -- 1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
    refresh_wait = 1000,            -- 1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.

    -- Dictionary of buffer option names mapped to a list of option values that
    -- indicates to the window picker that the buffer's window should not be
    -- selectable.
    tree_window_picker_exclude = {
        filetype = {'packer', 'qf'},
        buftype = {'terminal'},
    },

    -- List of filenames that gets highlighted with NvimTreeSpecialFile
    special_files = {
        ['README.md'] = 1,
        ['Makefile'] = 1,
        ['MAKEFILE'] = 1,
    },

    -- If 0, do not show the icons for one of 'git' 'folder' and 'files'
    -- 1 by default, notice that if 'files' is 1, it will only display
    -- if nvim-web-devicons is installed and on your runtimepath.
    -- if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
    -- but this will not work when you set indent_markers (because of UI conflict)
    show_icons = {
        git = 1,
        folders = 1,
        files = 1,
        folder_arrows = 0,
    },

    -- default will show icon by default if no icon is provided
    -- default shows no icon by default
    icons = {
        default = '',
        symlink = '',
        git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌"
        },
        folder = {
            arrow_open = "",
            arrow_closed = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
            symlink_open = "",
        },
	},
}

local set_options = function(cfg)
	for key, value in pairs(cfg) do
		vim.g['nvim_tree_' .. key] = value
	end
end

set_options(config)

--------------------
-- Keybindings
--------------------

-- NvimTreeOpen and NvimTreeClose are also available if you need them
--nnoremap <C-n> :NvimTreeToggle<CR>
--nnoremap <leader>r :NvimTreeRefresh<CR>
--nnoremap <leader>n :NvimTreeFindFile<CR>

--set termguicolors -- this variable must be enabled for colors to be applied properly

-- a list of groups can be found at `:help nvim_tree_highlight`
--highlight NvimTreeFolderIcon guibg=blue

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local treeMappings = {
    { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
    { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
    { key = "<C-v>",                        cb = tree_cb("vsplit") },
    { key = "<C-x>",                        cb = tree_cb("split") },
    { key = "<C-t>",                        cb = tree_cb("tabnew") },
    { key = "<",                            cb = tree_cb("prev_sibling") },
    { key = ">",                            cb = tree_cb("next_sibling") },
    { key = "P",                            cb = tree_cb("parent_node") },
    { key = "<BS>",                         cb = tree_cb("close_node") },
    { key = "<S-CR>",                       cb = tree_cb("close_node") },
    { key = "<Tab>",                        cb = tree_cb("preview") },
    { key = "K",                            cb = tree_cb("first_sibling") },
    { key = "J",                            cb = tree_cb("last_sibling") },
    { key = "I",                            cb = tree_cb("toggle_ignored") },
    { key = "H",                            cb = tree_cb("toggle_dotfiles") },
    { key = "R",                            cb = tree_cb("refresh") },
    { key = "a",                            cb = tree_cb("create") },
    { key = "d",                            cb = tree_cb("remove") },
    { key = "r",                            cb = tree_cb("rename") },
    { key = "<C-r>",                        cb = tree_cb("full_rename") },
    { key = "x",                            cb = tree_cb("cut") },
    { key = "c",                            cb = tree_cb("copy") },
    { key = "p",                            cb = tree_cb("paste") },
    { key = "y",                            cb = tree_cb("copy_name") },
    { key = "Y",                            cb = tree_cb("copy_path") },
    { key = "gy",                           cb = tree_cb("copy_absolute_path") },
    { key = "[c",                           cb = tree_cb("prev_git_item") },
    { key = "]c",                           cb = tree_cb("next_git_item") },
    { key = "-",                            cb = tree_cb("dir_up") },
    { key = "s",                            cb = tree_cb("system_open") },
    { key = "q",                            cb = tree_cb("close") },
    { key = "g?",                           cb = tree_cb("toggle_help") },
}

-- Highlights
vim.cmd('hi! def link NvimTreeNormal Normal')
vim.cmd('hi! def link NvimTreeVertSplit SignColumn')

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    ignore_ft_on_setup = {},
    auto_close = true,
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    update_to_buf_dir  = {
        enable = true,
        auto_open = false,
    },
    diagnostics = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        }
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {}
    },
    system_open = {
        cmd  = nil,
        args = {}
    },
    filters = {
        dotfiles = false,
        custom = {}
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = false,
        mappings = {
            custom_only = true,
            list = treeMappings
        },
        number = false,
        relativenumber = false
    },
    trash = {
        cmd = "trash",
        require_confirm = true
    }
}
