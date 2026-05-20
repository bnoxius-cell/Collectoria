local PlotManager = {}

local ShelfManager = require(script.shelfManager)
local PlotOwnership = require(script.plotOwnership)

function PlotManager.init()
	PlotOwnership.init()
	ShelfManager.init()
end

return PlotManager
