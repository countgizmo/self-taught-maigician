return {
    changestate = function(entity, fromState, toState)
        if entity.stateStack and fromState ~= toState then
            local transition = entity.stateTransitions[fromState][toState]
            if transition then
                for k, v in pairs(transition) do
                    entity[k] = v
                end
            end
        end
    end
}