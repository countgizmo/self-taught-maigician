local world = {
    entities = {}
}

function world:update(dt)
    for _, entity in ipairs(self.entities) do
        animation.update(entity, dt)
    end
end

function world:keypressed(k)
    for _, entity in ipairs(self.entities) do
        input.keypressed(entity, k)
    end
end

function world:keyreleased(k)
    for _, entity in ipairs(self.entities) do
        input.keyreleased(entity, k)
    end
end

return world