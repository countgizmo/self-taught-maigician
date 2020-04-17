return {
    keypressed = function(object, key)
        if object.inputs and object.inputs.keyPress[key] then
            statemachine.changestate(object, object.stateStack[#object.stateStack], object.inputs.keyPress[key])
            table.insert(object.stateStack, object.inputs.keyPress[key])
        end
    end,

    keyreleased = function(object, key)
        if object.inputs and object.inputs.keyRelease[key] then
            statemachine.changestate(object, object.stateStack[#object.stateStack], object.inputs.keyRelease[key])
            table.remove(object.stateStack)
        end
    end
}