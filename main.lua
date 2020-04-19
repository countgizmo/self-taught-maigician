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

    local room1 = room:new({name = "room"})
    local grandma = character:new({
        x = room.x + room.width - 30,
        y = room.y + room.height - 30,
        stateStack = {'idle'},
        name = "Granny",
        spriteRow = 1})
    
    local player = character:new({
        x = room.x + 5,
        y = room.y + 5,
        stateStack = {'idle'},
        stateTransitions = {
            idle = { moveRight = { velocityX = 15 },
                     moveLeft = { velocityX = -15 },
                     moveUp = { velocityY = -15 },
                     moveDown = { velocityY = 15 }},
            moveRight = { idle = { velocityX = 0 }},
            moveLeft = { idle = { velocityX = 0 }},
            moveUp = { idle = {velocityY = 0 }},
            moveDown = { idle = {velocityY = 0 }}
        },
        name = "Boy",
        spriteRow = 2,
        inputs = { 
            keyPress = { right = 'moveRight', left = 'moveLeft', up = 'moveUp', down = 'moveDown'},
            keyRelease = { right = 'idle', left = 'idle', up ='idle', down = 'idle'}
        },
        animation = {
            interval = 0.2,
            states = {
                idle = { frames = { 1 } },
                moveRight = { frames = { 2 } },
                moveLeft = { frames = { 2 }, isFlipped = true}
            }
        }
    })


    world.entities = {room1, player, grandma}
end

function love.keypressed(k)
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
    movement.move(world.entities, dt)
    world:update(dt)
end

function love.draw()
    push:start()
  
    love.graphics.clear(119/255, 136/255, 153/255)

    rendering.renderall(world.entities)
    
    -- love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)

    push:finish()
end