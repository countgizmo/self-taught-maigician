return {
    changestate = function(entity, fromState, toState)
        if entity.stateStack and fromState ~= toState then
            local state = entity.states[toState]
            if state then
                if isAnimated(entity) then
                    animation.reset(entity)
                end
                for k, v in pairs(state) do
                    entity[k] = v
                end
            end
        end
    end
}