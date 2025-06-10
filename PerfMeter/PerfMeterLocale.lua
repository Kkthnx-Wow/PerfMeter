-- PerfMeter Localization File - Enhanced
local addonName = "PerfMeter"
local L = {}

-- Helper function for creating localization entries
local function CreateLocaleEntry(base)
	local entry = {}
	for k, v in pairs(base) do
		entry[k] = v
	end
	return entry
end

-- English (default) - serves as the base for other languages
local enUS = {
	-- Settings
	DISPLAY_MODE = "Display Mode",
	DISPLAY_MODE_DESC = "Choose how to display FPS and MS",
	MODE_FPS_ONLY = "FPS Only",
	MODE_MS_ONLY = "MS Only",
	MODE_FPS_MS = "FPS MS",
	MODE_MS_FPS = "MS FPS",
	MODE_FPS_MS_VERTICAL = "FPS\nMS",
	MODE_MS_FPS_VERTICAL = "MS\nFPS",
	SHOW_FRAME = "Show Frame",
	SHOW_FRAME_DESC = "Show or hide the FPS/MS display frame",
	RESET_POSITION = "Reset Position",
	RESET_POSITION_DESC = "Reset the frame to its default position",
	USE_COLOR_CODING = "Use Color Coding for MS",
	USE_COLOR_CODING_DESC = "Color MS based on latency (green = good, yellow = medium, red = bad)",
	USE_CLASS_COLOR = "Use Class Color for Labels",
	USE_CLASS_COLOR_DESC = "Color the FPS and MS labels in your class color (digits remain white or color-coded for MS)",
	SHOW_BORDER = "Show Border",
	SHOW_BORDER_DESC = "Show or hide the frame's border",
	SHOW_BACKGROUND = "Show Background",
	SHOW_BACKGROUND_DESC = "Show or hide the frame's background",
}

-- Set base English
L["enUS"] = enUS

-- German (Deutsch)
L["deDE"] = CreateLocaleEntry(enUS)
L["deDE"].DISPLAY_MODE = "Anzeigemodus"
L["deDE"].DISPLAY_MODE_DESC = "Wählen Sie, wie FPS und MS angezeigt werden"
L["deDE"].MODE_FPS_ONLY = "Nur FPS"
L["deDE"].MODE_MS_ONLY = "Nur MS"
L["deDE"].SHOW_FRAME = "Frame anzeigen"
L["deDE"].SHOW_FRAME_DESC = "FPS/MS-Anzeigeframe anzeigen oder ausblenden"
L["deDE"].RESET_POSITION = "Position zurücksetzen"
L["deDE"].RESET_POSITION_DESC = "Frame auf Standardposition zurücksetzen"
L["deDE"].USE_COLOR_CODING = "Farbkodierung für MS verwenden"
L["deDE"].USE_COLOR_CODING_DESC = "MS basierend auf Latenz einfärben (grün = gut, gelb = mittel, rot = schlecht)"
L["deDE"].USE_CLASS_COLOR = "Klassenfarbe für Beschriftungen verwenden"
L["deDE"].USE_CLASS_COLOR_DESC = "FPS- und MS-Beschriftungen in Ihrer Klassenfarbe einfärben"
L["deDE"].SHOW_BORDER = "Rahmen anzeigen"
L["deDE"].SHOW_BORDER_DESC = "Rahmen des Frames anzeigen oder ausblenden"
L["deDE"].SHOW_BACKGROUND = "Hintergrund anzeigen"
L["deDE"].SHOW_BACKGROUND_DESC = "Hintergrund des Frames anzeigen oder ausblenden"

