local lg = love.graphics

local queen
local card = require("card.card")
local base_deck = require("deck.base_deck")

function love.load()
    Playing_deck = Base_deck:new()
    queen = Playing_deck.cards[1]
end

function love.update()

end

function love.draw()
    queen:draw()
end
