fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author "Pb"

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'modules/**/client.lua'
}

shared_script {
    'init.lua',
    '@ox_lib/init.lua',
    'modules/**/shared.lua',
}

server_script {
    'modules/**/server.lua',
    'util_callback.lua'
}