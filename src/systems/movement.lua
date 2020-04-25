return {
    move = function(entity, dt)
        if entity and entity.x and entity.y then
            entity.x = entity.x + (entity.velocityX or 0) * dt
            entity.y = entity.y + (entity.velocityY or 0) * dt
        end
    end
}