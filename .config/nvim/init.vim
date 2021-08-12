" Get OS
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

" Source Files
if g:os == "Windows"
    let s:osPath = "~/AppData/Local/nvim/config"
elseif g:os == "Linux"
    let s:osPath = "$HOME/.config/nvim/config"
endif

function SourceFile(file)
    exec "source " . s:osPath . a:file
endfunction

"call SourceFile("/plugged.vim")					"Has file setting
"call SourceFile("/settings.vim")				"Has ignorable file setting

"call SourceFile("/colorschemes.vim")
"call SourceFile("/plugin-settings.vim")
"call SourceFile("/remaps-basics.vim")
"call SourceFile("/which-key.vim")
"call SourceFile("/which-key-local-leader.vim")
call SourceFile("/start-page.vim")				"Has file setting

" Main files
lua require('plugin-loader')
lua require('plugins')
lua require('settings')
lua require('colorschemes')
lua require('keymaps')

" Plugins
lua require('plugin-settings.nvim-autopairs')
lua require('plugin-settings.nvim-compe')
lua require('plugin-settings.nvim-lspconfig')
lua require('plugin-settings.lualine')
lua require('plugin-settings.which-key')
lua require('plugin-settings.indent-blankline')
lua require('plugin-settings.treesitter')
lua require('plugin-settings.nvim-tree')
lua require('plugin-settings.telescope')
lua require('plugin-settings.barbar')
lua require('plugin-settings.toggleterm')
lua require('plugin-settings.gitsigns')
