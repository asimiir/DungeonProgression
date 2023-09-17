-- Chrono is working with command /dpstart and /dpstop
-- needs add Maraudon, Blackrock Depths, Blackrock Spire, Dire Maul to complete Classic

timeBeforeTimer = 3

soundFile = "Interface\\AddOns\\DungeonProgression\\Sounds\\FF7_Victory_Fanfare.mp3"
nBossTotal = 0;
mapID = 0;
nbDown = 0;
pourcentageAdd = 0.85
mobDeathsTrigger = 0;
nBossKilled = 0;
numMobsDied = 0
formattedPercentage = "";

startTime = nil
timerFrame = nil
elapsedSeconds = 0

nbBoss = 0;
eliteTotal = 0;
eliteTotalKilled = 0;
eliteInstance = {};

heraldSelectedChoice = ""
timerSelectedChoice = ""
mainWindowResizable = false
mainWindowMovable = true
mainWindowLocked = true

isClamped = true

--------------------------------------- TIMER



-- Define a function to toggle the visibility of the frame
local function ToggleDungeonProgressionFrame()
    if DungeonProgressionFrame:IsShown() then
        DungeonProgressionFrame:Hide()  -- Hide the frame if it's currently shown
    else
        DungeonProgressionFrame:Show()  -- Show the frame if it's currently hidden
    end
end
-- Define a function to toggle the visibility of the frame
local function ToggleDungeonProgressionOptionsFrame()
    if DungeonProgressionOptionsFrame:IsShown() then
        DungeonProgressionOptionsFrame:Hide()  -- Hide the frame if it's currently shown
    else
        DungeonProgressionOptionsFrame:Show()  -- Show the frame if it's currently hidden
    end
end

-- Create a function to toggle the "clamp_to_screen" setting
local function ToggleClampToScreen(self)
    local isChecked = self:GetChecked()
    -- Your code to handle the checkbox state change (saving settings, updating UI, etc.)
end


local function RaidWarningCountdown()
    local count = timeBeforeTimer

    local function AnnounceCountdown()
        if count > 0 then
            local channel = IsInRaid() and (UnitIsGroupLeader("player") and "RAID_WARNING" or "RAID") or (IsInGroup() and "PARTY") or nil
            local message = tostring(count)
            
            if timerSelectedChoice == "target" then
                SendChatMessage(message, "WHISPER", nil, targetPlayerName)
            elseif timerSelectedChoice == "party" then
                SendChatMessage(message, "PARTY", nil, targetPlayerName)
            elseif timerSelectedChoice == "raid" then
                if channel then
                    SendChatMessage(message, channel)
                end
            else
                print(message)
            end

            count = count - 1
            C_Timer.After(1, AnnounceCountdown)
        else
            local startMessage = IsInRaid() and (UnitIsGroupLeader("player") and "Start!" or "Start!") or (IsInGroup() and "Start!") or "Start!"
            local channel = IsInRaid() and (UnitIsGroupLeader("player") and "RAID_WARNING" or "RAID") or (IsInGroup() and "PARTY") or nil
            
            if timerSelectedChoice == "target" then
                SendChatMessage(startMessage, "WHISPER", nil, targetPlayerName)
            elseif timerSelectedChoice == "party" then
                SendChatMessage(startMessage, "PARTY", nil, targetPlayerName)
            elseif timerSelectedChoice == "raid" then
                if channel then
                    SendChatMessage(startMessage, channel)
                end
            else
                print(startMessage)
            end
            
            StartChronometer()
        end
    end

    AnnounceCountdown()
end


-- Your existing pull timer function
local function StartPullTimer()
    -- ... (other code for your pull timer)
    RaidWarningCountdown()  -- Call the countdown function here to start the countdown
end

local function GetBossFromInstanceByID(id)
	local bossNames = {}
    for i, boss in ipairs(dungeonEncountersArray) do
        if boss[6] == id then
			--nBossTotal = nBossTotal + 1;
            table.insert(bossNames, {name = boss[2], killed = false})
        end
    end
    return bossNames
end

