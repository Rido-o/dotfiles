local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    return
end

null_ls.setup({
    sources = {
        require('null-ls').builtins.formatting.stylua,
        require('null-ls').builtins.formatting.black,
        require('null-ls').builtins.formatting.nixpkgs_fmt,
        require('null-ls').builtins.code_actions.statix,
        require('null-ls').builtins.diagnostics.statix,
    },
})
