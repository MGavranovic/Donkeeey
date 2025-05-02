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

function Card:draw(faceup, hovered)
    local r, g, b
    if faceup then
        r, g, b = 1, 1, 1
    elseif self.name == "2 of Clubs" then
        r, g, b = 1, 0, 0
    else
        r, g, b = self.back_color.r, self.back_color.g, self.back_color.b
    end

    if hovered then
        r = 0.5
        g = 0.5
        b = 0.5
    end
    lg.setColor(r, g, b)
    if faceup or self.name == "2 of Clubs" then
        lg.rectangle("line", self.x, self.y, self.width, self.height)
        lg.print(self.name, self.x + 5, self.y + 5)
    else
        lg.rectangle("fill", self.x, self.y, self.width, self.height)

        lg.setColor(1, 1, 1)
        lg.print("facedown", self.x + 5, self.y + 5)
    end
end

return Card
