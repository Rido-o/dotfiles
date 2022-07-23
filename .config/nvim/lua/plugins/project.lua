local status_ok = pcall(require, 'project_nvim')
if not status_ok then
    return
end

require('project_nvim').setup({
    -- Methods of detecting the root directory.
    detection_methods = { 'pattern', 'lsp' },
    -- All the patterns used to detect root dir, when **"pattern"** is in detection_methods
    patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', '>.config' },
    -- Table of lsp clients to ignore by name eg: { "efm", ... }
    ignore_lsp = {},
    -- Don't calculate root dir on specific directories Ex: { "~/.cargo/*", ... }
    exclude_dirs = {},
    -- Show hidden files in telescope
    show_hidden = false,
    -- When set to false, you will get a message when project.nvim changes your directory.
    silent_chdir = true,
    -- Path where project.nvim will store the project history for use in telescope
    datapath = vim.fn.stdpath('data'),
})

require('telescope').load_extension('projects')

vim.keymap.set('n', '<leader>fp', '<CMD>Telescope projects<CR>', { desc = 'Find recent project'})
