-- PerfMeter Options Panel - Optimized
local addonName = "PerfMeter"
local addon = PerfMeter
local L = PerfMeterLocale

-- Cache for settings to avoid repeated lookups
local settingsCache = {}

-- Helper function to refresh addon display
local function RefreshAddon()
	if addon and addon.RefreshSettings then
		addon:RefreshSettings()
	end
end

-- Helper function to show feedback messages
local function ShowMessage(message)
	print("|cff5C8BCFPerfMeter:|r " .. message)
end

-- Create and register the settings category
local category = Settings.RegisterVerticalLayoutCategory(addonName)
Settings.RegisterAddOnCategory(category)

-- Initialize settings with improved error handling
local function InitializeSettings()
	-- Validate config exists
	if not PerfMeterConfig then
		ShowMessage("|cffff0000Error:|r Configuration not loaded!")
		return
	end

	-- Show Frame Setting
	local showFrameSetting = Settings.RegisterAddOnSetting(category, "showFrame", "showFrame", PerfMeterConfig, Settings.VarType.Boolean, L.SHOW_FRAME, true)
	local showFrameInitializer = Settings.CreateCheckboxInitializer(showFrameSetting, nil, L.SHOW_FRAME_DESC)
	Settings.RegisterInitializer(category, showFrameInitializer)
	showFrameSetting:SetValueChangedCallback(function()
		RefreshAddon()
		ShowMessage("Frame " .. (PerfMeterConfig.showFrame and "shown" or "hidden"))
	end)

	-- Display Mode Dropdown
	local function GetDisplayModeOptions()
		if not settingsCache.displayModeOptions then
			local container = Settings.CreateControlTextContainer()
			container:Add("FPS_ONLY", L.MODE_FPS_ONLY, nil)
			container:Add("MS_ONLY", L.MODE_MS_ONLY, nil)
			container:Add("FPS_MS", L.MODE_FPS_MS, nil)
			container:Add("MS_FPS", L.MODE_MS_FPS, nil)
			container:Add("FPS_MS_VERTICAL", L.MODE_FPS_MS_VERTICAL, nil)
			container:Add("MS_FPS_VERTICAL", L.MODE_MS_FPS_VERTICAL, nil)
			settingsCache.displayModeOptions = container:GetData()
		end
		return settingsCache.displayModeOptions
	end

	local displayModeSetting = Settings.RegisterAddOnSetting(category, "displayMode", "displayMode", PerfMeterConfig, Settings.VarType.String, L.DISPLAY_MODE, "FPS_MS")
	local displayModeInitializer = Settings.CreateDropdownInitializer(displayModeSetting, GetDisplayModeOptions, L.DISPLAY_MODE_DESC)
	Settings.RegisterInitializer(category, displayModeInitializer)
	displayModeSetting:SetValueChangedCallback(function()
		if addon and addon.ClearCaches then
			addon.ClearCaches()
		end
		RefreshAddon()
		ShowMessage("Display mode changed to: " .. (L["MODE_" .. PerfMeterConfig.displayMode] or PerfMeterConfig.displayMode))
	end)

	-- Use Color Coding for MS
	local useColorCodingSetting = Settings.RegisterAddOnSetting(category, "useColorCoding", "useColorCoding", PerfMeterConfig, Settings.VarType.Boolean, L.USE_COLOR_CODING, true)
	local useColorCodingInitializer = Settings.CreateCheckboxInitializer(useColorCodingSetting, nil, L.USE_COLOR_CODING_DESC)
	Settings.RegisterInitializer(category, useColorCodingInitializer)
	useColorCodingSetting:SetValueChangedCallback(function()
		if addon and addon.ClearCaches then
			addon.ClearCaches()
		end
		ShowMessage("MS color coding " .. (PerfMeterConfig.useColorCoding and "enabled" or "disabled"))
	end)

	-- Use Class Color for Labels
	local useClassColorSetting = Settings.RegisterAddOnSetting(category, "useClassColor", "useClassColor", PerfMeterConfig, Settings.VarType.Boolean, L.USE_CLASS_COLOR, false)
	local useClassColorInitializer = Settings.CreateCheckboxInitializer(useClassColorSetting, nil, L.USE_CLASS_COLOR_DESC)
	Settings.RegisterInitializer(category, useClassColorInitializer)
	useClassColorSetting:SetValueChangedCallback(function()
		if addon and addon.ClearCaches then
			addon.ClearCaches()
		end
		ShowMessage("Class color for labels " .. (PerfMeterConfig.useClassColor and "enabled" or "disabled"))
	end)

	-- Show Border
	local showBorderSetting = Settings.RegisterAddOnSetting(category, "showBorder", "showBorder", PerfMeterConfig, Settings.VarType.Boolean, L.SHOW_BORDER, true)
	local showBorderInitializer = Settings.CreateCheckboxInitializer(showBorderSetting, nil, L.SHOW_BORDER_DESC)
	Settings.RegisterInitializer(category, showBorderInitializer)
	showBorderSetting:SetValueChangedCallback(function()
		if addon and addon.UpdateFrameBackdrop then
			addon:UpdateFrameBackdrop()
		end
		ShowMessage("Border " .. (PerfMeterConfig.showBorder and "shown" or "hidden"))
	end)

	-- Show Background
	local showBackgroundSetting = Settings.RegisterAddOnSetting(category, "showBackground", "showBackground", PerfMeterConfig, Settings.VarType.Boolean, L.SHOW_BACKGROUND, true)
	local showBackgroundInitializer = Settings.CreateCheckboxInitializer(showBackgroundSetting, nil, L.SHOW_BACKGROUND_DESC)
	Settings.RegisterInitializer(category, showBackgroundInitializer)
	showBackgroundSetting:SetValueChangedCallback(function()
		if addon and addon.UpdateFrameBackdrop then
			addon:UpdateFrameBackdrop()
		end
		ShowMessage("Background " .. (PerfMeterConfig.showBackground and "shown" or "hidden"))
	end)

	-- Reset Position Button (improved implementation)
	local resetPositionSetting = Settings.RegisterAddOnSetting(category, "resetPosition", "resetPosition", PerfMeterConfig, Settings.VarType.Boolean, L.RESET_POSITION, false)
	local resetPositionInitializer = Settings.CreateCheckboxInitializer(resetPositionSetting, nil, L.RESET_POSITION_DESC)
	Settings.RegisterInitializer(category, resetPositionInitializer)
	resetPositionSetting:SetValueChangedCallback(function()
		if PerfMeterConfig.resetPosition then
			if addon and addon.ResetPosition then
				addon:ResetPosition()
				ShowMessage("Frame position reset to center")
			end
			-- Reset the checkbox immediately
			resetPositionSetting:SetValue(false)
		end
	end)
