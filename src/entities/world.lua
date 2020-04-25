local world = {
    level = {
        entities = {}
    }
}

function world:update(dt)
    for _, entity in pairs(self.level.entities) do
        animation.update(entity, dt)
        movement.move(entity, dt)
    end

    trigger.check(self.level)
end

function world:keypressed(k)
    for _, entity in pairs(self.level.entities) do
        input.keypressed(entity, k)
    end
end

function world:keyreleased(k)
    for _, entity in pairs(self.level.entities) do
        input.keyreleased(entity, k)
    end
end

function world:render()
    for _, entity in pairs(self.level.entities) do
        rendering.render(entity)
    end
end

return world