local mainGUI = game.StarterGui.LV1Teleport
local start = mainGUI.ImageLabel.Start

local Players = game:GetService("Players")
local teleportService = game:GetService("TeleportService")
local player = Players:GetPlayers()[1]

local gameID1 = 11500303319	--LV1 Map ID

start.MouseButton1Up:Connect(function()
	teleportService:TeleportAsync(gameID1, {player}) --적용 시 텔레포트 가능
end)
