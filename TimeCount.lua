local playerCount = #game.Players:GetPlayers()
local StartLine = workspace.GameStartPlace
local timeCount = game.StarterGui.ScreenGui.TimeCount

local needPlayers = 1
local minutes = 0
local seconds = 0
local start = 0
local player
local realTime = 0

script.Parent.TextTransparency = 1

StartLine.Touched:Connect(function(hit)
	if hit and hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
		player = game.Players:GetPlayerFromCharacter(hit.Parent)
		start = tick()
	end
end)

if playerCount >= needPlayers then
	script.Parent.TextTransparency = 0
	wait(8)
	while true do
		realTime = math.round(tick()-start)
		seconds = realTime%60
		minutes = math.floor(realTime/60)
		if minutes == 0 then
			script.Parent.Text = seconds.. "√ "
		else	
			script.Parent.Text = minutes .. "∫–" ..seconds .. "√ "
		end

		wait(1)
	end
end