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

    table.insert(instance.cards, "2 Club")

    return instance
end

function Base_deck:draw()
    for _, card in ipairs(self.cards) do
        lg.print(card, 110, 210)
    end
end

return Base_deck
