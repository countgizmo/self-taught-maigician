local room = {
    x = 1,
    y = 1,
    height = VIRTUAL_HEIGHT-1,
    width = VIRTUAL_WIDTH - 1
}

function room:new()
    o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function doorStencil()
    love.graphics.line(room.width/2 - 15, room.height, room.width/2 + 15, room.height)
end

function room:render()
    love.graphics.stencil(doorStencil, "replace", 1)
    love.graphics.setStencilTest("less", 1)

    -- floor
    love.graphics.setColor(131/255, 118/255, 156/255, 255)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)

    -- walls
    love.graphics.setColor(255/255, 204/255, 170/255, 255)
    love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
    
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.setStencilTest()
end

return room