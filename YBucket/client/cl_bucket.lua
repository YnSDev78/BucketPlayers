numberPlayersIsInBucket2 = 0
numberPlayersIsInBucket3 = 0
numberPlayersIsInBucket0 = 0

function UpdateBucketCount()
    TriggerServerEvent('UPServGames:printbucket0players')
    TriggerServerEvent('UPServGames:printbucket2players')
    TriggerServerEvent('UPServGames:printbucket3players')
end

RegisterNetEvent('UPServGames:updateBucketCount0')
AddEventHandler('UPServGames:updateBucketCount0', function(bucketCount)
    if bucketCount then
        numberPlayersIsInBucket0 = bucketCount
    else
        numberPlayersIsInBucket0 = 0
    end
end)

RegisterNetEvent('UPServGames:updateBucketCount2')
AddEventHandler('UPServGames:updateBucketCount2', function(bucketCount)
    if bucketCount then
        numberPlayersIsInBucket2 = bucketCount
    else
        numberPlayersIsInBucket2 = 2
    end
end)

RegisterNetEvent('UPServGames:updateBucketCount3')
AddEventHandler('UPServGames:updateBucketCount3', function(bucketCount)
    if bucketCount then
        numberPlayersIsInBucket3 = bucketCount
    else
        numberPlayersIsInBucket3 = 3
    end
end)

RegisterNetEvent('UPServGames:SetPlayerBucket')
AddEventHandler('UPServGames:SetPlayerBucket', function(bucket)
    isBucket0Player = (bucket == 0)
    isBucket2Player = (bucket == 2)
    isBucket3Player = (bucket == 3)
end)

function IsPlayerInBucket0()
    return isBucket0Player
end

function IsPlayerInBucket2()
    return isBucket2Player
end

function IsPlayerInBucket3()
    return isBucket3Player
end


Citizen.CreateThread(function()
    TriggerServerEvent('UPServGames:CheckPlayerBucket')
end)