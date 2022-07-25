vim.keymap.set('n', '<localleader>r', '<CMD>1TermExec cmd=\'python "%"\' go_back=0<CR>', { desc = 'Run code', buffer = 0 })
vim.keymap.set('n', '<localleader>b', '<CMD>1TermExec cmd=\'hyperfine --warmup 10 "python %"\' go_back=0<CR>', { desc = 'Benchmark code', buffer = 0 })
vim.keymap.set('n', '<localleader>i', '<CMD>2TermExec cmd="python" go_back=0<CR>', { desc = 'Open repl', buffer = 0 })
