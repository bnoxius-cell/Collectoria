local PlotManager = {}

local ShelfManager = require(script.shelfManager)
local PlotOwnership = require(script.plotOwnership)

function PlotManager:start()
	PlotOwnership:start()
	ShelfManager:start()
end

return PlotManager
