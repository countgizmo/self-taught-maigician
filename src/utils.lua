function generateQuads(spriteSheet, width, height, row, total)
    local quads = {}

    for i=0,total-1 do
        table.insert(quads, love.graphics.newQuad(
            i * width, 
            (row-1) * height, 
            width,
            height, 
            spriteSheet:getDimensions()))
    end

    return quads
end

function isAnimated(entity)
    return entity.stateStack
    and entity.stateStack[#entity.stateStack]
    and entity.animation
    and entity.animation.states
    and entity.animation.states[entity.stateStack[#entity.stateStack]]
end