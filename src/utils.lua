function generateQuads(spriteSheet, width, height, row, total, offsetX, offsetY)
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
