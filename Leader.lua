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

	

	local data -- ���� �� ������ �ҷ����� ����
	local data2
	local success, err = pcall(function()

		data = dataStore:GetAsync(newPlayer.UserId) -- ������ ����ҿ��� ������ �ҷ���
		data2 = dataStore2:GetAsync(newPlayer.UserId)

	end)

	if success and data then -- �÷��̾�� ������ �ε�� ������ ������

		scoreTimeLevel1.Value = data[2] -- Table���� �� ��° ���� Level1 �ð��� �ҷ��� (data)
		scoreTimeLevel2.Value = data2[2]
		

	else -- ���ο� �÷��̾� �ε��
		print("The player has no data!") -- �⺻������ ����
	end
end

game.Players.ChildAdded:connect(onPlayerEntered)