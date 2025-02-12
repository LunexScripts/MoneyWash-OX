local options = {
    {
        name = 'ox:option1',
        event = 'pulisci:soldi',
        icon = 'fa-solid fa-money-bill-wave',
        label = 'Witwassen',
    }
}

local modello = {
    'ig_claypain'
}
exports.ox_target:addModel(modello, options)


-- MODELLO PED --
Citizen.CreateThread(function()
    if not HasModelLoaded('ig_claypain') then
        RequestModel('ig_claypain')
        while not HasModelLoaded('ig_claypain') do
            Citizen.Wait(5)
        end
    end

    local npc = CreatePed(4, 'ig_claypain', 722.5538, 2330.7517, 50.7504, 5.3307, false, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
end)

RegisterNetEvent('pulisci:soldi', function()
    local blackMoney = exports.ox_inventory:Search('count', 'black_money')
    if blackMoney >= 1 then
        local input = lib.inputDialog('Witwas', {
            { type = 'number', label = 'Voer de hoeveelheid zwartgeld in dat je wil wassen.', icon = 'fa-solid fa-sack-dollar' },
        })

        if input and #input > 0 then
            TriggerServerEvent('yd_moneywash', input[1])
        end

        lib.notify({
            title = 'Witwas',
            description = 'Geld aan het witwassen.',
            type = 'success'
        })

        if lib.progressCircle({
            duration = 5000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
        }) then
            TriggerServerEvent('togli:soldi', input[1])
        end

        lib.notify({
            title = 'Witwas',
            description = 'Je geld is wit gewassen.',
            type = 'success'
        })
    else
        lib.notify({
            title = 'Witwas',
            description = 'Je hebt geen geld om te wassen.',
            type = 'error'
        })
    end
end)
