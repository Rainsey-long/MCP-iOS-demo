import SwiftUI
import GoogleMaps

@main
struct MCPDemoApp: App {
    
    init() {
        // Initialize Google Maps with API key from Info.plist
        if let apiKey = Bundle.main.object(forInfoDictionaryKey: "GMSApiKey") as? String {
            GMSServices.provideAPIKey(apiKey)
        } else {
            print("Warning: No Google Maps API key found in Info.plist")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
