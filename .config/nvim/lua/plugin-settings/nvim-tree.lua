-----------------
-- Settings
-----------------

local lib = require('nvim-tree.lib')

-- Same as normal editing but does nothing on root directory
local function edit_light()
    local action = 'edit'
    local node = lib.get_node_at_cursor()

    if node.link_to and not node.nodes then
        require('nvim-tree.actions.open-file').fn(action, node.link_to)
    elseif node.nodes ~= nil then
        lib.expand_or_collapse(node)
    elseif node.name ~= '..' then
        require('nvim-tree.actions.open-file').fn(action, node.absolute_path)
    end
end


local function open_cwd()
    local action = 'edit'
    local node = lib.get_node_at_cursor()

    if node.link_to and not node.nodes then
        require('nvim-tree.actions.open-file').fn(action, node.link_to)
    elseif node.nodes ~= nil then
        require('nvim-tree.actions.change-dir').fn(node.absolute_path)
        print(node.absolute_path)
    elseif node.name ~= '..' then
        require('nvim-tree.actions.open-file').fn(action, node.absolute_path)
    end
end

local function backwards()
    local node = lib.get_node_at_cursor()

    -- Bug 1# - using h on a closed directory in an open directory will go dir_up
    if node.nodes ~= nil and node.open == true then
        require('nvim-tree.actions.movements').parent_node(true)(node)
    elseif node.nodes ~= nil and node.open == false then
        require('nvim-tree.actions.change-dir').fn('..')
    elseif node.name == '..' then
        require('nvim-tree.actions.change-dir').fn('..')
    else
        require('nvim-tree.actions.movements').parent_node(true)(node)
        print(node.absolute_path)
        print(node.cwd)
        print(node.group_next)
        print(node.name)
        print(node.link_to)
        print(node.parent)
        print(node.fs_stat)
        print(node_path)
    end
end

require('nvim-tree').setup({
    view = {
        mappings = {
            list = {
                -- Key mappings
                -- Don't won't l to go up a node if used on root folder
                { key = { 'l', 'o', 'e', '<2-LeftMouse>' }, action = 'edit', action_cb = edit_light },
                -- Want h to go up a node if not closing a folder
                { key = 'h', action = 'close_node', action_cb = backwards },
                { key = '<BS>', action = 'dir_up' },
                { key = 'v', action = 'vsplit' },
                { key = 's', action = 'split' },
                { key = 'n', action = 'create' },
                -- Want <CR> to open a file if not used on a directory
                { key = '<CR>', action = 'cd', action_cb = open_cwd },
            },
        },
    },
    renderer = {
        indent_markers = {
            enable = true,
            icons = {
                corner = '└ ',
                edge = '│ ',
                item = '│ ',
                none = '  ',
            },
        },
    },
})

-------------------
-- Highlights
-------------------
-- a list of groups can be found at `:help nvim-tree-highlight`
-- Main window bg and text color
vim.cmd('hi! def link NvimTreeNormal Normal')
-- Window Picker color
vim.cmd('hi! def link NvimTreeWindowPicker StatusLine')
-- Seperator color
vim.cmd('hi! def link NvimTreeWinSeparator SignColumn')
