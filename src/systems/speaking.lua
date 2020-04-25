return {
    speak = function(entity)
        if entity and entity.speech then
            local x = entity.x - string.len(entity.speech)
            local y = entity.y - 10 -- todo, height based on the number of lines in text

            love.graphics.setColor(255,255,255,255)
            love.graphics.rectangle("fill", x-5, y-15, 40, 15, 5, 5, 10)
            love.graphics.setColor(0,0,0,255)
            love.graphics.setFont(gSmallFont)
            love.graphics.printf(entity.speech, x, y-12, 80)
            love.graphics.setColor(255,255,255,255)
        end
    end
}