local function GetEliteFromInstanceByName(name)
	local eliteTable = {}
    for i, elite in ipairs(dungeonEliteArray) do
        if elite[1] == name then
            table.insert(eliteTable, {name = elite[2], total = elite[3], amountKilled=0});
			eliteTotal = eliteTotal + elite[3];
        end
    end
	
	eliteTotal = math.floor(eliteTotal * pourcentageAdd)
	
    return eliteTable
end

local EnterInstanceframe = CreateFrame("FRAME")

EnterInstanceframe:RegisterEvent("PLAYER_ENTERING_WORLD")
EnterInstanceframe:RegisterEvent("ZONE_CHANGED_NEW_AREA")

EnterInstanceframe:SetScript("OnEvent", function(self, event, ...)
	local inInstance, instanceType = IsInInstance()
	
	if inInstance and instanceType == "party" then
		local instanceName = select(1,GetInstanceInfo(1));
		local instanceID = select(8,GetInstanceInfo(1));
		local bossInstance = GetBossFromInstanceByID(instanceID);
		eliteInstance = GetEliteFromInstanceByName(instanceName);

		for i = 1, #dungeons do
			if dungeons[i][3] == instanceID then
				nBossTotal = dungeons[i][4];
				break
			end
		end

		for i, boss in ipairs(bossInstance) do
		nbBoss = nbBoss + 1;
		end
		-- Load the addon
		UpdateDungeonProgressionText();
		
		ToggleDungeonProgressionFrame()
		--DungeonProgressionFrame:Show()
		local mobCalculationframe = CreateFrame("FRAME")
		mobCalculationframe:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

		mobCalculationframe:SetScript("OnEvent", function(self, event, ...)
			local _, eventType, _, _, _, _, _, _, destName = CombatLogGetCurrentEventInfo()
				UpdateDungeonProgressionText();

				if eventType == "UNIT_DIED" and UnitIsPlayer(destName) ~= true then
					--print ("destName==>", destName);

					-- check the number of elite that are killed
					for i, elite in ipairs(eliteInstance) do
						if elite.name == destName then
							eliteTotalKilled = eliteTotalKilled + 1;
							elite.amountKilled = elite.amountKilled + 1;

							formattedPercentage = string.format("%.2f%%", (eliteTotalKilled / eliteTotal * 100));
							if eliteTotalKilled >= eliteTotal then
								formattedPercentage = string.format("%.2f%%", (eliteTotal / eliteTotal * 100));
							end
						end
					end

					for i, boss in ipairs(bossInstance) do
						-- if it is a boss in the instance
						if boss.name == destName and boss.killed==false then
							boss.killed=true;

							nBossKilled = 0;

							-- Check if all the bosses are dead. Write a message if they are all dead
							for i, boss in ipairs(bossInstance) do
								if boss.killed==true then
									nBossKilled = nBossKilled + 1;
									nbDown = nBossKilled;

									if nBossKilled == nBossTotal then 
										StopChronometer();
										print("FINISH");
										PlaySoundFile(soundFile, "Master")
										dpReset();
										break;
									end
								end
							end
						end;
					end
				end
			end
		)

	else
		-- Unload the addon
		DungeonProgressionFrame:Hide()
		EnterInstanceframe:UnregisterEvent("ZONE_CHANGED_NEW_AREA");
	end
end)



------------------------------------------ Box Display

local DungeonProgressionFrame = CreateFrame("Frame", "DungeonProgressionFrame", UIParent, "BasicFrameTemplate")

-- Make the frame movable
DungeonProgressionFrame:SetMovable(mainWindowMovable)
DungeonProgressionFrame:EnableMouse(true)
DungeonProgressionFrame:RegisterForDrag("LeftButton")
DungeonProgressionFrame:SetScript("OnDragStart", DungeonProgressionFrame.StartMoving)
DungeonProgressionFrame:SetScript("OnDragStop", DungeonProgressionFrame.StopMovingOrSizing)

-- Set the position and size of the frame
DungeonProgressionFrame:SetPoint("RIGHT", UIParent, "RIGHT", -50, 0)
DungeonProgressionFrame:SetSize(310, 200)

