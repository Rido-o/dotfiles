vim.keymap.set('r', '<CMD>1TermExec cmd=\'python "%"\' go_back=0<CR>', { desc = 'Run code' })
vim.keymap.set('b', '<CMD>1TermExec cmd=\'hyperfine --warmup 10 "python %"\' go_back=0<CR>', { desc = 'Benchmark code' })
vim.keymap.set('i', '<CMD>2TermExec cmd="python" go_back=0<CR>', { desc = 'Open repl' })
