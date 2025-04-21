local lg = love.graphics
local c = require("constants")

Card = {}
Card.__index = Card

function Card:new()
    local instance = setmetatable({}, Card)
    instance.height = c.Card_height
    instance.width = c.Card_width
    return instance
end

function Card:draw()
    lg.setColor(1, 1, 1)
    lg.rectangle("line", 100, 200, self.width, self.height)
end

return Card
