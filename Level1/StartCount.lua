local number = 10
local playerCount = #game.Players:GetPlayers()
local destination = workspace.TPDestination
local readyFloor = workspace.ReadyFloor.ReadyPart
local needPlayers = 1

script.Enabled = true
script.Parent.TextTransparency = 0

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

readyFloor.Touched:Connect(function(hit)
	if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
		script.Parent.Text = "게임 시작에 필요한 인원 수 : "..playerCount.." / "..needPlayers
	end
end)

if playerCount >= needPlayers then
	readyFloor.Touched:Connect(teleport)
	while true do
		number= number - 1
		script.Parent.Text = number
		if number == 0 then
			script.Parent.TextTransparency = 1
			script.Disabled = true
			game.StarterGui.ScreenGui.StartCount.StartCount:Destroy()
			break		
		end
		
		wait(1)
	end
end