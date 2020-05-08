return {
    keypressed = function(object, key)
        if object.inputs and object.inputs.keyPress[key] then
            statemachine.changestate(object, object.stateStack[#object.stateStack], object.inputs.keyPress[key])
            table.insert(object.stateStack, object.inputs.keyPress[key])
        end
    end,

    keyreleased = function(object, key)
        if object.stateStack then
            local fromState = object.stateStack[#object.stateStack]
            
            if #object.stateStack > 1 then
                table.remove(object.stateStack)
            end

            local toState = object.stateStack[#object.stateStack] or 'idle'
            statemachine.changestate(object, fromState, toState)
        end
    end
}