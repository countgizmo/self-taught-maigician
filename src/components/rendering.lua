-- Rendering component
-- Entities with this component will be rendered on screen.

local rendering = {
    render = function(object)
        love.graphics.draw(
            object.spriteSheet, 
            object.quads[object.currentFrame],
            object.x,
            object.y)
        
            -- debug
            love.graphics.print(object.state, object.x, object.y + object.height)
    end
}

return rendering