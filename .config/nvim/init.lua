-- Get OS
vim.cmd([[
if !exists('g:os')
    if has('win64') || has('win32') || has('win16')
        let g:os = 'Windows'
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif
]])

-- Source files
if vim.g.os == 'Windows' then
    osPath = '~/AppData/Local/nvim/config'
elseif vim.g.os == 'Linux' then
    osPath = '$HOME/.config/nvim/config'
end

function SourceFile(file)
    vim.cmd("source " .. osPath .. file)
end

-- Main files
require('plugin-loader')
require('colorschemes')
require('settings')
require('plugins')
require('keymaps')
