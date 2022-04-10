# XNLRankBar
XP Ranking System for FiveM (QBCore)


* Designed to emulate the native GTA:O system
* Saves and loads players XP / rank
* Add / remove XP from your own script / job
* Allows you listen for rank changes to reward players
* Fully customisable UI
* Framework agnostic


##### Increasing XP

![Demo Image 1](https://i.imgur.com/CpACt9s.gif)

##### Rank Up

![Demo Image 2](https://i.imgur.com/uNPRGo5.gif)

# STILL UNDER DEVELOPMENT

## Table of Contents
- [Install](#install)
- [Usage](#usage)
  * [Client](#client)
  * [Server](#server)
- [Rank Events](#rank-events)
- [Rank Actions](#rank-actions)

## Requirements
* `oxmysql` or `mysql-async`
 
## Install
* Import `XNLRankBar.sql`
* Drop the `XNLRankBar` directory into you `resources` directory
* Add `ensure XNLRankBar` to your `server.cfg` file

By default this resource uses `oxmysql`, but if you don't want to use / install it then you can use `mysql-async` by following these instructions:

## Usage

### Client
Initiate Initial Levels (not needed except of special uses cases)
```lua
exports.Exp_XNL_SetInitialXPLevels(source)
```

Give XP to player
```lua
exports.Exp_XNL_AddPlayerXP(source, 100)
```

Take XP from player
```lua
exports.Exp_XNL_RemovePlayerXP(source, 100)
```

Get player's XP
```lua
exports.Exp_XNL_GetCurrentPlayerLevel()
```

Get player's rank
```lua
exports.Exp_XNL_GetLevelFromXP()
```

Get XP required to rank up
```lua
exports.Exp_XNL_GetXPFloorForLevel()
```

Get XP required to reach defined rank
```lua
exports.Exp_XNL_GetXPCeilingForLevel()
```

### Server
```lua
TriggerClientEvent('XNL_NET:XNL_SetInitialXPLevels', source) -- not needed instead of special uses cases

TriggerClientEvent('XNL_NET:AddPlayerXP', source, 100) -- give 100 xp

TriggerClientEvent('XNL_NET:RemovePlayerXP', source, 100) -- remove 100 xp
```

## Rank Events

Listen for rank up event (client.lua)
```lua
function XNL_OnPlayerLevelUp()
	-- This function is called when the played has leveled up while getting the XP
	-- On my server I use this 'XNL Event' to make an 'extra save' to the database
	-- with the (new) player stats, we DO NOT do that on every change to prevent to
	-- much unneeded server traffic.
	
	-- You can for example also use this function to play a sound effect or show a pop up
	-- when a player has leveled up (for example to show which new jobs became availible)
	
	-- NOTE: These are just SUGGESTIONS/IDEA'S for YOU to implement, I have NOT included
	-- these 'features' in this script
end
```

Listen for rank down event (client.lua)
```lua
function XNL_OnPlayerLevelsLost()
	-- This function is called when the played has LOST a level or levels while losing XP
	-- for example by an 'admin punishment'!
	
	-- On my server I use this 'XNL Event' to make an 'extra save' to the database
	-- with the (new) player stats, we DO NOT do that on every change to prevent to
	-- much unneeded server traffic.
	
	-- You can for example also use this function to check if a player has a weapon in his/here
	-- inventory which should be removed due to losing the level required for it, or for example
	-- check if the player needs to be 'kicked' from a vehicle which requires his previously 
	-- higher level to use/drive it
	
	-- NOTE: These are just SUGGESTIONS/IDEA'S for YOU to implement, I have NOT included
	-- these 'features' in this script
end
```
