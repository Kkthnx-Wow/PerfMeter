-- PerfMeter Configuration File - Enhanced
local configVersion = "1.1.0"

-- Default configuration
local defaults = {
	-- Metadata
	configVersion = configVersion,

	-- Display settings
	displayMode = "FPS_MS", -- Options: FPS_ONLY, MS_ONLY, FPS_MS, MS_FPS, FPS_MS_VERTICAL, MS_FPS_VERTICAL
	showFrame = true, -- Show or hide the frame

	-- Position settings
	position = {
		point = "CENTER",
		relativePoint = "CENTER",
		x = 0,
		y = 0,
	},

	-- Color settings
	useColorCoding = true, -- Enable color-coding for MS
	useClassColor = false, -- Use class color for FPS/MS labels

	-- Appearance settings
	showBorder = true, -- Show the frame border
	showBackground = true, -- Show the frame background

	-- Performance settings
	updateInterval = 1.0, -- Update frequency in seconds
}

-- Function to validate and migrate config
local function ValidateConfig(config)
	if not config or type(config) ~= "table" then
		return false, "Invalid config type"
	end

	-- Check for required fields
	local requiredFields = {
		"displayMode",
		"showFrame",
		"position",
		"useColorCoding",
		"useClassColor",
		"showBorder",
		"showBackground",
	}

	for _, field in ipairs(requiredFields) do
		if config[field] == nil then
			return false, "Missing required field: " .. field
		end
	end

	-- Validate display mode
	local validModes = {
		FPS_ONLY = true,
		MS_ONLY = true,
		FPS_MS = true,
		MS_FPS = true,
		FPS_MS_VERTICAL = true,
		MS_FPS_VERTICAL = true,
	}

	if not validModes[config.displayMode] then
		return false, "Invalid display mode: " .. tostring(config.displayMode)
	end

	-- Validate position table
	if type(config.position) ~= "table" then
		return false, "Invalid position config"
	end

	local posFields = { "point", "relativePoint", "x", "y" }
	for _, field in ipairs(posFields) do
		if config.position[field] == nil then
			return false, "Missing position field: " .. field
		end
	end

	return true, "Valid"
end

-- Function to merge defaults with saved config
local function MergeWithDefaults(saved, defaults)
	local result = {}

	-- Start with defaults
	for k, v in pairs(defaults) do
		if type(v) == "table" then
			result[k] = {}
			for k2, v2 in pairs(v) do
				result[k][k2] = v2
			end
		else
			result[k] = v
		end
	end

	-- Override with saved values where they exist and are valid
	if saved and type(saved) == "table" then
		for k, v in pairs(saved) do
			if defaults[k] ~= nil then
				if type(v) == "table" and type(defaults[k]) == "table" then
					for k2, v2 in pairs(v) do
						if defaults[k][k2] ~= nil then
							result[k][k2] = v2
						end
					end
				else
					result[k] = v
				end
			end
		end
	end

	return result
end

-- Initialize or validate existing config
if not PerfMeterConfig then
	-- First time initialization
	PerfMeterConfig = {}
	for k, v in pairs(defaults) do
		if type(v) == "table" then
			PerfMeterConfig[k] = {}
			for k2, v2 in pairs(v) do
				PerfMeterConfig[k][k2] = v2
			end
		else
			PerfMeterConfig[k] = v
		end
	end
else
	-- Validate existing config
	local isValid, reason = ValidateConfig(PerfMeterConfig)

	if not isValid then
		-- Config is invalid, merge with defaults
		print("|cffff8000PerfMeter:|r Config validation failed (" .. reason .. "), merging with defaults.")
		PerfMeterConfig = MergeWithDefaults(PerfMeterConfig, defaults)
	else
		-- Config is valid, but check for missing new fields
		local merged = MergeWithDefaults(PerfMeterConfig, defaults)
		local hasNewFields = false

		for k, v in pairs(merged) do
			if PerfMeterConfig[k] == nil or (type(v) == "table" and type(PerfMeterConfig[k]) == "table") then
				if type(v) == "table" then
					for k2, v2 in pairs(v) do
						if PerfMeterConfig[k][k2] == nil then
							hasNewFields = true
							break
						end
					end
				else
					hasNewFields = true
				end
			end
		end

		if hasNewFields then
			print("|cff00ff00PerfMeter:|r Adding new configuration options.")
			PerfMeterConfig = merged
		end
	end

	-- Update config version
	PerfMeterConfig.configVersion = configVersion
end

-- Make config globally accessible
_G["PerfMeterConfig"] = PerfMeterConfig

-- Export defaults for reference
_G["PerfMeterDefaults"] = defaults
