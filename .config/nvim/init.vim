" Get OS
if !exists("g:os")
	if has("win64") || has("win32") || has("win16")
		let g:os = "Windows"
	else
		let g:os = substitute(system('uname'), '\n', '', '')
	endif
endif

" Sources
if g:os == "Windows"
	" Basic
	source ~/AppData/Local/nvim/config/plugged.vim                             "Has file setting
	source ~/AppData/Local/nvim/config/settings.vim                            "Has ignorable file setting

	" Plugin settings
	source ~/AppData/Local/nvim/config/colorschemes.vim
	source ~/AppData/Local/nvim/config/plugin-settings.vim
	source ~/AppData/Local/nvim/config/remaps-basics.vim
	source ~/AppData/Local/nvim/config/which-key.vim
	source ~/AppData/Local/nvim/config/which-key-local-leader.vim
	source ~/AppData/Local/nvim/config/start-page.vim                          "Has file setting
endif

" Linux Sources
if g:os == "Linux"
	" Basic
	source $HOME/.config/nvim/config/plugged.vim							   "Has file setting
	source $HOME/.config/nvim/config/settings.vim							   "Has ignorable file setting

	" Plugin settings
	source $HOME/.config/nvim/config/colorschemes.vim
	source $HOME/.config/nvim/config/plugin-settings.vim
	source $HOME/.config/nvim/config/remaps-basics.vim
	source $HOME/.config/nvim/config/which-key.vim
	source $HOME/.config/nvim/config/which-key-local-leader.vim
	source $HOME/.config/nvim/config/start-page.vim							   "Has file setting
endif
