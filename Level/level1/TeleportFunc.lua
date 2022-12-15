local teleportPart = workspace.StartSpawn.Teleport
local destination = game.Workspace.TPDestination

local function teleport(otherPart)
	local character = otherPart.Parent
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	destination.Anchored = true
	destination.CanCollide = false
	destination.Transparency = 1
	
	if humanoid then
		humanoid.RootPart.CFrame = CFrame.new(destination.Position)
	end
end

teleportPart.Touched:Connect(teleport)
