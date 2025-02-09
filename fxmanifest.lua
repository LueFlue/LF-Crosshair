fx_version 'cerulean'
lua54 'yes'
game 'gta5'

author 'LF Scripts - https://discord.gg/f595VxygMt'
description 'Et ekstremt configurable crosshair menu'
version '1.0.0'


client_scripts {
    'client/*.lua'
}

shared_script { 
    'config.lua',
    '@ox_lib/init.lua'
}

files {
    "html/*.html",
    "html/js/*.js",
    "html/style/*.css",
}

ui_page "html/index.html"

dependency {
    'ox_lib'
}
