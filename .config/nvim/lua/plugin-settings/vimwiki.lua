-----------------
-- Settings
-----------------
-- Set vimwiki location
if vim.g.os == "Windows" then
    vim.g.vimwiki_list = {
        {['path'] = '~/Documents/Wiki/'}
    }
elseif vim.g.os == "Linux" then
    vim.g.vimwiki_list = {
        {['path'] = '$HOME/.cfg/wiki/'}
    }
end
-- Set vimwiki prefix
vim.g.vimwiki_map_prefix = '<space>W'
