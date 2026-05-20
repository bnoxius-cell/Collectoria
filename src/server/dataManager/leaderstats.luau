local Leaderstats = {}

local players = game:GetService("Players")

local function createLeaderstats(player)
	if player:FindFirstChild("leaderstats") and player:GetAttribute("hasPlot") then
		return
	end

	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	player:SetAttribute("hasPlot", false)
end

function Leaderstats.start()
	players.PlayerAdded:Connect(createLeaderstats)

	for _, player in ipairs(players:GetChildren()) do
		createLeaderstats(player)
	end
end

return Leaderstats
