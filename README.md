# MCP-iOS-demo

## MCP Map Demo

A Swift/SwiftUI implementation of an iOS Maps application with Google Maps integration, based on the Apple Maps iOS design from Figma.

### Features

- 📍 Interactive Google Maps integration in SwiftUI
- 🔍 Search interface with favorites, recents, and guides
- 📱 Modern iOS UI matching the Figma design
- 🧭 Map controls (compass, map type)
- 🌡️ Weather/temperature display
- 📌 Location marking and sharing
- 🔆 Light mode support

### Technical Details

- **Language**: Swift with SwiftUI
- **Architecture**: MVVM pattern
- **Dependencies**: Google Maps SDK via CocoaPods
- **iOS Target**: iOS 16.0+
- **Testing**: XCTest for unit testing

### Implementation Notes

This project implements the design from the provided Figma file: [Apple Maps iOS (Community)](https://www.figma.com/design/D0JhnR7qJOQuavf50CfGxu/Apple-Maps-iOS--Community-?node-id=10-970&p=f&t=4jz9BhQMIrKw973N-0)

Key components include:
- GoogleMapView - UIViewRepresentable wrapper for Google Maps SDK
- SearchPanel - Search interface with sections for suggestions, favorites, etc.
- MapControlPanel - UI controls for map manipulation
- LocationManager - Handles device location with proper permissions

### Setup Instructions

1. Clone the repository and navigate to the MCP-Demo directory
2. Run `pod install` to install dependencies
3. Open the generated `.xcworkspace` file in Xcode
4. Replace `YOUR_GOOGLE_MAPS_API_KEY` in Info.plist with your actual Google Maps API key
5. Build and run the project

### Note

This is a demonstration project showing how to implement a complex UI design in SwiftUI with Google Maps integration. It includes sample data for demonstration purposes.
