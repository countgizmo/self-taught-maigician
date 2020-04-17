local world = {
    entities = {}
}

function world:keypressed(k)
    for _, entity in pairs(self.entities) do
        input.keypressed(entity, k)
    end
end

function world:keyreleased(k)
    for _, entity in pairs(self.entities) do
        input.keyreleased(entity, k)
    end
end

return world