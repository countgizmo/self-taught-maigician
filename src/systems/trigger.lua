return {
    check = function(level)
        allIsTrue = function(results)
            for _, result in ipairs(results) do
                if result == false then return false end
            end

            return true
        end

        if level.triggers == nil then return {} end
        
        for _, trigger in ipairs(level.triggers) do
            local entity = level.entities[trigger.source]

            if entity then
                local results = {}

                for ind, condition in ipairs(trigger.conditions) do
                    results[ind] = condition(entity)
                end

                if allIsTrue(results) then
                    trigger.ontrigger()
                else
                    trigger.offtrigger()
                end
            end
        end
    end
}