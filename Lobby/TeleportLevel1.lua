local A_TeleportLV1 = game.ReplicatedStorage:WaitForChild("A_TeleportLV1")
local D_TeleportLV1 = game.ReplicatedStorage:WaitForChild("D_TeleportLV1")

script.Parent.Touched:Connect(function(hit)	-- ����� ���
	local player = game.Players:GetPlayerFromCharacter(hit.Parent)
	if player then
		A_TeleportLV1:FireClient(player)
	end
end)

script.Parent.TouchEnded:Connect(function(hit) -- ������ ������ ���
	local player2 = game.Players:GetPlayerFromCharacter(hit.Parent)
	if player2 then
		D_TeleportLV1:FireClient(player2)
	end
end)