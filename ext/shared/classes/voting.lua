-- Based on MapVote by ensio

local presetValues = require '__shared/presets' -- Get all presets
local Voting = class("Voting")

local currentlyvoting = false
votedPreset = nil

Votes =  {}
Votes.players = {}



function Voting:Start()
    currentlyvoting = true
    -- Open WebUI
end

function Voting:Done()
    if currentlyvoting == true then
    currentlyvoting = false
    currentvotingtime = false

    -- find most votes
    mostVotes = 0
    votedPreset = nil

    for _, presetName in pairs(Votes) do 
        if Votes[presetName] >= mostVotes then
            mostVotes = Votes[presetName]
            votedPreset = presetName
        end
    end
    -- Close WebUI
end

function Voting:AddVote(player)
    if currentlyvoting == true then
        if Votes.players[player.name] ~= nil then
            Votes[votedPreset] - 1              -- remove previous vote
        else
            Votes[presetName] + 1               -- add vote
            Votes.players[player.name]          -- add player to list
            votedPreset = presetName            -- declare Votedpreset
        end
    end
end



-- Time
function getRoundInfo()
    local getRounds = RCON:SendCommand("mapList.getRounds"); 
    local currentRound = tonumber(getRounds[2]) + 1;
    local roundCount = tonumber(getRounds[3]);

    return currentRound, roundCount
end

Events:Subscribe('Server:RoundOver', function(roundTime, winningTeam)
    local currentRound, roundCount = getRoundInfo()

    if currentRound == roundCount then
        Voting:Start()
    end
end)

currentvotingtime = 0
voteLength = 52 
Events:Subscribe('SecondElapsed', function(lastSecond)
	if currentlyvoting == false then
		return
	end
    
	if currentvotingtime >= voteLength then
		Voting:Done()
		return
	end
end)


        