-- Set the minimum and maximum dimensions for the frame
DungeonProgressionFrame:SetResizeBounds (310, 175, 600, 400)

-- Hide the frame initially
--DungeonProgressionFrame:Hide()
ToggleDungeonProgressionFrame()
DungeonProgressionFrame:SetClampedToScreen(isClamped)

-- Create a reset button with an image
local resetButton = CreateFrame("Frame", "DungeonProgressionResetButton", DungeonProgressionFrame)
resetButton:SetPoint("TOPRIGHT", DungeonProgressionFrame, "TOPRIGHT", -60, -30)
resetButton:SetSize(30, 30)

-- Set the texture as the background of the frame
resetButton.texture = resetButton:CreateTexture(nil, "BACKGROUND")
resetButton.texture:SetAllPoints(true)
resetButton.texture:SetTexture("Interface\\AddOns\\DungeonProgression\\images\\reset.png") -- Replace with your desired texture

-- Register for mouse events
resetButton:SetScript("OnEnter", function(self)
    self.texture:SetVertexColor(1, 1, 1, 0.7) -- Dim the texture on mouseover
end)
resetButton:SetScript("OnLeave", function(self)
    self.texture:SetVertexColor(1, 1, 1, 1) -- Restore the texture's original color
end)
resetButton:SetScript("OnMouseDown", function(self, button)
    self.texture:SetVertexColor(0.7, 0.7, 0.7, 1) -- Darken the texture on mouse click
end)
resetButton:SetScript("OnMouseUp", function(self, button)
    self.texture:SetVertexColor(1, 1, 1, 0.7) -- Restore the texture's color after mouse click
    if button == "LeftButton" then
        -- Show a confirmation dialog before performing the reset
        StaticPopup_Show("RESET_CONFIRMATION")
    end
end)

-- Create a confirmation dialog (same as before)
StaticPopupDialogs["RESET_CONFIRMATION"] = {
    text = "Are you sure you want to reset?",
    button1 = "Yes",
    button2 = "No",
    OnAccept = function()
        -- Perform the reset here
        print("Reset confirmed and performed")
		resetAll()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
}

--------------------------------------option frame
local DungeonProgressionOptionsFrame = CreateFrame("Frame", "DungeonProgressionOptionsFrame", UIParent, "BasicFrameTemplate")

-- Make the frame movable
DungeonProgressionOptionsFrame:SetMovable(true)
DungeonProgressionOptionsFrame:EnableMouse(true)
DungeonProgressionOptionsFrame:RegisterForDrag("LeftButton")
DungeonProgressionOptionsFrame:SetScript("OnDragStart", DungeonProgressionOptionsFrame.StartMoving)
DungeonProgressionOptionsFrame:SetScript("OnDragStop", DungeonProgressionOptionsFrame.StopMovingOrSizing)

-- Set the position and size of the frame
DungeonProgressionOptionsFrame:SetPoint("RIGHT", DungeonProgressionFrame, "RIGHT", -50, 0)
DungeonProgressionOptionsFrame:SetSize(300, 250)

-- Hide the frame initially
--DungeonProgressionFrame:Hide()
ToggleDungeonProgressionOptionsFrame()
DungeonProgressionOptionsFrame:SetClampedToScreen(isClamped)


-- Create a dropdown menu
local heraldWhisper = CreateFrame("Frame", "DungeonProgressionOptionsDropdown", DungeonProgressionOptionsFrame, "UIDropDownMenuTemplate")
heraldWhisper:SetPoint("TOPLEFT", 20, -50)
UIDropDownMenu_SetWidth(heraldWhisper, 150)

-- Create a text label for the dropdown
local heraldWhisperLabel = DungeonProgressionOptionsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
heraldWhisperLabel:SetPoint("BOTTOMLEFT", heraldWhisper, "TOPLEFT", 0, 5)
heraldWhisperLabel:SetText("Send herald info to:")

-- List of choices for the dropdown
local heraldChoices = {"self", "target", "party", "raid"}

