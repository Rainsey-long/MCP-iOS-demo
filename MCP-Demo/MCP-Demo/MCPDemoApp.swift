import SwiftUI
import GoogleMaps

@main
struct MCPDemoApp: App {
    
    init() {
        // Initialize Google Maps with API key from Info.plist
        if let apiKey = Bundle.main.object(forInfoDictionaryKey: "GMSApiKey") as? String {
            GMSServices.provideAPIKey(apiKey)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
