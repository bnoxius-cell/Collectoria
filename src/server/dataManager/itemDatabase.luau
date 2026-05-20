local itemDatabase = {}
itemDatabase.shelfThemes = {
	["CHIBI_BUTTERFLY"] = "Butterfly",
	["SHELF_NAME"] = "THEME_NAME",
}
itemDatabase.Collections = {}

local rs = game:GetService("ReplicatedStorage")

-- Load all sub-modules (Butterfly, Frog, etc.)
for _, collections in ipairs(rs:FindFirstDescendant("ItemDatabase"):GetChildren()) do
	if collections:IsA("ModuleScript") then
		local data = require(collections)
		itemDatabase.Collections[data.themeName] = data.plushies
	end
end

function itemDatabase.getPlushieTheme(plushieName)
	for themeName, plushies in pairs(itemDatabase.Collections) do
		if table.find(plushies, plushieName) then
			return themeName
		end
	end
	return nil
end

return itemDatabase
