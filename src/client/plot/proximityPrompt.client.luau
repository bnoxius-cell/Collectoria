local CollectionService = game:GetService("CollectionService")
local player = game.Players.LocalPlayer

-- This function runs whenever a BuyPrompt is found or finishes loading
local function setupBuyPrompt(prompt)
    -- Find the specific 'Plot' folder this prompt belongs to
    local plot = prompt:FindFirstAncestor("Plot")
    if not plot then return end
    
    -- Find the OwnerValue inside this specific plot
    local ownerValue = plot:FindFirstChild("OwnerValue", true)
    if not ownerValue then return end

    -- Function to enable/disable based on ownership
    local function updatePromptState()
        prompt.Enabled = (ownerValue.Value == player)
    end

    -- Run it once immediately
    updatePromptState()

    -- Automatically update if the plot is bought/sold later!
    ownerValue:GetPropertyChangedSignal("Value"):Connect(updatePromptState)
end

-- 1. Handle any prompts that are ALREADY loaded when the script runs
for _, prompt in ipairs(CollectionService:GetTagged("BuyPrompt")) do
    setupBuyPrompt(prompt)
end

-- 2. Handle prompts that load LATE due to lag or StreamingEnabled (Fixes the {} issue!)
CollectionService:GetInstanceAddedSignal("BuyPrompt"):Connect(setupBuyPrompt)