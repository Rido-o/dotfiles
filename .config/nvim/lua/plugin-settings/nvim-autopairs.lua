require('nvim-autopairs').setup{
    disable_filetype = { "TelescopePrompt" },
    disable_in_macro = false, -- disable when recording or executing a macro
    disable_in_visualblock = false, -- disable when insert after visual block mode
    ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]],"%s+", ""),
    enable_moveright = true,
    enable_afterquote = true, -- add bracket pairs after quote
    enable_check_bracket_line = true, -- check bracket in same line
    check_ts = false,
    map_bs = true, -- map the <BS> key
    map_c_w = false, -- map <c-w> to delete a pair if possible
}

-- nvim-cmp integration

-- If you want to insert `(` after select function or method item
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- local cmp = require('cmp')
-- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

-- Treesitter Checking
-- local Rule = require('nvim-autopairs.rule')
-- local npairs = require("nvim-autopairs")

-- npairs.setup({
--     check_ts = true,
--     ts_config = {
--         lua = {'string'},-- it will not add pair on that treesitter node
--         javascript = {'template_string'},
--         java = false,-- don't check treesitter on java
--     }
-- })

-- require('nvim-treesitter.configs').setup {
--     autopairs = {enable = true}
-- }

-- local ts_conds = require('nvim-autopairs.ts-conds')

-- -- press % => %% is only inside comment or string
-- npairs.add_rules({
--     Rule("%", "%", "lua")
--         :with_pair(ts_conds.is_ts_node({'string','comment'})),
--     Rule("$", "$", "lua")
--         :with_pair(ts_conds.is_not_ts_node({'function'}))
-- })
