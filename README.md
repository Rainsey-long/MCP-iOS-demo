# MCP-iOS-demo

## MCP Map Demo

This is a Swift/SwiftUI implementation of a mapping application similar to Apple Maps, utilizing Google Maps SDK for iOS. The app demonstrates:

- Integration with Google Maps in SwiftUI
- Location services
- Search functionality
- Favorites management
- User interface designed to match Apple Maps iOS app

### Features

- 📍 Interactive map with location tracking
- 🔍 Search functionality with recent searches
- ⭐ Favorites management (home, work, etc.)
- 📱 Modern iOS UI built with SwiftUI
- 🧭 Map controls (compass, map types)
- 📋 Guides feature for creating collections of places
- 📱 Full SwiftUI implementation

### Technical Details

- **Language**: Swift with SwiftUI
- **Architecture**: MVVM (Model-View-ViewModel)
- **Dependencies**: Google Maps SDK (via CocoaPods)
- **Testing**: XCTest for unit testing
- **Minimum iOS Version**: iOS 16.0

### Setup Instructions

1. Clone the repository
2. Install CocoaPods if not already installed (`sudo gem install cocoapods`)
3. Run `pod install` in the MCPMapDemo directory
4. Open the generated `.xcworkspace` file
5. Replace `YOUR_GOOGLE_MAPS_API_KEY` in Info.plist with your actual Google Maps API key
6. Build and run the project

### Screenshots

The design is based on the iOS Maps application, with a clean, modern interface that follows Apple's design guidelines while incorporating the capabilities of Google Maps.

### Note

This is a demo application and not intended for production use. It demonstrates the integration of Google Maps with SwiftUI and implementing a complex UI according to a design specification.
