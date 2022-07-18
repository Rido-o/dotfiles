-----------------
-- Settings
-----------------

local lib = require('nvim-tree.lib')

-- Same as normal editing but does nothing on root directory
local function edit_light()
    local action = 'edit'
    local node = lib.get_node_at_cursor()

    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)
    elseif node.name ~= '..' then
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
    end
end

-- cd if directory else open file
local function open_cwd()
    local action = 'edit'
    local node = lib.get_node_at_cursor()

    if node.link_to and not node.nodes then
        require('nvim-tree.actions.node.open-file').fn(action, node.link_to)
    elseif node.nodes ~= nil then
        require('nvim-tree.actions.root.change-dir').fn(node.absolute_path)
        print(node.absolute_path)
    elseif node.name ~= '..' then
        require('nvim-tree.actions.node.open-file').fn(action, node.absolute_path)
    end
end

require('nvim-tree').setup({
    hijack_cursor = true,
    create_in_closed_folder = true,
    view = {
        mappings = {
            custom_only = false,
            list = {
                -- Key mappings
                { key = { 'l', 'e' }, action = 'edit', action_cb = edit_light },
                { key = '<CR>', action = 'cd', action_cb = open_cwd },
                { key = 'h', action = 'close_node' },
                { key = { 'H', '<BS>' }, action = 'dir_up' },
                { key = 'L', action = 'expand_all' },
                { key = 'v', action = 'vsplit' },
                { key = 's', action = 'split' },
                { key = 'n', action = 'create' },
                { key = '/', action = 'live_filter' },
                { key = '.', action = 'toggle_dotfiles' },
                { key = ';', action = 'run_file_command' },
                { key = '<C-y>', action = 'copy_absolute_path' },
                { key = '?', action = 'toggle_help' },
            },
        },
    },
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = '└',
                edge = '│',
                item = '│',
                none = ' ',
            },
        },
        icons = {
            show = {
                folder_arrow = false,
            },
            glyphs = {
                folder = {
                    arrow_closed = '‣',
                    arrow_open = '⏷',
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            error = '',
            warning = '⚠',
            info = '',
            hint = '',
        },
    },
    live_filter = {
        prefix = '[SEARCH]: ',
        always_show_folders = false,
    },
})

-------------------
-- Highlights
-------------------
-- a list of groups can be found at `:help nvim-tree-highlight`
-- Main window bg and text color
vim.api.nvim_set_hl(0, 'NvimTreeNormal', {link = 'StatusLine'})
-- Main window bg when nvim-tree is not the focused window
vim.api.nvim_set_hl(0, 'NvimTreeNormalNC', {link = 'StatusLine'})
-- Window Picker color
vim.api.nvim_set_hl(0, 'NvimTreeWindowPicker', {link = 'StatusLine'})
-- Seperator color
vim.api.nvim_set_hl(0, 'NvimTreeWinSeparator', {link = 'WinSeparator'})
