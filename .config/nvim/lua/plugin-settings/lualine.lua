require('lualine').setup {

    options = {
        theme = 'tokyonight',
        section_separators = {'', ''},
        component_separators = {'|', '|'},
    },

    extensions = {
        --'chadtree',
        'fugitive',
        'fzf',
        'nerdtree',
        --'nvim-tree',
        --'quickfix',
    },
}
