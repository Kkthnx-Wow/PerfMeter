# Contributing to PerfMeter

Thank you for your interest in contributing to PerfMeter! This document provides guidelines and instructions for contributing.

## Code Style

- Follow the existing code style and formatting
- Use the provided `stylua.toml` configuration for Lua formatting
- Keep code clean and well-commented
- Follow WoW addon development best practices

## Pull Request Process

1. Fork the repository
2. Create a new branch for your feature/fix
3. Make your changes
4. Test your changes thoroughly in-game
5. Update documentation if necessary
6. Submit a pull request

## Development Setup

1. Clone the repository:

```bash
git clone https://github.com/Kkthnx-Wow/PerfMeter.git
```

2. Install the addon:

- Copy the addon folder to your WoW `_retail_/Interface/AddOns` directory
- Or create a symbolic link to your development directory

3. Enable Lua errors in WoW:

```
/console scriptErrors 1
```

## Testing

- Test your changes with different display modes
- Verify performance impact
- Check compatibility with different WoW versions
- Test with different UI scales and resolutions
- Verify localization changes in-game

## Localization

When adding new strings:

1. Add the string to the English (enUS) locale first
2. Add translations for other supported languages
3. Use the existing localization system
4. Test the translations in-game

## Reporting Issues

When reporting issues, please include:

- WoW version
- Addon version
- Steps to reproduce
- Expected behavior
- Actual behavior
- Screenshots if applicable

## Questions?

Feel free to open an issue for any questions about contributing.
