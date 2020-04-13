-- Project name: self-taught-macigican
-- Author: Evgheni Kondratenko
-- Copyright: 2020

-- Main entry point for Love2D project. Contains event handlers for Love2D engine
-- and global configuration for the game.

-- Configuration
love.graphics.setDefaultFilter('nearest', 'nearest')
WINDOW_WIDTH, WINDOW_HEIGHT = love.window.getDesktopDimensions()
WINDOW_WIDTH = WINDOW_WIDTH * 0.8
WINDOW_HEIGHT = WINDOW_HEIGHT * 0.8

VIRTUAL_WIDTH = 384
VIRTUAL_HEIGHT = 216

-- Dependencies
require('deps')

function love.load()
    love.window.setTitle('Self-taught Magician')
  
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        highdpi = true
    })

    local room1 = room:new()
    local grandma = character:new({
        x = VIRTUAL_WIDTH - 30,
        y = VIRTUAL_HEIGHT - 30,
        name = "Granny",
        spriteRow = 1})
    
    local player = character:new({
        x = 10,
        y = 10,
        name = "Boy",
        spriteRow = 2,
    })


    world.entities = {room1, player, grandma}
end

function love.keypressed(k)
    if k == 'escape' then
       love.event.quit()
    elseif k == 'f' then
        push:switchFullscreen(WINDOW_WIDTH, WINDOW_HEIGHT)
    end
 end

function love.draw()
    push:start()
  

    love.graphics.clear(119/255, 136/255, 153/255)

    world:render()
  
    -- love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)

    push:finish()
end