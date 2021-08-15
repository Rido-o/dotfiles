require('lspinstall').setup{}
local lspinstall = require('lspinstall')

local servers = {
    'python',
    'lua' -- Needs unzip to be installed
}

local installed_servers = {}
for _, server in pairs (lspinstall.installed_servers()) do
    installed_servers[server] = true
end

for _, server in pairs(servers) do
    if not installed_servers[server] then
        print("Installing LSP Server for " .. server)
        lspinstall.install_server(server)
    end
end
