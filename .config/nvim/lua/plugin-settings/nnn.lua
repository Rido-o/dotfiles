-----------------
-- Settings
-----------------
require('nnn').setup({
    command = "nnn -D",
    set_default_mappings = 0,
    layout = {
        ['window'] = {
            ['width'] = 0.9,
            ['height'] = 0.6
        }
    },
    action = {
        ['s'] = 'split',
        ['v'] = 'vsplit',
        ['l'] = 'e',
        ['e'] = 'e'
    }
})
