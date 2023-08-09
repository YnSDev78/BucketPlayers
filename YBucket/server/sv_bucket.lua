function PrintPlayersInBucket(bucket, source)
    local playerCount = 0

    for index, playerId in ipairs(GetPlayers()) do
        local playerBucket = GetPlayerRoutingBucket(playerId)
        if playerBucket == bucket then
            playerCount = playerCount + 1
            local playerName = GetPlayerName(playerId)
        end
    end
    return playerCount
end

RegisterNetEvent('UPServGames:printbucket2players')
AddEventHandler('UPServGames:printbucket2players', function()
    local playerCountInBucket2 = PrintPlayersInBucket(2)
    TriggerClientEvent('UPServGames:updateBucketCount2', source, playerCountInBucket2)
end)

RegisterNetEvent('UPServGames:printbucket0players')
AddEventHandler('UPServGames:printbucket0players', function()
    local playerCountInBucket0 = PrintPlayersInBucket(0)
    TriggerClientEvent('UPServGames:updateBucketCount0', source, playerCountInBucket0)
end)

RegisterNetEvent('UPServGames:printbucket3players')
AddEventHandler('UPServGames:printbucket3players', function()
    local playerCountInBucket3 = PrintPlayersInBucket(3)
    TriggerClientEvent('UPServGames:updateBucketCount3', source, playerCountInBucket3)
end)

RegisterServerEvent('UPServGames:putinroutine')
AddEventHandler('UPServGames:putinroutine', function(routineBucket)
    local playerId = source
    local currentBucket = GetPlayerRoutingBucket(playerId)

    if currentBucket ~= routineBucket then
        if routineBucket == 0 then
            SetPlayerRoutingBucket(playerId, 0)
            SetRoutingBucketPopulationEnabled(0, false)
            print('Player ' .. playerId .. ' set to routine bucket 0')
        elseif routineBucket == 2 then
            SetPlayerRoutingBucket(playerId, routineBucket)
            SetRoutingBucketPopulationEnabled(2, true)
            print('Player ' .. playerId .. ' set to routine bucket 2')
        elseif routineBucket == 3 then
            SetPlayerRoutingBucket(playerId, routineBucket)
            SetRoutingBucketPopulationEnabled(3, true)
           print('Player ' .. playerId .. ' set to routine bucket 3')
        end
    else
        print('Player ' .. playerId .. ' is already in routine bucket ' .. routineBucket)
    end
end)

function GetPlayersInBucket(bucket)
    local playersInBucket = {}
    for _, playerId in ipairs(GetPlayers()) do
        local playerBucket = GetPlayerRoutingBucket(playerId)
        if playerBucket == bucket then
            local playerName = GetPlayerName(playerId)
            table.insert(playersInBucket, {id = playerId, name = playerName})
        end
    end
    return playersInBucket
end

RegisterNetEvent('UPServGames:GetBucketPlayers')
AddEventHandler('UPServGames:GetBucketPlayers', function(bucket)
    local playersInBucket = GetPlayersInBucket(bucket)
    TriggerClientEvent('UPServGames:UpdateBucketPlayers', source, bucket, playersInBucket)
end)

RegisterServerEvent('UPServGames:CheckPlayerBucket')
AddEventHandler('UPServGames:CheckPlayerBucket', function()
    local playerId = source
    local playerBucket = GetPlayerRoutingBucket(playerId)
    TriggerClientEvent('UPServGames:SetPlayerBucket', playerId, playerBucket)
end)