-- Function to handle dropdown menu selections
local function HeraldDropdown_OnClick(self)
    UIDropDownMenu_SetSelectedValue(heraldWhisper, self.value)
    -- Add your code here to handle the selected option
    local selectedValue = UIDropDownMenu_GetSelectedValue(heraldWhisper)
	
	heraldSelectedChoice = selectedValue
end

-- Initialize the dropdown
UIDropDownMenu_Initialize(heraldWhisper, function(self, level, menuList)
    for _, choice in ipairs(heraldChoices) do
        local info = UIDropDownMenu_CreateInfo()
        info.text = choice
        info.value = choice
        info.func = HeraldDropdown_OnClick
        UIDropDownMenu_AddButton(info)
    end
end)

-- Create a dropdown menu
local timerWhisper = CreateFrame("Frame", "DungeonProgressionOptionsDropdown", DungeonProgressionOptionsFrame, "UIDropDownMenuTemplate")
timerWhisper:SetPoint("TOPLEFT", 20, -110)
UIDropDownMenu_SetWidth(timerWhisper, 150)

-- Create a text label for the dropdown
local timerWhisperLabel = DungeonProgressionOptionsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
timerWhisperLabel:SetPoint("BOTTOMLEFT", timerWhisper, "TOPLEFT", 0, 5)
timerWhisperLabel:SetText("Send timer info to:")

local timerChoices = {"self", "party", "instance", "raid"}

-- Function to handle dropdown menu selections
local function TimerDropdown_OnClick(self)
    UIDropDownMenu_SetSelectedValue(timerWhisper, self.value)
    -- Add your code here to handle the selected option
    local selectedValue = UIDropDownMenu_GetSelectedValue(timerWhisper)
    
    timerSelectedChoice = selectedValue
end

-- Initialize the dropdown
UIDropDownMenu_Initialize(timerWhisper, function(self, level, menuList)
    for _, choice in ipairs(timerChoices) do
        local info = UIDropDownMenu_CreateInfo()
        info.text = choice
        info.value = choice
        info.func = TimerDropdown_OnClick
        UIDropDownMenu_AddButton(info)
    end
end)

-- Set the default selected value
UIDropDownMenu_SetSelectedValue(timerWhisper, timerChoices[1])
timerSelectedChoice = timerChoices[1]

-- Add the dropdown to DungeonProgressionFrame
DungeonProgressionFrame.DungeonProgressionOptionsDropdown = timerWhisper


-- Set the default selected value
UIDropDownMenu_SetSelectedValue(heraldWhisper, heraldChoices[1])
heraldSelectedChoice = heraldChoices[1]

-- Add the dropdown to DungeonProgressionFrame
DungeonProgressionFrame.DungeonProgressionOptionsDropdown = heraldWhisper

local function ToggleClampToScreen(self)
    local isClamped = self:GetChecked()
    
	DungeonProgressionFrame:SetClampedToScreen( isClamped )
	DungeonProgressionOptionsFrame:SetClampedToScreen(isClamped)
end

-- Create the checkbox
local clampToScreenCheckbox = CreateFrame("CheckButton", "DungeonProgressionOptionsCheckbox", DungeonProgressionOptionsFrame, "BackdropTemplate")
clampToScreenCheckbox:SetSize(24, 24)  -- Adjust the size as needed
clampToScreenCheckbox:SetPoint("TOPLEFT", 20, -150)  -- Adjust the position as needed
clampToScreenCheckbox:SetChecked(true)
clampToScreenCheckbox:SetScript("OnClick", ToggleClampToScreen)

-- Create the checkbox's texture for different states
clampToScreenCheckbox:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
clampToScreenCheckbox:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
clampToScreenCheckbox:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
clampToScreenCheckbox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")

-- Create the text label for the checkbox
local clampToScreenLabel = DungeonProgressionOptionsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
clampToScreenLabel:SetPoint("LEFT", clampToScreenCheckbox, "RIGHT", 5, 0)
clampToScreenLabel:SetText("Clamp To Screen")
clampToScreenCheckbox:SetScript("OnClick", ToggleClampToScreen)

-- Add the checkbox and label to DungeonProgressionOptionsFrame
DungeonProgressionOptionsFrame.clampToScreenCheckbox = clampToScreenCheckbox
DungeonProgressionOptionsFrame.clampToScreenLabel = clampToScreenLabel

