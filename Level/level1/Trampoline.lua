local trampoline = script.Parent

local MaxJump = 14.4
local NormalJump = 7.2

local function onTouch(part)
	local humanoid = part.Parent:FindFirstChildWhichIsA("Humanoid");

	if humanoid then
		humanoid.JumpHeight = MaxJump
		humanoid.Jump = true
		
		wait(1)
		
		humanoid.JumpHeight = NormalJump
	end
end

script.Parent.Touched:Connect(onTouch)