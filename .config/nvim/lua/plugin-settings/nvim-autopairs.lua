require('nvim-autopairs').setup{}

-- nvim-cmp integration
-- If you want to insert `(` after select function or method item
-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- local cmp = require('cmp')
-- cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

-- require("nvim-autopairs.completion.compe").setup{
--     map_cr = true, -- map <CR> on insert mode
--     map_complete = true, -- it will auto insert `(` after select function or method item
--     auto_select = false, -- auto select first item
-- }

---- Treesitter Checking
--local npairs = require("nvim-autopairs")

--npairs.setup({
    --check_ts = true,
    --ts_config = {
        --lua = {'string'},-- it will not add pair on that treesitter node
        --javascript = {'template_string'},
        --java = false,-- don't check treesitter on java
    --}
--})

--require('nvim-treesitter.configs').setup {
    --autopairs = {enable = true}
--}

--local ts_conds = require('nvim-autopairs.ts-conds')

---- press % => %% is only inside comment or string
--npairs.add_rules({
    --Rule("%", "%", "lua")
        --:with_pair(ts_conds.is_ts_node({'string','comment'})),
    --Rule("$", "$", "lua")
        --:with_pair(ts_conds.is_not_ts_node({'function'}))
--})
