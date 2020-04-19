return {
    update = function(entity, dt)
        if entity.animation 
            and entity.stateStack
            and entity.animation.states[entity.stateStack[#entity.stateStack]] then
            local state = entity.stateStack[#entity.stateStack]
            local framesCount = #entity.animation.states[state].frames

            entity.animation.states[state].timer = 
                dt + (entity.animation.states[state].timer or 0)
            
            if entity.animation.states[state].timer > 
               (entity.animation.states[state].interval or 
                entity.animation.interval) then
                entity.currentFrame = 1 + (entity.currentFrame % framesCount)
                entity.animation.states[state].timer = 0
            end
        end
    end
} 