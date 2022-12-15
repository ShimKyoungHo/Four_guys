local players = game:GetService("Players")
local parent = script.Parent
local targetPlate = workspace.StartWall
local playerCount = #game.Players:GetPlayers()
local StartLine = workspace.GameStartPlace

local needPlayers = 1
local player

--if 플레이어가 3명이상, 게임카운트 0이 될시 벽의 Collide 삭제
StartLine.Touched:Connect(function(hit)
	if hit and hit.Parent  and hit.Parent:FindFirstChild("Humanoid") then
		player = game.Players:GetPlayerFromCharacter(hit.Parent)
		wait(9)
		targetPlate:Destroy()
	end
end)
	

