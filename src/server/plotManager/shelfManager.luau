local ShelfManager = {}

local CS = game:GetService("CollectionService")

function ShelfManager:start()
	local buyShelfPrompt = CS:GetTagged("BuyPrompt")

	for _, prompt in ipairs(buyShelfPrompt) do
		prompt.Triggered:Connect(function(player)
			local temporaryBox = prompt.Parent.Parent
			local shelf = temporaryBox.Parent.Parent
			local permanentVisuals = shelf:WaitForChild("PermanentVisuals"):WaitForChild("Shelf")

			if temporaryBox:IsA("Model") then
				temporaryBox:Destroy()
			end

			for _, meshPart in ipairs(permanentVisuals:GetChildren()) do
				if meshPart:IsA("MeshPart") then
					meshPart.Transparency = 0
					meshPart.CanCollide = true
					meshPart.CanTouch = true
					if meshPart.Name == "Glass" then
						meshPart.Transparency = 0.5
					end
				end
			end

			local PlacePlushiePrompt = CS:GetTagged("PlacePlushiePrompt")
			local shelfOwner = shelf.Parent.Parent.Parent.Parent:WaitForChild("Values"):WaitForChild("OwnerValue")
			if shelfOwner.Value == player then
				PlacePlushiePrompt.Enabled = true
			end

			print("shelf bought")
		end)
	end
end

return ShelfManager
