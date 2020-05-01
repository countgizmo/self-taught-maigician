return {
    render = function(entity)
        isAnimated = function(entity)
            return entity.stateStack
            and entity.stateStack[#entity.stateStack]
            and entity.animation
            and entity.animation.states
        end

        getFrame = function(entity)
            if isAnimated(entity) then
                local state = entity.stateStack[#entity.stateStack]

                if entity.animation.states[state] then
                    return entity
                        .animation
                        .states[state]
                        .frames[entity.currentFrame]
                else
                    return entity.currentFrame
                end
            end

            return entity.currentFrame
        end

        isFlipped = function(entity)
            if isAnimated(entity) then
                local state = entity.stateStack[#entity.stateStack]
                if entity.animation.states[state] then
                    return entity.animation.states[state].isFlipped or false
                end
            end

            return false
        end

        isRenderable = function(entity)
            return entity.x and entity.y 
            and entity.spriteSheet 
            and entity.currentFrame 
            and entity.quads
        end

        if isRenderable(entity) then
            local frame = getFrame(entity)

            if isFlipped(entity) then
                love.graphics.draw(
                    entity.spriteSheet,
                    entity.quads[frame],
                    entity.x,
                    entity.y,
                    0,
                    -1,
                    1,
                    entity.width)
            else 
                love.graphics.draw(
                    entity.spriteSheet, 
                    entity.quads[frame],
                    entity.x,
                    entity.y)
            end
            
            -- debug
            love.graphics.print((entity.velocityX or 0) .. ' : ' .. (entity.velocityY or 0), entity.x+20, entity.y + entity.height)
            for i,s in ipairs(entity.stateStack) do
                love.graphics.print(s, entity.x, entity.y + entity.height * i)
                
            end
        elseif entity.render then
            entity:render()
        end
    end
}