local players = game:GetService("Players")
local parent = script.Parent
local targetPlate = workspace.StartWall
local playerCount = #game.Players:GetPlayers()
local StartLine = workspace.GameStartPlace

local needPlayers = 1
local player

--if �÷��̾ 3���̻�, ����ī��Ʈ 0�� �ɽ� ���� Collide ����
StartLine.Touched:Connect(function(hit)
	if hit and hit.Parent  and hit.Parent:FindFirstChild("Humanoid") then
		player = game.Players:GetPlayerFromCharacter(hit.Parent)
		wait(9)
		targetPlate:Destroy()
	end
end)
	

