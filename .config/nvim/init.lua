-- Get OS
vim.cmd([[
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif
]])

-- Source Files
if vim.g.os == "Windows" then
    osPath = "~/AppData/Local/nvim/config"
elseif vim.g.os == "Linux" then
    osPath = "$HOME/.config/nvim/config"
end

function SourceFile(file)
    vim.cmd("source " .. osPath .. file)
end

--SourceFile('/plugged.vim')					-- Has file setting
--SourceFile('/settings.vim')				    -- Has ignorable file setting

--SourceFile('/colorschemes.vim')
--SourceFile('/plugin-settings.vim')
--SourceFile('/remaps-basics.vim')
--SourceFile('/which-key.vim')
--SourceFile('/which-key-local-leader.vim')
--SourceFile('/start-page.vim')                 -- Has file setting

-- Main files
require('plugin-loader')
require('plugins')
require('settings')
require('colorschemes')
require('keymaps')
