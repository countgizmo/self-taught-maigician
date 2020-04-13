-- Configuration
love.graphics.setDefaultFilter('nearest', 'nearest')
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 320
VIRTUAL_HEIGHT = 180

-- Dependencies
require('deps')

function love.load()
    love.window.setTitle('Self-taught Magician')
  
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        vsync = true,
        fullscreen = false,
        resizable = false
    })
end

function love.draw()
    push:start()
  

    love.graphics.clear(119/255, 136/255, 153/255)
  

    -- love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
  
    push:finish()
  end