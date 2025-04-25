local lg = love.graphics
local c = require('constants')
local Card = require('card.card')

Base_deck = {}

Base_deck.__index = Base_deck

function Base_deck:new()
    local instance = setmetatable({}, Base_deck)
    instance.cards = {}

    local ranks = { "Q", "K", "J", "A" }
    local suites = { "Heart", "Spade", "Diamond", "Club" }
    for _, rank in ipairs(ranks) do
        for _, suite in ipairs(suites) do
            local name = rank .. suite
            table.insert(instance.cards, Card:new(name))
        end
    end

    table.insert(instance.cards, Card:new("2 Club"))

    return instance
end

function Base_deck:draw()
    for _, card in ipairs(self.cards) do
        lg.print(card, 110, 210)
    end
end

function Base_deck:shuffle()
    local cards = self.cards
    for i = #cards, 2, -1 do
        local j = love.math.random(i)
        cards[i], cards[j] = cards[j], cards[i]
    end
end

function Base_deck:deal(players)
    local i = 1
    while #self.cards > 0 do
        local curr_player = players[i]
        local card = table.remove(self.cards) -- removes last card from the deck

        table.insert(curr_player.hand, card)

        i = i + 1
        if i > #players then
            i = 1 -- cycle back to first player
        end
    end
end

return Base_deck
