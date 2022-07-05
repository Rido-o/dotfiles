-- Get OS
local raw_os = vim.loop.os_uname().sysname
if string.find(raw_os, 'Windows') then
    vim.g.os = 'Windows'
else
    vim.g.os = 'Linux'
end

-- Main files
require('settings')
require('colorschemes')
require('plugins')
require('keymaps')