-- French (Français)
L["frFR"] = CreateLocaleEntry(enUS)
L["frFR"].DISPLAY_MODE = "Mode d'affichage"
L["frFR"].DISPLAY_MODE_DESC = "Choisir comment afficher FPS et MS"
L["frFR"].MODE_FPS_ONLY = "FPS seulement"
L["frFR"].MODE_MS_ONLY = "MS seulement"
L["frFR"].SHOW_FRAME = "Afficher le cadre"
L["frFR"].SHOW_FRAME_DESC = "Afficher ou masquer le cadre d'affichage FPS/MS"
L["frFR"].RESET_POSITION = "Réinitialiser la position"
L["frFR"].RESET_POSITION_DESC = "Réinitialiser le cadre à sa position par défaut"
L["frFR"].USE_COLOR_CODING = "Utiliser le codage couleur pour MS"
L["frFR"].USE_COLOR_CODING_DESC = "Colorer MS selon la latence (vert = bon, jaune = moyen, rouge = mauvais)"
L["frFR"].USE_CLASS_COLOR = "Utiliser la couleur de classe pour les étiquettes"
L["frFR"].USE_CLASS_COLOR_DESC = "Colorer les étiquettes FPS et MS avec votre couleur de classe"
L["frFR"].SHOW_BORDER = "Afficher la bordure"
L["frFR"].SHOW_BORDER_DESC = "Afficher ou masquer la bordure du cadre"
L["frFR"].SHOW_BACKGROUND = "Afficher l'arrière-plan"
L["frFR"].SHOW_BACKGROUND_DESC = "Afficher ou masquer l'arrière-plan du cadre"

-- Spanish (Español)
L["esES"] = CreateLocaleEntry(enUS)
L["esES"].DISPLAY_MODE = "Modo de visualización"
L["esES"].DISPLAY_MODE_DESC = "Elegir cómo mostrar FPS y MS"
L["esES"].MODE_FPS_ONLY = "Solo FPS"
L["esES"].MODE_MS_ONLY = "Solo MS"
L["esES"].SHOW_FRAME = "Mostrar marco"
L["esES"].SHOW_FRAME_DESC = "Mostrar u ocultar el marco de visualización FPS/MS"
L["esES"].RESET_POSITION = "Restablecer posición"
L["esES"].RESET_POSITION_DESC = "Restablecer el marco a su posición predeterminada"
L["esES"].USE_COLOR_CODING = "Usar codificación de color para MS"
L["esES"].USE_COLOR_CODING_DESC = "Colorear MS según la latencia (verde = bueno, amarillo = medio, rojo = malo)"
L["esES"].USE_CLASS_COLOR = "Usar color de clase para etiquetas"
L["esES"].USE_CLASS_COLOR_DESC = "Colorear las etiquetas FPS y MS con su color de clase"
L["esES"].SHOW_BORDER = "Mostrar borde"
L["esES"].SHOW_BORDER_DESC = "Mostrar u ocultar el borde del marco"
L["esES"].SHOW_BACKGROUND = "Mostrar fondo"
L["esES"].SHOW_BACKGROUND_DESC = "Mostrar u ocultar el fondo del marco"

-- Mexican Spanish
L["esMX"] = L["esES"] -- Use same as Spanish

-- Simplified Chinese (简体中文)
L["zhCN"] = CreateLocaleEntry(enUS)
L["zhCN"].DISPLAY_MODE = "显示模式"
L["zhCN"].DISPLAY_MODE_DESC = "选择如何显示FPS和MS"
L["zhCN"].MODE_FPS_ONLY = "仅FPS"
L["zhCN"].MODE_MS_ONLY = "仅MS"
L["zhCN"].SHOW_FRAME = "显示框架"
L["zhCN"].SHOW_FRAME_DESC = "显示或隐藏FPS/MS显示框架"
L["zhCN"].RESET_POSITION = "重置位置"
L["zhCN"].RESET_POSITION_DESC = "将框架重置到默认位置"
L["zhCN"].USE_COLOR_CODING = "为MS使用颜色编码"
L["zhCN"].USE_COLOR_CODING_DESC = "根据延迟对MS进行颜色编码（绿色=良好，黄色=中等，红色=差）"
L["zhCN"].USE_CLASS_COLOR = "为标签使用职业颜色"
L["zhCN"].USE_CLASS_COLOR_DESC = "将FPS和MS标签着色为您的职业颜色（数字保持白色或为MS着色）"
L["zhCN"].SHOW_BORDER = "显示边框"
L["zhCN"].SHOW_BORDER_DESC = "显示或隐藏框架的边框"
L["zhCN"].SHOW_BACKGROUND = "显示背景"
L["zhCN"].SHOW_BACKGROUND_DESC = "显示或隐藏框架的背景"

