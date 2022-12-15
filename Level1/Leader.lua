local DataStoreService = game:GetService("DataStoreService")
local dataStore = DataStoreService:GetDataStore("MyDataStore")
local dataStore2 = DataStoreService:GetDataStore("MyDataStore2")

function onPlayerEntered(newPlayer)

	local stats = Instance.new("IntValue")
	stats.Name = "leaderstats"

	local Money = Instance.new("IntValue")
	Money.Name = "Credit"
	Money.Value = 500
	Money.Parent = stats
	stats.Parent = newPlayer
	
	local LeftGame = Instance.new("IntValue")
	LeftGame.Name = "LeftGame"
	LeftGame.Value = 10
	LeftGame.Parent = stats
	stats.Parent = newPlayer
	
	local scoreTimeLevel1 = Instance.new("StringValue")
	scoreTimeLevel1.Name = "Level1Time"
	scoreTimeLevel1.Value = "0"
	scoreTimeLevel1.Parent = stats
	
	local scoreTimeLevel2 = Instance.new("StringValue")
	scoreTimeLevel2.Name = "Level2Time"
	scoreTimeLevel2.Value = "0"
	scoreTimeLevel2.Parent = stats

	

	local data -- 저장 된 데이터 불러오는 변수
	local data2
	local success, err = pcall(function()

		data = dataStore:GetAsync(newPlayer.UserId) -- 데이터 저장소에서 데이터 불러옴
		data2 = dataStore2:GetAsync(newPlayer.UserId)

	end)

	if success and data then -- 플레이어와 데이터 로드시 문제가 없으면

		scoreTimeLevel1.Value = data[2] -- Table에서 두 번째 값인 Level1 시간을 불러옴 (data)
		scoreTimeLevel2.Value = data2[2]
		

	else -- 새로운 플레이어 로드시
		print("The player has no data!") -- 기본값으로 설정
	end
end

game.Players.ChildAdded:connect(onPlayerEntered)