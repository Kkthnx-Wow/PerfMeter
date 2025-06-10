-- PerfMeter Addon - Performance Optimized
local addonName = "PerfMeter"
local PerfMeter = {}
local L = PerfMeterLocale

-- Performance constants
local UPDATE_INTERVAL = 1 -- Update every 1 second
local MS_THRESHOLDS = {
	GOOD = 100, -- Green
	MEDIUM = 200, -- Yellow (above this is red)
}

-- Cache frequently used values
local math_floor = math.floor
local math_max = math.max
local string_format = string.format

-- Pre-allocated tables to avoid garbage collection
local colorCache = {}
local textCache = {}

-- Create the display frame
local frame = CreateFrame("Frame", "PerfMeterFrame", UIParent, "BackdropTemplate")
frame:SetSize(100, 30)
frame:SetMovable(true)
frame:SetClampedToScreen(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")

-- Create the text display
local text = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
text:SetPoint("CENTER")

-- Get the player's class color (cached)
local classColor
do
	local _, class = UnitClass("player")
	classColor = RAID_CLASS_COLORS[class] or { r = 1, g = 1, b = 1 }
end

-- Optimized color conversion function
local function RGBToHex(r, g, b)
	local key = string_format("%.2f_%.2f_%.2f", r, g, b)
	if not colorCache[key] then
		colorCache[key] = string_format("%02x%02x%02x", r * 255, g * 255, b * 255)
	end
	return colorCache[key]
end

-- Function to get color for MS based on thresholds
local function GetMSColor(ms)
	if ms < MS_THRESHOLDS.GOOD then
		return 0, 1, 0 -- Green
	elseif ms <= MS_THRESHOLDS.MEDIUM then
		return 1, 1, 0 -- Yellow
	else
		return 1, 0, 0 -- Red
	end
end

-- Optimized backdrop update function
function PerfMeter:UpdateFrameBackdrop()
	local config = PerfMeterConfig
	local backdrop = nil

	if config.showBackground or config.showBorder then
		backdrop = {
			bgFile = config.showBackground and "Interface\\Tooltips\\UI-Tooltip-Background" or nil,
			edgeFile = config.showBorder and "Interface\\Tooltips\\UI-Tooltip-Border" or nil,
			tile = config.showBackground,
			tileSize = 16,
			edgeSize = config.showBorder and 16 or 0,
			insets = { left = 4, right = 4, top = 4, bottom = 4 },
		}
	end

	frame:SetBackdrop(backdrop)

	if config.showBackground then
		frame:SetBackdropColor(0, 0, 0, 0.8)
	end
end

-- Optimized text generation with caching
local function GenerateDisplayText(fps, ms)
	local config = PerfMeterConfig
	local cacheKey = string_format("%s_%d_%d_%s_%s", config.displayMode, fps, ms, tostring(config.useColorCoding), tostring(config.useClassColor))

	if textCache[cacheKey] then
		return textCache[cacheKey]
	end

	-- Color setup
	local msColorR, msColorG, msColorB = 1, 1, 1
	if config.useColorCoding then
		msColorR, msColorG, msColorB = GetMSColor(ms)
	end

	local labelColorHex = "ffffff"
	if config.useClassColor then
		labelColorHex = RGBToHex(classColor.r, classColor.g, classColor.b)
	end

	local msColorHex = RGBToHex(msColorR, msColorG, msColorB)

	-- Generate display text based on mode
	local displayText
	local mode = config.displayMode

	if mode == "FPS_ONLY" then
		displayText = string_format("|cff%sFPS|r |cffffffff%d|r", labelColorHex, fps)
	elseif mode == "MS_ONLY" then
		displayText = string_format("|cff%sMS|r |cff%s%d|r", labelColorHex, msColorHex, ms)
	elseif mode == "FPS_MS" then
		displayText = string_format("|cff%sFPS|r |cffffffff%d|r |cff%sMS|r |cff%s%d|r", labelColorHex, fps, labelColorHex, msColorHex, ms)
	elseif mode == "MS_FPS" then
		displayText = string_format("|cff%sMS|r |cff%s%d|r |cff%sFPS|r |cffffffff%d|r", labelColorHex, msColorHex, ms, labelColorHex, fps)
	elseif mode == "FPS_MS_VERTICAL" then
		displayText = string_format("|cff%sFPS|r |cffffffff%d|r\n|cff%sMS|r |cff%s%d|r", labelColorHex, fps, labelColorHex, msColorHex, ms)
	elseif mode == "MS_FPS_VERTICAL" then
		displayText = string_format("|cff%sMS|r |cff%s%d|r\n|cff%sFPS|r |cffffffff%d|r", labelColorHex, msColorHex, ms, labelColorHex, fps)
	else
		displayText = string_format("|cff%sFPS|r |cffffffff%d|r |cff%sMS|r |cff%s%d|r", labelColorHex, fps, labelColorHex, msColorHex, ms)
	end

	textCache[cacheKey] = displayText
	return displayText
end

-- Clear cache when settings change
local function ClearCaches()
	wipe(textCache)
end

-- Drag functionality
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
	local point, _, relativePoint, x, y = self:GetPoint()
	local config = PerfMeterConfig
	config.position.point = point
	config.position.relativePoint = relativePoint
	config.position.x = x
	config.position.y = y
end)

