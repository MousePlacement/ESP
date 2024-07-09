-- LocalScript in StarterPlayerScripts or StarterCharacterScripts

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Function to add highlight effect to a character
local function addHighlightToCharacter(character)
    local highlight = Instance.new("Highlight")
    highlight.Adornee = character
    highlight.Parent = character
end

-- Function to add highlight effect to a player
local function addHighlightToPlayer(player)
    if player ~= LocalPlayer then
        if player.Character then
            addHighlightToCharacter(player.Character)
        end
        player.CharacterAdded:Connect(addHighlightToCharacter)
    end
end

-- Add highlight effect to all current players except the local player
for _, player in ipairs(Players:GetPlayers()) do
    addHighlightToPlayer(player)
end

-- Add highlight effect to new players except the local player
Players.PlayerAdded:Connect(addHighlightToPlayer)
