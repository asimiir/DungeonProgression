function StartChronometer()
    startTime = GetTime()
    elapsedSeconds = 0
    
    timerFrame = CreateFrame("Frame")
    local updateInterval = 1
    local timeSinceLastUpdate = 0
    
    timerFrame:SetScript("OnUpdate", function(self, elapsed)
        timeSinceLastUpdate = timeSinceLastUpdate + elapsed
        if timeSinceLastUpdate >= updateInterval then
            timeSinceLastUpdate = timeSinceLastUpdate - updateInterval
            elapsedSeconds = elapsedSeconds + updateInterval
            local minutes = math.floor(elapsedSeconds / 60)
            local seconds = math.floor(elapsedSeconds % 60)
            theTimeElapsed = string.format("%02d:%02d", minutes, seconds)
            UpdateDungeonProgressionText()
        end
    end)
end

function StopChronometer()
     if not timerFrame then
        print("Chronometer is not running!")
        return
    end
    
    timerFrame:SetScript("OnUpdate", nil)
    timerFrame = nil
    
    local elapsedTime = (GetTime() - startTime + elapsedSeconds) / 2
    local minutes = math.floor(elapsedTime / 60)
    local seconds = math.floor(elapsedTime % 60)
    local milliseconds = math.floor((elapsedTime - math.floor(elapsedTime)) * 100)
    
    local message = string.format("Elapsed time: %02d:%02d.%02d", minutes, seconds, milliseconds)
    
    if timerSelectedChoice == "target" or timerSelectedChoice == "party" or timerSelectedChoice == "raid" then
        SendChatMessage(message, timerSelectedChoice:upper(), nil, targetPlayerName)
    else
        print(message)
    end
    
    startTime = nil
end