-- Optimized update function using a ticker instead of OnUpdate
local ticker
local function UpdateDisplay()
	local config = PerfMeterConfig

	if not config.showFrame then
		frame:Hide()
		return
	end

	frame:Show()

	-- Get performance data
	local fps = math_floor(GetFramerate())
	local _, _, latencyHome, latencyWorld = GetNetStats()
	local ms = math_max(latencyHome, latencyWorld)

	-- Update display
	local displayText = GenerateDisplayText(fps, ms)
	text:SetText(displayText)

	-- Adjust frame size
	local width = text:GetStringWidth() + 20
	local height = text:GetStringHeight() + 20
	local mode = config.displayMode
	if mode == "FPS_MS_VERTICAL" or mode == "MS_FPS_VERTICAL" then
		height = height + text:GetStringHeight() -- Account for second line
	end
	frame:SetSize(width, height)
end

-- Function to start/stop the ticker
local function ToggleUpdates(enable)
	if ticker then
		ticker:Cancel()
		ticker = nil
	end

	if enable then
		ticker = C_Timer.NewTicker(UPDATE_INTERVAL, UpdateDisplay)
		UpdateDisplay() -- Immediate update
	end
end

-- Function to reset position
function PerfMeter:ResetPosition()
	local config = PerfMeterConfig
	config.position = {
		point = "CENTER",
		relativePoint = "CENTER",
		x = 0,
		y = 0,
	}
	frame:ClearAllPoints()
	frame:SetPoint(config.position.point, UIParent, config.position.relativePoint, config.position.x, config.position.y)
end

-- Function to update frame position from saved variables
function PerfMeter:UpdatePosition()
	local pos = PerfMeterConfig.position
	frame:ClearAllPoints()
	frame:SetPoint(pos.point, UIParent, pos.relativePoint, pos.x, pos.y)
end

-- Function to refresh all settings
function PerfMeter:RefreshSettings()
	ClearCaches()
	self:UpdateFrameBackdrop()
	self:UpdatePosition()

	if PerfMeterConfig.showFrame then
		ToggleUpdates(true)
	else
		ToggleUpdates(false)
		frame:Hide()
	end
end

-- Initialize the addon
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:RegisterEvent("PLAYER_LOGOUT")
initFrame:SetScript("OnEvent", function(self, event, arg1)
	if event == "ADDON_LOADED" and arg1 == addonName then
		-- Validate saved variables
		if not PerfMeterConfig or type(PerfMeterConfig) ~= "table" then
			print("|cffff0000PerfMeter:|r Invalid saved variables detected, resetting to defaults.")
			-- Config will be reloaded from PerfMeterConfig.lua defaults
		end

		-- Initialize display
		PerfMeter:UpdateFrameBackdrop()
		PerfMeter:UpdatePosition()

		if PerfMeterConfig.showFrame then
			ToggleUpdates(true)
		else
			frame:Hide()
		end

		self:UnregisterEvent("ADDON_LOADED")
	elseif event == "PLAYER_LOGOUT" then
		-- Clean up ticker on logout
		if ticker then
			ticker:Cancel()
		end
	end
end)

-- Public API
PerfMeter.ClearCaches = ClearCaches
PerfMeter.ToggleUpdates = ToggleUpdates

-- Make addon globally accessible
_G[addonName] = PerfMeter
