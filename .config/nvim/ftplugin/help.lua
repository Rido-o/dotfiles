-- Make help files open in a vertical split by default
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, { buffer = 0, command = 'wincmd L' })
