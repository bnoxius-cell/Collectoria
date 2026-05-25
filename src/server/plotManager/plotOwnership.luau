local PlotOwnership = {}

local players = game:GetService("Players")

-- assign a random plot to each player
local function assignPlot(player)
	if player:GetAttribute("hasPlot") then
		return
	end

	local plots = game.Workspace:WaitForChild("Plots")

	for _, plot in ipairs(plots:GetChildren()) do
		local valuesFolder = plot:FindFirstChild("Values")
		if not valuesFolder then
			continue
		end
		local plotOwner = valuesFolder:FindFirstChild("OwnerValue")
		if not plotOwner then
			continue
		end

		plotOwner.Value = player
		player:SetAttribute("hasPlot", true)
		print("Assigned plot to " .. player.Name)
		return
	end
end

function PlotOwnership:start()
	-- call the function upon player join
	players.PlayerAdded:Connect(assignPlot)

	-- catch the players already in the game before the script runs
	-- this is most likely when a new server starts
	for _, player in ipairs(players:GetChildren()) do
		assignPlot(player)
	end

	players.PlayerRemoving:Connect(function(player)
		if not player:GetAttribute("hasPlot") then
			return
		end
		local plots = game.Workspace:WaitForChild("Plots")
		for _, plot in ipairs(plots:GetChildren()) do
			local plotOwner = plot:WaitForChild("Values"):WaitForChild("OwnerValue")
			if plotOwner.Value == player then
				plotOwner.Value = nil
				print("Removed plot from " .. player.Name)
				return
			end
		end
	end)
end

return PlotOwnership
