-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- MOVING PLATFORM SETTINGS - Edit the settings to change how the platform works.

moveDelay = 4 -- The delay (in seconds) for moving between destinations.

topSpeed = 30 -- The maximum speed that the platform can move at.
-- If the platform is too slow and moveDelay is too fast, then the platform might not reach the destination in time.

hideDestinationBlocks = true -- If you set this to true, then the destination blocks will be invisible when you play.
-- Otherwise, set it to false if you want to see them.

-- If you add more parts titled "Destination 3" or "Destination 4" etc. Then the platform will work with those new destinations.
-- Use Ctrl + D to duplicate a destination block while it is selected, which keeps the duplicate under the same folder.
-- If a destination is outside the folder, then it won't be added to the destination list.

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --







-- Below is the script to make the moving platform work. It won't work if something is wrong with the destination blocks.

local mainFolder = script.Parent
local platform = mainFolder.Platform
local alignPosition = platform.AlignPosition

local destinationList = {}
-- Get the valid destinations by checking their name for the string "Destination " (with a space at the end).
for index, value in pairs(mainFolder:GetChildren()) do
	local valueName = value.Name
	if string.match(valueName, "Destination ") then
		table.insert(destinationList, valueName)
	end
end

local sortedList = {}
repeat -- Sort the list
	local lowestValue = {nil, math.huge}
	-- Table describing the index of the destination of the lowest value, followed by its value.
	for index, value in pairs(destinationList) do
		local nameSplit = string.split(destinationList[index], " ") -- Split the name to isolate its destination number
		local stringToNumber = tonumber(nameSplit[2]) -- Convert the destination number to an actual number
		if stringToNumber < lowestValue[2] then
			lowestValue = {index, stringToNumber} -- Overwrite the lowestValue table with the new lowest value.
		end
	end
	table.insert(sortedList, destinationList[lowestValue[1]]) -- Insert the lowest value into the sorted list
	destinationList[lowestValue[1]] = "Destination 999999" -- Don't remove the lowest value because it will end the loop early.
until #sortedList == #destinationList -- Repeat until the sorted list has all the destinations.

-- I want a more efficient method of sorting the destinations.

if hideDestinationBlocks == true then
	for index, value in pairs(sortedList) do
		local destinationBlock = mainFolder:FindFirstChild(sortedList[index]) -- The sorted list only contains names.
		destinationBlock:ClearAllChildren()
		destinationBlock.Transparency = 1
	end
end

alignPosition.MaxVelocity = topSpeed
platform.Anchored = false

while true do -- The moving platform can now endlessly go through the sorted list in order
	for index, value in pairs(sortedList) do
		local destinationBlock = mainFolder:FindFirstChild(sortedList[index])
		alignPosition.Position = destinationBlock.Position
		wait(moveDelay)
	end
end