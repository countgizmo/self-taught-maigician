local character = {
    name = "",
    x = 1,
    y = 1,
    velocity = 25,
    width = 16,
    height = 16,
    currentFrame = 1,
    quads = {},
}

function character:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    o.quads = generateQuads(o.spriteSheet, o.width, o.height, o.spriteRow, 16)
    return o
end


return character