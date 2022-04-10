QBCore = exports['qb-core']:GetCoreObject()

function tablePrintOut(table)
    if type(table) == 'table' then
       local s = '\n{ '
       for k,v in pairs(table) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. tablePrintOut(v) .. ',\n'
       end
       return s .. '}'
    else
       return tostring(table)
    end
 end

-- example how to trigger it

-- print(tablePrintOut(src))

local xplist = {}

-- xplist = {
--     ["crafting"] = 0,
--     ["driving"] = 0,
--     ["hacking"] = 0,
-- }

QBCore.Functions.CreateCallback("xnlrankbar:server:getxpcb", function(source, cb)
    local citizenid = QBCore.Functions.GetPlayer(source).PlayerData.citizenid
    local result = exports.oxmysql:executeSync('SELECT * FROM experience WHERE cid = ?', { citizenid })
    if result[1] then
        cb(result[1])
        -- print(tablePrintOut(result[1]))
    else
        --cb(nil)
        exports.oxmysql:insert('INSERT INTO experience (cid, driving, crafting )VALUES(?,?,?)', {citizenid,0,0})
    end
end) 
    

-- RegisterServerEvent('xnlrankbar:server:getxp')
-- AddEventHandler('xnlrankbar:server:getxp', function(player)
--     local result = exports.oxmysql:executeSync('SELECT cid FROM experience WHERE cid = ?', { player.citizenid })
--     if result[1] == nil then
--         print("new player setting everything to 0")
--         exports.oxmysql:insert('INSERT INTO experience (cid, driving, crafting )VALUES(?,?,?)', {player.citizenid,0,0})
--     end
-- end)

-- RegisterServerEvent('xnlrankbar:server:craftingxp')
-- AddEventHandler('xnlrankbar:server:craftingxp', function(XPAmount,player)
--     exports.oxmysql:update('UPDATE experience SET driving = ? WHERE cid = ?', {XPAmount,player})
-- end)

RegisterNetEvent('xnlrankbar:server:setxp', function(XPAmount,citizenid)
    -- print(XPAmount)
    -- print(citizenid)
    -- exports.oxmysql:insert('INSERT INTO xnlrankbar (cid, xnlrankbar )VALUES(?,?)', {player.citizenid,XPAmount})
    exports.oxmysql:execute('UPDATE experience SET driving = ? WHERE cid = ?', {XPAmount, citizenid})
end)