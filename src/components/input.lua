local input = {
    keypressed = function(object, key)
        if object.inputs and object.inputs.keyPress[key] then
            object.state = object.inputs.keyPress[key]
        end
    end,

    keyreleased = function(object, key)
        if object.inputs and object.inputs.keyRelease[key] then
            object.state = object.inputs.keyRelease[key]
        end
    end
}

return input