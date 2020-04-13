local player = {
    x = 10,
    y = 10,
    height = 16,
    width = 16,
    velocity = 25,
    currentFrame = 1,
    spriteSheet = love.graphics.newImage('resources/img/dummy-top-down.png'),
    render = rendering.render
}

player.quads = {
    love.graphics.newQuad(0, 0, 16, 16 , player.spriteSheet:getDimensions()), -- facing front
    love.graphics.newQuad(16, 0, 16, 16 , player.spriteSheet:getDimensions()), -- facing right
    love.graphics.newQuad(32, 0, 16, 16 , player.spriteSheet:getDimensions()) -- facing back
}

return player