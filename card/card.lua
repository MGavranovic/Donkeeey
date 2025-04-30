local lg = love.graphics
local c = require("constants")

Card = {}
Card.__index = Card

function Card:new(name)
    local instance = setmetatable({}, Card)
    instance.name = name
    instance.height = c.Card_height
    instance.width = c.Card_width

    instance.back_color = {
        r = love.math.random(),
        g = love.math.random(),
        b = love.math.random()
    }

    return instance
end

function Card:draw(faceup)
    if faceup then
        lg.setColor(1, 1, 1)
        lg.rectangle("line", self.x, self.y, self.width, self.height)
        lg.print(self.name, self.x + 5, self.y + 5)
    elseif self.name == "2 of Clubs" then
        lg.setColor(1, 0, 0)
        lg.rectangle("line", self.x, self.y, self.width, self.height)
        lg.print(self.name, self.x + 5, self.y + 5)
    else
        lg.setColor(self.back_color.r, self.back_color.g, self.back_color.b) -- back of the card
        lg.rectangle("fill", self.x, self.y, self.width, self.height)

        lg.setColor(1, 1, 1)
        lg.print("facedown", self.x + 5, self.y + 5)
    end
end

return Card
