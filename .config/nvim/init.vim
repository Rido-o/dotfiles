" Get OS
if !exists("g:os")
	if has("win64") || has("win32") || has("win16")
		let g:os = "Windows"
	else
		let g:os = substitute(system('uname'), '\n', '', '')
	endif
endif

source config/plugged.vim					"Has file setting
source config/settings.vim					"Has ignorable file setting

source config/colorschemes.vim
source config/plugin-settings.vim
source config/remaps-basics.vim
source config/which-key.vim
source config/which-key-local-leader.vim
source config/start-page.vim				"Has file setting
