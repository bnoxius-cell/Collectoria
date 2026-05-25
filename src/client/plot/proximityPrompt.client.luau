local plots = game.Workspace:WaitForChild("Plots")
local CollectionService = game:GetService("CollectionService")
local player = game.Players.LocalPlayer

for _, plot in ipairs(plots:GetChildren()) do
	local valuesFolder = plot:FindFirstChild("Values")
	if not valuesFolder then continue end

	local plotOwner = valuesFolder:FindFirstChild("OwnerValue")
	if not plotOwner then continue end
	if not plotOwner.Value then continue end

	local promptsFolder = plot:FindFirstChild("Prompts")
	if not promptsFolder then continue end 

	for _, prompt in ipairs(promptsFolder:GetChildren()) do
		if prompt:IsA("ProximityPrompt") and CollectionService:HasTag(prompt, "BuyPrompt") then
			-- TODO: Check if the player is the owner of the plot, if yes then enable the prompt
			if plotOwner.Value == player then
				print("YESS")
				prompt.Enabled = true
			end
		end
	end
end
