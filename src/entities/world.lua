local world = {
    entities = {}
}

function world:render()
    for k,v in pairs(self.entities) do
        if v.render then
            v:render()
        end
    end
end

return world