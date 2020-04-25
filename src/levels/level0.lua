local room = room:new({name = "room"})
local granyOriginalY = room.y + room.height - 30
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
        idle = { moveRight = { velocityX = 25 },
                    moveLeft = { velocityX = -25 },
                    moveUp = { velocityY = -25 },
                    moveDown = { velocityY = 25 }},
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

local level = {}
level.entities = {room, player, grandma}

level.triggers = {
    { 
        source = 2,
        conditions = { 
            function(entity) return entity.y > room.y + room.height - 30 end 
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