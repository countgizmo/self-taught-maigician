return {
    move = function(entities, dt)
        for _, entity in ipairs(entities) do
            if entity.x and entity.y then
                entity.x = entity.x + (entity.velocityX or 0) * dt
                entity.y = entity.y + (entity.velocityY or 0) * dt
            end
        end
    end
}