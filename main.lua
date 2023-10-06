local best_identifiers = {
    ["license:000000"] = true,
    ["license:000001"] = true,
    ["license:000002"] = true,
}

CreateThread(function()
    while true do
        Wait(30000)
        local xPlayers = ESX.GetExtendedPlayers()
        for _, xPlayer in pairs(xPlayers) do 
            if xPlayer.getGroup() == "best" then 
                if not best_identifiers[xPlayer.identifier] then 
                    print("Gracz: ".. xPlayer.getName() .." ["..xPlayer.source.."] został wyrzucony z serwera ponieważ posiadał on niedozwoloną dla niego range.")
                    xPlayer.setGroup("user")
                    Wait(1000)
                    xPlayer.kick("Wykryto u Ciebie niedozwoloną rangę, wejdź ponownie na serwer.")
                end
            end
        end
    end
end)