--- resizeButton
local function ToggleMainWindowResizable(self)
    local isResizable = self:GetChecked()
    
    DungeonProgressionFrame:SetResizable(isResizable)
    -- Add any additional logic related to resizing here
    mainWindowResizable = isResizable;
	if isResizable then
		DungeonProgressionFrame:SetResizable(isResizable)
		DungeonProgressionFrame:SetMovable(false);
	else
		DungeonProgressionFrame:SetResizable(isResizable)
		DungeonProgressionFrame:SetMovable(true);
	end
    -- Update the checkbox's state to reflect resizable status
    self:SetChecked(isResizable)
end

-- Set up the resizing handles
DungeonProgressionFrame:SetScript("OnSizeChanged", ResizeFrame)
DungeonProgressionFrame:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" and mainWindowResizable then
        self:StartSizing("BOTTOMRIGHT")
    end
end)
DungeonProgressionFrame:SetScript("OnMouseUp", function(self)
	local width = DungeonProgressionFrame:GetWidth()
    local height = DungeonProgressionFrame:GetHeight()
    --print(width, height)
    self:StopMovingOrSizing()
end)

-- Create the checkbox
local mainWindowResizableCheckbox = CreateFrame("CheckButton", "DungeonProgressionOptionsCheckbox", DungeonProgressionOptionsFrame, "BackdropTemplate")
mainWindowResizableCheckbox:SetSize(24, 24)  -- Adjust the size as needed
mainWindowResizableCheckbox:SetPoint("TOPLEFT", 20, -180)  -- Adjust the position as needed
mainWindowResizableCheckbox:SetChecked(mainWindowResizable)
mainWindowResizableCheckbox:SetScript("OnClick", ToggleMainWindowResizable)

-- Create the checkbox's texture for different states
mainWindowResizableCheckbox:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
mainWindowResizableCheckbox:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
mainWindowResizableCheckbox:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
mainWindowResizableCheckbox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")

-- Create the text label for the checkbox
local mainWindowResizableLabel = DungeonProgressionOptionsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
mainWindowResizableLabel:SetPoint("LEFT", mainWindowResizableCheckbox, "RIGHT", 5, 0)
mainWindowResizableLabel:SetText("Resizable Main Window")
mainWindowResizableCheckbox:SetScript("OnClick", ToggleMainWindowResizable)

-- Add the checkbox and label to DungeonProgressionOptionsFrame
DungeonProgressionOptionsFrame.mainWindowResizableCheckbox = mainWindowResizableCheckbox
DungeonProgressionOptionsFrame.mainWindowResizableLabel = mainWindowResizableLabel

------- Locked button
local function ToggleMainWindowLocked(self)
    local isLocked = self:GetChecked()
    
    DungeonProgressionFrame:SetMovable(not isLocked)
    -- Add any additional logic related to locking here
	
	mainWindowLocked = isLocked
	
	DungeonProgressionFrame:EnableMouse(not mainWindowLocked)
	--print("mainWindowLocked==>"..tostring(mainWindowLocked))
	-- Disable mainWindowResizableCheckbox if mainWindowLocked is true
	if mainWindowLocked then 
		DungeonProgressionOptionsFrame.mainWindowResizableCheckbox:Disable()
		--print("color==>"..DungeonProgressionOptionsFrame.mainWindowResizableLabel:GetTextColor())
		DungeonProgressionOptionsFrame.mainWindowResizableLabel:SetTextColor(0.5, 0.5, 0.5, 1)  -- Set gray color
		--DungeonProgressionOptionsFrame.mainWindowResizableCheckbox:SetBackdropColor(0.5, 0.5, 0.5, 1)  -- Set gray color
		mainWindowResizable = false
		mainWindowMovable = false
	else
        DungeonProgressionOptionsFrame.mainWindowResizableCheckbox:Enable()
		DungeonProgressionOptionsFrame.mainWindowResizableLabel:SetTextColor(1, 0.82, 0, 1) -- RGB values for #FFD100  -- Restore original color
        --DungeonProgressionOptionsFrame.mainWindowResizableCheckbox:SetBackdropColor(1, 1, 1, 1)  -- Restore original color
		mainWindowMovable = true
	end
	    
    -- Update the checkbox's state to reflect locked status
    self:SetChecked(isLocked)
