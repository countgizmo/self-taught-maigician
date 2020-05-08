local room = room:new({name = "room"})

local grandma = character:new({
    x = room.x + room.width - 40,
    y = room.y + room.height - 40,
    stateStack = {'idle'},
    name = "Granny",
    width = 16,
    height = 20,
    spriteRow = 1,
    spriteSheet = love.graphics.newImage('resources/img/grandma-sprite.png'),
})
    
local player = character:new({
    x = room.x + 5,
    y = room.y + 5,
    stateStack = {'idle'},
    states = {
        idle = {
            velocityX = 0,
            velocityY = 0
        },
        moveRight = {
            velocityX = 25,
            velocityY = 0
        },
        moveLeft = {
            velocityX = -25,
            velocityY = 0
        },
        moveDown = {
            velocityX = 0,
            velocityY = 25
        },
        moveUp = {
            velocityX = 0,
            velocityY = -25
        }
    },
    name = "Boy",
    spriteSheet = love.graphics.newImage('resources/img/boy-sprite.png'),
    spriteRow = 1,
    inputs = { 
        keyPress = { right = 'moveRight', left = 'moveLeft', up = 'moveUp', down = 'moveDown'}    
    },
    animation = {
        interval = 0.2,
        states = {
            idle = { frames = { 1 } },
            moveRight = { frames = { 9, 10, 11, 12 } },
            moveLeft = { frames = { 13, 14, 15, 16 } },
            moveDown = { frames = { 2, 3, 4, 1 }},
            moveUp = { frames = { 6, 7, 8, 5 }}
        }
    }
})

local level = {}
level.entities = {room, player, grandma}

level.triggers = {
    { 
        source = 2,
        conditions = { 
            function(entity) return entity.y > grandma.y end 
        },
        ontrigger = function()
            level.entities[3].speech = "Hello!"
        end,
        offtrigger = function()
            level.entities[3].speech = nil
        end
    }
}

return level