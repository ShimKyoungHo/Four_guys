game.ReplicatedStorage.ItemBuy.OnServerEvent:Connect(function(plr, item, Price)
	if plr.leaderstats.Credit.Value >= Price then
		local clo = game.ReplicatedStorage[item]:Clone() --��ũ��Ʈ ������ �κ�(������ �ϴµ� ���� ����)
		
		plr.leaderstats.Credit.Value = plr.leaderstats.Credit.Value - Price
		clo.Parent = plr.Backpack
	end
end)