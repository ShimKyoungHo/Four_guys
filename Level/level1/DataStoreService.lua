local DataStoreService = game:GetService("DataStoreService")
local TeleportService = game:GetService("TeleportService")
local dataStore = DataStoreService:GetDataStore("MyDataStore")

local function saveData(player) -- ������ ���� �Լ�

	local tableToSave = {
		player.leaderstats.LeftGameCount.Value; -- Table�� ó������ ���� ����(Money)
		player.leaderstats.Time.Value -- Table�� �� ��°�� ���� ����(Time) - level1
	}

	local success, err = pcall(function()
		dataStore:SetAsync(player.UserId, tableToSave) -- �÷��̾�ID �� ���� ������ ����
	end)

	if success then -- ���� ������
		print("Data has been saved!")
	else -- ���� ���н�
		print("Data hasn't been saved!")
		warn(err)
	end
end

game.Players.PlayerAdded:Connect(function(player) -- �÷��̾� ���� ��

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

	local data -- ���� �� ������ �ҷ����� ����
	local success, err = pcall(function()

		data = dataStore:GetAsync(player.UserId) -- ������ ����ҿ��� ������ �ҷ���
		

	end)

	if success and data then -- �÷��̾�� ������ �ε�� ������ ������

		LeftGame.Value = data[1] -- Table���� ù ��° ���� ��ȭ�� �ҷ��� (data)
		scoreTimeLevel1.Value = data[2] -- Table���� �� ��° ���� Level1 �ð��� �ҷ��� (data)

	else -- ���ο� �÷��̾� �ε��
		print("The player has no data!") -- �⺻������ ����
	end

end)

game.Players.PlayerRemoving:Connect(function(player) -- �÷��̾ ������
	local success, err  = pcall(function()
		saveData(player) -- ������ ����
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