fx_version 'cerulean'
game 'gta5'

description 'XNLRANKBAR'
version '1.0.0'

client_scripts {
    'client/main.lua'
}

server_scripts {
	'server/main.lua',
}

-- ui_page 'html/index.html'

-- files {
-- 	'html/index.html',
-- 	'html/style.css',
-- 	'html/*.js'
-- }

-- dependencies {
-- 	'oxmysql',
-- 	'progressbar',
-- 	'connectqueue'
-- }

export 'Exp_XNL_SetInitialXPLevels'
export 'Exp_XNL_AddPlayerXP'
export 'Exp_XNL_RemovePlayerXP'
export 'Exp_XNL_GetCurrentPlayerXP'
export 'Exp_XNL_GetLevelFromXP'
export 'Exp_XNL_GetCurrentPlayer'
export 'Exp_XNL_GetCurrentPlayerLevel'
export 'Exp_XNL_GetXPCeilingForLevel'
export 'Exp_XNL_GetXPFloorForLevel'