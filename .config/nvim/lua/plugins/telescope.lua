require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ['<Tab>'] = require('telescope.actions').move_selection_previous,
                ['<S-Tab>'] = require('telescope.actions').move_selection_next,
            }
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
        },
    },
})

pcall(require('telescope').load_extension, 'fzf')