end

-- Create the checkbox for locking the main window
local mainWindowLockedCheckbox = CreateFrame("CheckButton", "DungeonProgressionOptionsCheckbox", DungeonProgressionOptionsFrame, "BackdropTemplate")
mainWindowLockedCheckbox:SetSize(24, 24)  -- Adjust the size as needed
mainWindowLockedCheckbox:SetPoint("TOPLEFT", 20, -210)  -- Adjust the position as needed
mainWindowLockedCheckbox:SetChecked(false)  -- You can set the default state here
mainWindowLockedCheckbox:SetScript("OnClick", ToggleMainWindowLocked)

-- Create the checkbox's texture for different states
mainWindowLockedCheckbox:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
mainWindowLockedCheckbox:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
mainWindowLockedCheckbox:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
mainWindowLockedCheckbox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")

-- Create the text label for the checkbox
local mainWindowLockedLabel = DungeonProgressionOptionsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
mainWindowLockedLabel:SetPoint("LEFT", mainWindowLockedCheckbox, "RIGHT", 5, 0)
mainWindowLockedLabel:SetText("Lock Main Window")
mainWindowLockedCheckbox:SetScript("OnClick", ToggleMainWindowLocked)

-- Add the checkbox and label to DungeonProgressionOptionsFrame
DungeonProgressionOptionsFrame.mainWindowLockedCheckbox = mainWindowLockedCheckbox
DungeonProgressionOptionsFrame.mainWindowLockedLabel = mainWindowLockedLabel

--------------------------------------option frame


-- Create the "Herald" button
local HeraldButton = CreateFrame("Button", "DungeonProgressionHeraldButton", DungeonProgressionFrame, "UIPanelButtonTemplate")
HeraldButton:SetPoint("BOTTOMLEFT", DungeonProgressionFrame, "BOTTOMLEFT", 10, 10)
HeraldButton:SetSize(90, 30)
HeraldButton:SetText("Herald")

-- Create the "Start Timer" button
local StartTimerButton = CreateFrame("Button", "DungeonProgressionStartTimerButton", DungeonProgressionFrame, "UIPanelButtonTemplate")
StartTimerButton:SetPoint("BOTTOM", DungeonProgressionFrame, "BOTTOM", 0, 10)
StartTimerButton:SetSize(90, 30)
StartTimerButton:SetText("Start Timer")

-- Create the "Stop Timer" button
local StopTimerButton = CreateFrame("Button", "DungeonProgressionStopTimerButton", DungeonProgressionFrame, "UIPanelButtonTemplate")
StopTimerButton:SetPoint("BOTTOMRIGHT", DungeonProgressionFrame, "BOTTOMRIGHT", -10, 10)
StopTimerButton:SetSize(90, 30)
StopTimerButton:SetText("Stop Timer")

local OptionsButton = CreateFrame("Button", "DungeonProgressionGearButton", DungeonProgressionFrame)
OptionsButton:SetPoint("TOPRIGHT", DungeonProgressionFrame, "TOPRIGHT", -10, -30)
OptionsButton:SetSize(30, 30)

local normalTexture = OptionsButton:CreateTexture(nil, "ARTWORK")
normalTexture:SetTexture("Interface\\AddOns\\DungeonProgression\\images\\options.png")
normalTexture:SetAllPoints(OptionsButton)
OptionsButton:SetNormalTexture(normalTexture)

OptionsButton:SetScript("OnEnter", function(self)
    self:GetNormalTexture():SetVertexColor(0.7, 0.7, 0.7, 1)
end)
OptionsButton:SetScript("OnLeave", function(self)
    self:GetNormalTexture():SetVertexColor(1, 1, 1, 1)
end)
OptionsButton:SetScript("OnMouseDown", function(self, button)
    self:GetNormalTexture():SetVertexColor(0.5, 0.5, 0.5, 1)
end)
OptionsButton:SetScript("OnMouseUp", function(self, button)
    self:GetNormalTexture():SetVertexColor(0.7, 0.7, 0.7, 1)
    if button == "LeftButton" then
        -- Show a confirmation dialog before performing an action
        StaticPopup_Show("OPTIONS_CONFIRMATION")
    end
end)

