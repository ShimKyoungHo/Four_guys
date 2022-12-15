game.ReplicatedStorage.ItemBuy.OnServerEvent:Connect(function(plr, item, Price)
	if plr.leaderstats.Credit.Value >= Price then
		local clo = game.ReplicatedStorage[item]:Clone() --스크립트 수정한 부분(영상대로 하는데 지장 없음)
		
		plr.leaderstats.Credit.Value = plr.leaderstats.Credit.Value - Price
		clo.Parent = plr.Backpack
	end
end)