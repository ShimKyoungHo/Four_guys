local StartLine = workspace.GameStartPlace
local EndLine = workspace.EndLine
local label = workspace.TimeBoard.SurfaceGui.TextLabel
local DataStoreService = game:GetService("DataStoreService")
local destination = game.Workspace.StartSpawn

local start = 0
local elapse = 0
local player

local function teleport(otherPart)
	local character = otherPart.Parent
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	destination.Anchored = true
	destination.CanCollide = false

	if humanoid then
		humanoid.RootPart.CFrame = CFrame.new(destination.Position)
	end
end

StartLine.Touched:Connect(function(hit)
	if hit and hit.Parent  and hit.Parent:FindFirstChild("Humanoid") then
		player = game.Players:GetPlayerFromCharacter(hit.Parent)
		label.Text = "측정중"
		start = tick()
		wait(9)
		StartLine.CanCollide = false
		StartLine.CanTouch = false
		StartLine.Transparency = 1
		StartLine.SurfaceGui.TextLabel.Transparency = 1
	end
end)

EndLine.Touched:Connect(function(hit)
	local player2 = game.Players:GetPlayerFromCharacter(hit.Parent)
	elapse = tick() - start
	label.Text = string.format("Time: %1.1f",elapse)
	player2.leaderstats.Time.Value = string.format("%1.2f",elapse)
end)
EndLine.Touched:Connect(teleport)

--[[
StartLine.Touched:Connect(function(hit)
	if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
		player = game.Players:GetPlayerFromCharacter(hit.Parent)
		iD = player.UserId
		start = tick()
		label.Text = "측정중"
	end
end)

EndLine.Touched:Connect(function(hit)
	if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
		local player2 = game.Players:GetPlayerFromCharacter(hit.Parent)
		if label.Text == "측정중"and iD == player2.UserId then 
			elapse = tick() - start
			label.Text = string.format("Time: %1.1f",elapse)
			player2.leaderstats.Time.Value = string.format("%1.2f",elapse)
		end
	end
end)
]]--