local DungeonProgressionTitle = DungeonProgressionFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
DungeonProgressionTitle:SetPoint("TOP", DungeonProgressionFrame, "TOP", 0, -5)
DungeonProgressionTitle:SetText("Dungeon Progression")

local DungeonProgressionOptionsTitle = DungeonProgressionOptionsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
DungeonProgressionOptionsTitle:SetPoint("TOP", DungeonProgressionOptionsFrame, "TOP", 0, -5)
DungeonProgressionOptionsTitle:SetText("Options")

DungeonProgressionText = DungeonProgressionFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
DungeonProgressionText:SetPoint("TOPLEFT", DungeonProgressionFrame, "TOPLEFT", 10, -40)
DungeonProgressionText:SetPoint("BOTTOMRIGHT", DungeonProgressionFrame, "BOTTOMRIGHT", -10, 40)
DungeonProgressionText:SetJustifyH("LEFT")
DungeonProgressionText:SetJustifyV("TOP")
--DungeonProgressionText:SetText("Instance name : "..select(1,GetInstanceInfo(1)).."\n\nBoss down : "..nbDown.." out of "..nBossTotal.."\n\nMob count : ")

function dpshow()
	UpdateDungeonProgressionText()
	ToggleDungeonProgressionFrame()
end

local function ScanCharacterSheet()
    -- Get the name of the target player
    local targetPlayerName = UnitName("target")
    if not targetPlayerName then
        print("No target selected.")
        return
    end

    local gearOK = true

    -- Loop through each equipment slot
    for slotID = 1, 19 do
        local itemLink = GetInventoryItemLink("target", slotID)
        if itemLink then
            local effectiveItemLevel, _, _ = GetDetailedItemLevelInfo(itemLink)
            local expac = select(15, GetItemInfo(itemLink))

            -- Check if item level and expansion requirements are met
            local ilvlGood = effectiveItemLevel and effectiveItemLevel <= 107
            local expacGood = not (expac and expac > 2)

            if not (ilvlGood and expacGood) then
                gearOK = false
                local reason = "reason: "
                if not ilvlGood then
                    reason = reason .. "ilvl "
                end
                if not expacGood then
                    reason = reason .. " expac"
                end

                local whisperMessage = targetPlayerName .. " ==> " .. itemLink .. " (" .. reason .. ")"
                local channel = (heraldSelectedChoice == "target" and "WHISPER" or
                                 heraldSelectedChoice == "party" and "PARTY" or
                                 heraldSelectedChoice == "raid" and "RAID") or nil

                -- Send the message to the appropriate channel
                if channel then
                    SendChatMessage(whisperMessage, channel, nil, targetPlayerName)
                else
                    print(whisperMessage)
                end
            end
        end
    end

    -- Check if gear is overall acceptable
    if gearOK then
        local message = "Gear OK"
        local channel = (heraldSelectedChoice == "target" and "WHISPER" or
                         heraldSelectedChoice == "party" and "PARTY" or
                         heraldSelectedChoice == "raid" and "RAID") or nil

        -- Send the message to the appropriate channel
        if channel then
            SendChatMessage(message, channel, nil, targetPlayerName)
        else
            print(message)
        end
    end
end
------------------------------------------------------------------------------
-- Define the function to be executed when the slash command is used
function dpTestFunction()
	local val = 0;
    for _, elite in ipairs(eliteInstance) do
		val = val + elite.amountKilled;
        print(elite.name, elite.amountKilled);
    end
    print("Total elite killed: " .. val .. " out of " .. eliteTotal);
end

-- Define the slash command
SLASH_DPTEST1 = "/dptest"
SlashCmdList["DPTEST"] = function()
	dpTestFunction();
end

local function dpHerald()
    ScanCharacterSheet();
end

------------------------------------------------------------------------------

