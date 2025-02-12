fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Lunex Scripts'
description 'moneywash script - Lunex Scripts'

-- Dependencies
dependencies {
    'ox_core',
    'ox_lib'
}

-- Shared Script
shared_script {
    '@ox_lib/init.lua'
}

-- Server Scripts
server_script {
    'server/server.lua'
}

-- Client Scripts
client_script {
    'client/client.lua'
}