-- Traditional Chinese (繁體中文)
L["zhTW"] = CreateLocaleEntry(enUS)
L["zhTW"].DISPLAY_MODE = "顯示模式"
L["zhTW"].DISPLAY_MODE_DESC = "選擇如何顯示FPS和MS"
L["zhTW"].MODE_FPS_ONLY = "僅FPS"
L["zhTW"].MODE_MS_ONLY = "僅MS"
L["zhTW"].SHOW_FRAME = "顯示框架"
L["zhTW"].SHOW_FRAME_DESC = "顯示或隱藏FPS/MS顯示框架"
L["zhTW"].RESET_POSITION = "重置位置"
L["zhTW"].RESET_POSITION_DESC = "將框架重置到預設位置"
L["zhTW"].USE_COLOR_CODING = "為MS使用顏色編碼"
L["zhTW"].USE_COLOR_CODING_DESC = "根據延遲對MS進行顏色編碼（綠色=良好，黃色=中等，紅色=差）"
L["zhTW"].USE_CLASS_COLOR = "為標籤使用職業顏色"
L["zhTW"].USE_CLASS_COLOR_DESC = "將FPS和MS標籤著色為您的職業顏色（數字保持白色或為MS著色）"
L["zhTW"].SHOW_BORDER = "顯示邊框"
L["zhTW"].SHOW_BORDER_DESC = "顯示或隱藏框架的邊框"
L["zhTW"].SHOW_BACKGROUND = "顯示背景"
L["zhTW"].SHOW_BACKGROUND_DESC = "顯示或隱藏框架的背景"

-- Korean (한국어)
L["koKR"] = CreateLocaleEntry(enUS)
L["koKR"].DISPLAY_MODE = "표시 모드"
L["koKR"].DISPLAY_MODE_DESC = "FPS와 MS 표시 방법 선택"
L["koKR"].MODE_FPS_ONLY = "FPS만"
L["koKR"].MODE_MS_ONLY = "MS만"
L["koKR"].SHOW_FRAME = "프레임 표시"
L["koKR"].SHOW_FRAME_DESC = "FPS/MS 표시 프레임 보이기/숨기기"
L["koKR"].RESET_POSITION = "위치 초기화"
L["koKR"].RESET_POSITION_DESC = "프레임을 기본 위치로 초기화"
L["koKR"].USE_COLOR_CODING = "MS 색상 코딩 사용"
L["koKR"].USE_COLOR_CODING_DESC = "지연 시간에 따라 MS 색상 표시 (녹색=양호, 노란색=보통, 빨간색=나쁨)"
L["koKR"].USE_CLASS_COLOR = "레이블에 직업 색상 사용"
L["koKR"].USE_CLASS_COLOR_DESC = "FPS와 MS 레이블을 직업 색상으로 표시"
L["koKR"].SHOW_BORDER = "테두리 표시"
L["koKR"].SHOW_BORDER_DESC = "프레임 테두리 보이기/숨기기"
L["koKR"].SHOW_BACKGROUND = "배경 표시"
L["koKR"].SHOW_BACKGROUND_DESC = "프레임 배경 보이기/숨기기"

-- Russian (Русский)
L["ruRU"] = CreateLocaleEntry(enUS)
L["ruRU"].DISPLAY_MODE = "Режим отображения"
L["ruRU"].DISPLAY_MODE_DESC = "Выберите способ отображения FPS и MS"
L["ruRU"].MODE_FPS_ONLY = "Только FPS"
L["ruRU"].MODE_MS_ONLY = "Только MS"
L["ruRU"].SHOW_FRAME = "Показать фрейм"
L["ruRU"].SHOW_FRAME_DESC = "Показать или скрыть фрейм отображения FPS/MS"
L["ruRU"].RESET_POSITION = "Сбросить позицию"
L["ruRU"].RESET_POSITION_DESC = "Сбросить фрейм в позицию по умолчанию"
L["ruRU"].USE_COLOR_CODING = "Использовать цветовое кодирование для MS"
L["ruRU"].USE_COLOR_CODING_DESC = "Окрашивать MS в зависимости от задержки (зелёный = хорошо, жёлтый = средне, красный = плохо)"
L["ruRU"].USE_CLASS_COLOR = "Использовать цвет класса для меток"
L["ruRU"].USE_CLASS_COLOR_DESC = "Окрашивать метки FPS и MS в цвет вашего класса"
L["ruRU"].SHOW_BORDER = "Показать границу"
L["ruRU"].SHOW_BORDER_DESC = "Показать или скрыть границу фрейма"
L["ruRU"].SHOW_BACKGROUND = "Показать фон"
L["ruRU"].SHOW_BACKGROUND_DESC = "Показать или скрыть фон фрейма"

