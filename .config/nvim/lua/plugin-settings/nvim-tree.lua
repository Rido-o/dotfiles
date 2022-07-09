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

-- cd if directory else open file
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

require('nvim-tree').setup({
    view = {
        mappings = {
            list = {
                -- Key mappings
                { key = { 'l', 'o', 'e', '<2-LeftMouse>' }, action = 'edit', action_cb = edit_light },
                { key = '<CR>', action = 'cd', action_cb = open_cwd },
                { key = 'h', action = 'close_node' },
                { key = { 'H', '<BS>' }, action = 'dir_up' },
                { key = 'v', action = 'vsplit' },
                { key = 's', action = 'split' },
                { key = 'n', action = 'create' },
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
