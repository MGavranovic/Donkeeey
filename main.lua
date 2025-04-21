local lg = love.graphics

local queen
local card = require("card.card")

function love.load()
    queen = card:new()
end

function love.update()

end

function love.draw()
    queen:draw()
end
