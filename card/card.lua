local lg = love.graphics
local c = require("constants")

Card = {}
Card.__index = Card

function Card:new(name)
    local instance = setmetatable({}, Card)
    instance.name = name
    instance.height = c.Card_height
    instance.width = c.Card_width
    return instance
end

function Card:draw(showFace)
    if showFace or self.name == "2 Club" then
        lg.setColor(1, 1, 1)
        lg.rectangle("line", self.x, self.y, self.width, self.height)
        lg.print(self.name, self.x + 5, self.y + 5)
    else
        lg.setColor(0.2, 0.2, 0.2) -- back of the card
        lg.rectangle("fill", self.x, self.y, self.width, self.height)
    end
end

return Card
