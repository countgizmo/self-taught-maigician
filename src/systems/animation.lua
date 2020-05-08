return {
    reset = function(entity)
        local state = entity.stateStack[#entity.stateStack]

        if isAnimated(entity) then
            entity.animation.states[state].timer = 0
            entity.currentFrame = 1
        end
    end,

    update = function(entity, dt)
        if isAnimated(entity) then
            local state = entity.stateStack[#entity.stateStack]
            local framesCount = #entity.animation.states[state].frames

            entity.animation.states[state].timer = 
                dt + (entity.animation.states[state].timer or 0)
            
            if entity.animation.states[state].timer > 
               (entity.animation.states[state].interval or 
                entity.animation.interval) then
                entity.currentFrame = 1 + (entity.currentFrame % framesCount)

                if entity.currentFrame > framesCount then
                    entity.currentFrame = 1
                end

                entity.animation.states[state].timer = 0
            end
        end
    end
} 