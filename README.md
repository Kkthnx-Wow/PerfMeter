# PerfMeter - Enhanced Performance Monitor for World of Warcraft

A lightweight, highly customizable FPS and latency display addon for World of Warcraft, optimized for performance and localized for multiple languages.

## Features

### Core Functionality

- **Real-time FPS Display**: Shows current frames per second
- **Latency Monitoring**: Displays MS (ping) with color coding
- **Multiple Display Modes**: Choose from 6 different layout options
- **Movable Frame**: Drag and drop to position anywhere on screen
- **Customizable Appearance**: Toggle borders, backgrounds, and colors

### Display Modes

1. **FPS Only** - Shows only frames per second
2. **MS Only** - Shows only latency
3. **FPS MS** - Horizontal layout with FPS first
4. **MS FPS** - Horizontal layout with MS first
5. **FPS/MS Vertical** - Vertical stack with FPS on top
6. **MS/FPS Vertical** - Vertical stack with MS on top

### Performance Features

- **Optimized Updates**: Uses efficient ticker system instead of OnUpdate
- **Smart Caching**: Reduces string generation and color calculations
- **Memory Efficient**: Minimal garbage collection impact
- **Configurable Update Rate**: Adjustable refresh interval

### Customization Options

- **Color Coding**: MS changes color based on latency (green/yellow/red)
- **Class Colors**: Option to use your class color for labels
- **Frame Appearance**: Toggle borders and backgrounds
- **Position Memory**: Remembers frame position between sessions

## Localization Support

Full localization support for:

- **English** (enUS)
- **German** (deDE)
- **French** (frFR)
- **Spanish** (esES/esMX)
- **Chinese Simplified** (zhCN)
- **Chinese Traditional** (zhTW)
- **Korean** (koKR)
- **Russian** (ruRU)
- **Portuguese** (ptBR)
- **Italian** (itIT)

## Commands

- `/perfmeter` or `/pm` - Open settings panel
- `/perfmeter toggle` - Toggle frame visibility
- `/perfmeter reset` - Reset frame position to center
- `/perfmeter help` - Show command help

## Installation

1. Download the addon files
2. Extract to your `World of Warcraft\_retail_\Interface\AddOns\` folder
3. Ensure the folder is named `PerfMeter`
4. Restart World of Warcraft or reload UI (`/reload`)

## Configuration

Access settings through:

- Game Settings > AddOns > PerfMeter
- `/perfmeter` command
- AddOn compartment (if available)

## Performance Optimizations (v1.1.0)

### What's Improved

- **Ticker-Based Updates**: Replaced OnUpdate with C_Timer.NewTicker for better performance
- **String Caching**: Cached display text generation to reduce repeated string operations
- **Color Caching**: Optimized color conversion with memoization
- **Reduced Function Calls**: Minimized API calls per update cycle
- **Memory Management**: Better garbage collection patterns

### Technical Details

- **Update Frequency**: Configurable (default: 1 second)
- **Cache Invalidation**: Smart cache clearing when settings change
- **Error Handling**: Robust validation for saved variables
- **Configuration Migration**: Automatic upgrades for new features

## Version History

### v1.1.0 (Latest)

- **Performance**: Major optimization pass with caching and ticker system
- **Localization**: Added 7 additional language localizations
- **Configuration**: Enhanced config validation and migration system
- **UI**: Improved settings panel with better feedback
- **Commands**: Extended slash command functionality
- **Error Handling**: Better validation and fallback mechanisms

### v1.0.0

- Initial release with basic FPS/MS display
- Configuration panel integration
- Movable frame with position saving
- Color coding options

## Contributing

Contributions are welcome! Areas of interest:

- Additional language localizations
- Performance improvements
- Feature enhancements
- Bug fixes

## License

MIT License - see LICENSE file for details

## Support

For issues, feature requests, or questions:

- Create an issue on GitHub
- Contact via addon distribution platforms
- In-game feedback through guild or community channels

---

**Note**: This addon is designed to have minimal performance impact while providing essential performance monitoring features. The optimizations in v1.1.0 significantly reduce CPU usage and memory allocation compared to the original version.
