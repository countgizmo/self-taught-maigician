local world = {
    entities = {}
}

function world:keypressed(k)
    for _, entity in pairs(self.entities) do
        if entity.input and entity.input.keypressed then
            entity.input.keypressed(entity, k)
        end
    end
end

function world:keyreleased(k)
    for _, entity in pairs(self.entities) do
        if entity.input and entity.input.keyreleased then
            entity.input.keyreleased(entity, k)
        end
    end
end


function world:render()
    for k,v in pairs(self.entities) do
        if v.render then
            v:render()
        end
    end
end

return world