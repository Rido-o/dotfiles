local function map(mode, lhs, rhs, opts)
    opts = vim.tbl_extend('force', opts, { noremap = true, silent = true })
    vim.keymap.set(mode, lhs, rhs, opts)
end

--------------
-- Basic
--------------
-- Enter to clear highlighting
map('n', '<CR>', ':noh<CR>', { desc = 'Clear highlighting' })

-- Do action without yanking into "+ register
map({ 'n', 'v' }, 'c', '"_c', { desc = 'Change' })
map({ 'n', 'v' }, 'x', '"_x', { desc = 'Delete char' })

----------------
-- Replace
----------------
-- add number support and dot support for rr -- Figure out how to make it work with whichkey
function _G.Replace_operator(motion)
    if motion == nil then
        vim.o.operatorfunc = 'v:lua.Replace_operator'
        return 'g@'
    end
    local start = vim.api.nvim_buf_get_mark(0, '[')
    local finish = vim.api.nvim_buf_get_mark(0, ']')
    local replacement = vim.split(vim.fn.getreg('+'):gsub('%\n$', ''), '\n', false)
    if motion == 'char' then
        vim.api.nvim_buf_set_text(0, start[1] - 1, start[2], finish[1] - 1, finish[2] + 1, replacement)
    elseif motion == 'line' then
        vim.api.nvim_buf_set_lines(0, start[1] - 1, finish[1], true, replacement)
    elseif motion == 'block' then
        for i = start[1] - 1, finish[1] - 1 do
            vim.api.nvim_buf_set_text(0, i, start[2], i, finish[2] + 1, replacement)
        end
    elseif motion == 'r' then
        local row = vim.api.nvim_win_get_cursor(0)[1]
        vim.api.nvim_buf_set_lines(0, row - 1, row, true, replacement)
    end
end

map({ 'n', 'v' }, 'r', _G.Replace_operator, { desc = 'Replace', expr = true })
map('n', 'rr', '<ESC><CMD>lua _G.Replace_operator("r")<CR>', { desc = 'Replace line' })
