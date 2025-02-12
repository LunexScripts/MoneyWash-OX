RegisterServerEvent('togli:soldi')
AddEventHandler('togli:soldi', function(quantita)
    local player = source
    local soldidarimuovere = math.floor(quantita * 0.65)
    exports.ox_inventory:RemoveItem(player, 'black_money', quantita)
    exports.ox_inventory:AddItem(player, 'money', soldidarimuovere)
end)