end

-- Event handler for initialization
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:SetScript("OnEvent", function(self, event, arg1)
	if event == "ADDON_LOADED" and arg1 == addonName then
		-- Slight delay to ensure all components are loaded
		C_Timer.After(0.1, function()
			if PerfMeterConfig then
				InitializeSettings()
			else
				ShowMessage("|cffff0000Error:|r Failed to initialize settings - configuration not found!")
			end
		end)
		self:UnregisterEvent("ADDON_LOADED")
	end
end)

-- Enhanced slash commands
SLASH_PERFMETER1 = "/perfmeter"
SLASH_PERFMETER2 = "/pm"
SlashCmdList["PERFMETER"] = function(msg)
	local command = string.lower(string.trim(msg))

	if command == "" or command == "config" or command == "settings" then
		-- Open settings panel
		Settings.OpenToCategory(category:GetID())
	elseif command == "toggle" then
		-- Toggle frame visibility
		PerfMeterConfig.showFrame = not PerfMeterConfig.showFrame
		RefreshAddon()
		ShowMessage("Frame " .. (PerfMeterConfig.showFrame and "shown" or "hidden"))
	elseif command == "reset" then
		-- Reset position
		if addon and addon.ResetPosition then
			addon:ResetPosition()
			ShowMessage("Frame position reset to center")
		end
	elseif command == "help" then
		-- Show help
		print("|cff5C8BCFPerfMeter Commands:|r")
		print("  |cffffffff/perfmeter|r or |cffffffff/pm|r - Open settings")
		print("  |cffffffff/perfmeter toggle|r - Toggle frame visibility")
		print("  |cffffffff/perfmeter reset|r - Reset frame position")
		print("  |cffffffff/perfmeter help|r - Show this help")
	else
		ShowMessage("Unknown command. Type '/perfmeter help' for available commands.")
	end
end
