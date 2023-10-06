Config = {
    Bests = {
        "identifier" = true,
    }
}

CreateThread(function()
    while true do 
        Citizen.Wait(30000)
        local xPlayers = ESX.GetExtendedPlayers()
        for _, xPlayer in pairs(xPlayers) do 
            if xPlayer.getGroup() == "best" then 
                if not Config.Bests[xPlayer.identifier] then 
                    print("Gracz: " .. xPlayer.source .. " aka " .. GetPlayerName(xPlayer.source) .." został wyrzucony i zmieniono jego groupa na user ponieważ ma besta a nie ma go w configu.")
                    ExecuteCommand("setgroup " .. xPlayer.source .. " user")
                    DropPlayer(xPlayer.source, "HEIDRUN_ANTIBEST: Why you have best?")
                end
            end
        end
    end
end)
