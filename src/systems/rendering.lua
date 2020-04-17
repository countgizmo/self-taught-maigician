-- Rendering component
-- Entities with this component will be rendered on screen.

return {
    renderall = function(entities)
        for _, entity in pairs(entities) do
            if entity.x and entity.y and entity.spriteSheet and entity.currentFrame and entity.quads then
                love.graphics.draw(
                    entity.spriteSheet, 
                    entity.quads[entity.currentFrame],
                    entity.x,
                    entity.y)
                
                    -- debug
                    love.graphics.print(entity.stateStack[#entity.stateStack], entity.x, entity.y + entity.height)
            elseif entity.render then
                entity:render()
            end
        end
    end
}