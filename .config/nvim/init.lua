-- Get OS
local raw_os = vim.loop.os_uname().sysname
if string.find(raw_os, 'Windows') then
    vim.g.os = 'Windows'
elseif raw_os == 'Linux' then
    vim.g.os = 'Linux'
end

-- Main files
require('user.core.settings')
require('user.core.colorschemes')
require('user.core.plugins')
require('user.core.keymaps')