-- Portuguese (Português)
L["ptBR"] = CreateLocaleEntry(enUS)
L["ptBR"].DISPLAY_MODE = "Modo de Exibição"
L["ptBR"].DISPLAY_MODE_DESC = "Escolher como exibir FPS e MS"
L["ptBR"].MODE_FPS_ONLY = "Apenas FPS"
L["ptBR"].MODE_MS_ONLY = "Apenas MS"
L["ptBR"].SHOW_FRAME = "Mostrar Quadro"
L["ptBR"].SHOW_FRAME_DESC = "Mostrar ou ocultar o quadro de exibição FPS/MS"
L["ptBR"].RESET_POSITION = "Redefinir Posição"
L["ptBR"].RESET_POSITION_DESC = "Redefinir o quadro para sua posição padrão"
L["ptBR"].USE_COLOR_CODING = "Usar Codificação de Cor para MS"
L["ptBR"].USE_COLOR_CODING_DESC = "Colorir MS baseado na latência (verde = bom, amarelo = médio, vermelho = ruim)"
L["ptBR"].USE_CLASS_COLOR = "Usar Cor da Classe para Rótulos"
L["ptBR"].USE_CLASS_COLOR_DESC = "Colorir os rótulos FPS e MS na cor da sua classe"
L["ptBR"].SHOW_BORDER = "Mostrar Borda"
L["ptBR"].SHOW_BORDER_DESC = "Mostrar ou ocultar a borda do quadro"
L["ptBR"].SHOW_BACKGROUND = "Mostrar Fundo"
L["ptBR"].SHOW_BACKGROUND_DESC = "Mostrar ou ocultar o fundo do quadro"

-- Italian (Italiano)
L["itIT"] = CreateLocaleEntry(enUS)
L["itIT"].DISPLAY_MODE = "Modalità di Visualizzazione"
L["itIT"].DISPLAY_MODE_DESC = "Scegli come mostrare FPS e MS"
L["itIT"].MODE_FPS_ONLY = "Solo FPS"
L["itIT"].MODE_MS_ONLY = "Solo MS"
L["itIT"].SHOW_FRAME = "Mostra Cornice"
L["itIT"].SHOW_FRAME_DESC = "Mostra o nascondi la cornice di visualizzazione FPS/MS"
L["itIT"].RESET_POSITION = "Ripristina Posizione"
L["itIT"].RESET_POSITION_DESC = "Ripristina la cornice alla sua posizione predefinita"
L["itIT"].USE_COLOR_CODING = "Usa Codifica Colore per MS"
L["itIT"].USE_COLOR_CODING_DESC = "Colora MS basato sulla latenza (verde = buono, giallo = medio, rosso = cattivo)"
L["itIT"].USE_CLASS_COLOR = "Usa Colore Classe per Etichette"
L["itIT"].USE_CLASS_COLOR_DESC = "Colora le etichette FPS e MS nel colore della tua classe"
L["itIT"].SHOW_BORDER = "Mostra Bordo"
L["itIT"].SHOW_BORDER_DESC = "Mostra o nascondi il bordo della cornice"
L["itIT"].SHOW_BACKGROUND = "Mostra Sfondo"
L["itIT"].SHOW_BACKGROUND_DESC = "Mostra o nascondi lo sfondo della cornice"

-- Create the global localization table with fallback
local currentLocale = GetLocale()
PerfMeterLocale = L[currentLocale] or L["enUS"]

-- Ensure all required keys exist (fallback to English for missing translations)
if currentLocale ~= "enUS" and L[currentLocale] then
	for key, value in pairs(L["enUS"]) do
		if not PerfMeterLocale[key] then
			PerfMeterLocale[key] = value
		end
	end
end

-- Make it globally accessible
_G["PerfMeterLocale"] = PerfMeterLocale

-- Debugging function (only available in dev mode)
if GetCVar("scriptErrors") == "1" then
	_G["PerfMeterLocales"] = L -- Expose all locales for debugging
end
