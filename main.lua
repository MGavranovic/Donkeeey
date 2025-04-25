local lg = love.graphics

local queen
local card = require("card.card")
local base_deck = require("deck.base_deck")
local player = require("player.player")

function love.load()
    Playing_deck = base_deck:new()
    Playing_deck:shuffle()

    Player_me = Player:new("bottom")

    Enemy_mid = Player:new("top")
    Enemy_right = Player:new("right")
    Enemy_left = Player:new("left")

    Players = { Enemy_right, Enemy_mid, Enemy_left, Player_me }
    Playing_deck:deal(Players)
end

function love.update()

end

function love.draw()
    Player_me:drawHand()

    Enemy_left:drawHand()
    Enemy_mid:drawHand()
    Enemy_right:drawHand()
end
