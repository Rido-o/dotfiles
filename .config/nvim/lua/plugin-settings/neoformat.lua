-- Autoformat on buffer write
vim.cmd([[
augroup fmt
    autocmd!
    autocmd BufWritePre * Neoformat
augroup END
]])
