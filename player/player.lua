local lg = love.graphics
local c = require("constants")

Player = {}
Player.__index = Player

function Player:new(position)
    local instance = setmetatable({}, Player)
    instance.hand = {}
    instance.position = position or "bottom"
    return instance
end

--[[
    This function draws all player hands and adds hover effects
]]
function Player:drawHand()
    local spacing = 100
    local card_w = c.Card_width
    local card_h = c.Card_height
    local screen_w = lg.getWidth()
    local screen_h = lg.getHeight()
    local mx, my = love.mouse.getPosition()

    local function is_hovered(card)
        return mx >= card.x and mx <= card.x + card_w and my >= card.y and my <= card.y + card_h
    end

    local hovered_card = nil

    if self.position == "bottom" or self.position == "top" then
        local total_width = #self.hand * spacing
        local start_x = (screen_w - total_width) / 2
        local y

        if self.position == "bottom" then
            y = screen_h - card_h - 20
        elseif self.position == "top" then
            y = 20
        end

        for i, card in ipairs(self.hand) do
            card.x = start_x + (i - 1) * spacing
            card.y = y
        end

        for i = #self.hand, 1, -1 do
            local card = self.hand[i]
            if is_hovered(card) then
                hovered_card = card
                break
            end
        end

        for _, card in ipairs(self.hand) do
            if card ~= hovered_card then
                card:draw(self.position == "bottom", false)
            end
        end

        if hovered_card then
            hovered_card:draw(self.position == "bottom", true)
        end
    elseif self.position == "left" or self.position == "right" then
        local total_height = #self.hand * spacing
        local start_y = (screen_h - total_height) / 2
        local x = self.position == "left" and 20 or (screen_w - card_w - 20)

        for i, card in ipairs(self.hand) do
            card.x = x
            card.y = start_y + (i - 1) * spacing
        end

        for i = #self.hand, 1, -1 do
            local card = self.hand[i]
            if is_hovered(card) then
                hovered_card = card
                break
            end
        end

        for _, card in ipairs(self.hand) do
            if card ~= hovered_card then
                card:draw(false, false)
            end
        end

        if hovered_card then
            hovered_card:draw(false, true)
        end
    end
end

return Player
