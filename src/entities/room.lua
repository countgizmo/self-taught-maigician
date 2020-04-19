local room = {
    x = VIRTUAL_WIDTH / 2 - (VIRTUAL_WIDTH / 4),
    y = VIRTUAL_HEIGHT / 2 - (VIRTUAL_HEIGHT / 4),
    height = VIRTUAL_HEIGHT / 2,
    width = VIRTUAL_WIDTH / 2
}

function room:new()
    o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function doorStencil()
    love.graphics.line(
        room.x + room.width/2 - 15, room.height + room.y, 
        room.x + room.width/2 + 15, room.height + room.y)
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