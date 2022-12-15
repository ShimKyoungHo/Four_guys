local DataStoreService = game:GetService("DataStoreService")
local TeleportService = game:GetService("TeleportService")
local dataStore = DataStoreService:GetDataStore("MyDataStore")

local function saveData(player) -- 데이터 저장 함수

	local tableToSave = {
		player.leaderstats.LeftGameCount.Value; -- Table에 처음으로 들어가는 변수(Money)
		player.leaderstats.Time.Value -- Table에 두 번째로 들어가는 변수(Time) - level1
	}

	local success, err = pcall(function()
		dataStore:SetAsync(player.UserId, tableToSave) -- 플레이어ID 및 연계 데이터 저장
	end)

	if success then -- 저장 성공시
		print("Data has been saved!")
	else -- 저장 실패시
		print("Data hasn't been saved!")
		warn(err)
	end
end

game.Players.PlayerAdded:Connect(function(player) -- 플레이어 입장 시

	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local LeftGame = Instance.new("IntValue")
	LeftGame.Name = "LeftGameCount"
	LeftGame.Parent = leaderstats

	local scoreTimeLevel1 = Instance.new("StringValue")
	scoreTimeLevel1.Name = "Time"
	scoreTimeLevel1.Value = "0"
	scoreTimeLevel1.Parent = leaderstats

	local data -- 저장 된 데이터 불러오는 변수
	local success, err = pcall(function()

		data = dataStore:GetAsync(player.UserId) -- 데이터 저장소에서 데이터 불러옴
		

	end)

	if success and data then -- 플레이어와 데이터 로드시 문제가 없으면

		LeftGame.Value = data[1] -- Table에서 첫 번째 값인 재화를 불러옴 (data)
		scoreTimeLevel1.Value = data[2] -- Table에서 두 번째 값인 Level1 시간을 불러옴 (data)

	else -- 새로운 플레이어 로드시
		print("The player has no data!") -- 기본값으로 설정
	end

end)

game.Players.PlayerRemoving:Connect(function(player) -- 플레이어가 떠나면
	local success, err  = pcall(function()
		saveData(player) -- 데이터 저장
	end)

	if success then
		print("Data has been saved")
	else
		print("Data has not been saved!")
	end
	
end)



game:BindToClose(function() -- When the server shuts down
	for _, player in pairs(game.Players:GetPlayers()) do -- Loop through all the players
		local success, err  = pcall(function()
			saveData(player) -- Save the data
		end)

		if success then
			print("Data has been saved")
		else
			print("Data has not been saved!")
		end
	end
end)