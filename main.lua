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

gSmallFont = love.graphics.newFont('resources/fonts/font.ttf', 8)
love.graphics.setFont(gSmallFont)

-- Dependencies
require('deps')

function love.load()
    love.window.setTitle('Self-taught Magician')
  
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        highdpi = true
    })

    world.level = level0
end

function love.conf(t)
    t.console = true
end

function love.keypressed(k)
     --Debug
    if k == "lctrl" then
        debug.debug()
    end

    if k == 'escape' then
       love.event.quit()
    elseif k == 'f' then
        push:switchFullscreen(WINDOW_WIDTH, WINDOW_HEIGHT)
    end

    world:keypressed(k)
 end

 function love.keyreleased(k)
    world:keyreleased(k)
 end

function love.update(dt)
    world:update(dt)
end

function love.draw()
    push:start()
  
    love.graphics.clear(119/255, 136/255, 153/255)

    world:render()    
    -- love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
    
    push:finish()
end