text = ""
theTimeElapsed = "00:00"

function UpdateDungeonProgressionText()
    local instanceName, _, _, _, _, _, _, instanceID = GetInstanceInfo()
	
	-- Calculate the mob count percentage
    text = formattedPercentage ~= "" and formattedPercentage or "0%"
	
    DungeonProgressionText:SetText("Instance name: " .. instanceName .. "\n\nBoss down: " .. nbDown .. " out of " .. nBossTotal .. "\n\n Mob Count : " .. text  .. "\n\n Timer : " .. theTimeElapsed )
end

-- Define a table to store the mob deaths
local mobDeaths = {}
local mobDeathsTrigger = 0

-- Define the event handler function
local function OnCombatLogEvent(self, event, ...)
  -- Extract data from the combat log
  local _, subEvent, _, _, _, _, _, destGUID = CombatLogGetCurrentEventInfo()
  
  -- Check if a non-player unit has died
  if subEvent == "UNIT_DIED" and not mobDeaths[destGUID] and not UnitIsPlayer(destGUID) then
    -- Update the mobDeaths table to indicate that the mob has died
    mobDeaths[destGUID] = true
    mobDeathsTrigger = mobDeathsTrigger + 1

    -- Perform other actions here
    UpdateDungeonProgressionText()
  end
end

function resetAll()
	nbDown = 0
	eliteTotalKilled = 0;
	formattedPercentage = "0%"
	
	local val = 0;
	for _, elite in ipairs(eliteInstance) do
		elite.amountKilled = 0;
		val = val + elite.amountKilled;
    end
	
	if timerFrame then
		StopChronometer()
	end
	
	text = ""
	theTimeElapsed = "00:00"
	UpdateDungeonProgressionText()
end

-------------------------------------------------------------------------------------------
-- Define the function to be executed when the slash command is used
function dpReset()
    resetAll()
	UpdateDungeonProgressionText()
end

-- Function to be executed when the "Herald" button is clicked
HeraldButton:SetScript("OnClick", function(self, button, down)
	ScanCharacterSheet()
end)

-- Function to be executed when the "Start Timer" button is clicked
StartTimerButton:SetScript("OnClick", function(self)
    -- Disable the button and modify appearance
    self:Disable()
    self:SetNormalFontObject("GameFontDisable")
    self:SetHighlightFontObject("GameFontDisable")
    self:SetDisabledFontObject("GameFontDisable")
    
    -- Disable and modify appearance of the "Stop Timer" button
    StopTimerButton:Disable()
    StopTimerButton:SetNormalFontObject("GameFontDisable")
    StopTimerButton:SetHighlightFontObject("GameFontDisable")
    StopTimerButton:SetDisabledFontObject("GameFontDisable")
    
    -- Delayed re-enable and appearance restore for "Stop Timer" button
    C_Timer.After(timeBeforeTimer, function()
        StopTimerButton:Enable()
        StopTimerButton:SetNormalFontObject("GameFontNormal")
        StopTimerButton:SetHighlightFontObject("GameFontHighlight")
        StopTimerButton:SetDisabledFontObject("GameFontDisable")
    end)
    
    -- Start the pull timer
    StartPullTimer()
end)

-- Function to be executed when the "Stop Timer" button is clicked
StopTimerButton:SetScript("OnClick", function(self, button, down)
	-- Change the button color
    self:SetNormalFontObject("GameFontDisable")
    self:SetHighlightFontObject("GameFontDisable")
    self:SetDisabledFontObject("GameFontDisable")
    
    -- Disable the button
    self:Disable()
	
	-- Revert the appearance of the button
	StartTimerButton:SetNormalFontObject("GameFontNormal")
	StartTimerButton:SetHighlightFontObject("GameFontHighlight")
	StartTimerButton:SetDisabledFontObject("GameFontDisable")

	-- Enable the button
	StartTimerButton:Enable()
	StopChronometer()
end)

-- Function to be executed when the "Options" button is clicked
OptionsButton:SetScript("OnClick", function(self, button, down)
    -- Add your code here to open the options menu
	ToggleDungeonProgressionOptionsFrame()
end)