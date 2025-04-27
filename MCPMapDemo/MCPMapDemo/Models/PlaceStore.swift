import Foundation

class PlaceStore: ObservableObject {
    @Published var favorites: [Place] = []
    @Published var recents: [Place] = []
    
    private let favoritesKey = "favorites"
    private let recentsKey = "recents"
    
    init() {
        loadPlaces()
    }
    
    private func loadPlaces() {
        if let data = UserDefaults.standard.data(forKey: favoritesKey),
           let decoded = try? JSONDecoder().decode([Place].self, from: data) {
            favorites = decoded
        }
        
        if let data = UserDefaults.standard.data(forKey: recentsKey),
           let decoded = try? JSONDecoder().decode([Place].self, from: data) {
            recents = decoded
        }
        
        // If there's no saved data, use sample data
        if favorites.isEmpty {
            favorites = Place.samplePlaces.filter { $0.isFavorite }
        }
        
        if recents.isEmpty {
            recents = Place.samplePlaces.filter { !$0.isFavorite }.sorted { $0.timestamp > $1.timestamp }
        }
    }
    
    private func savePlaces() {
        if let encoded = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(encoded, forKey: favoritesKey)
        }
        
        if let encoded = try? JSONEncoder().encode(recents) {
            UserDefaults.standard.set(encoded, forKey: recentsKey)
        }
    }
    
    func addFavorite(_ place: Place) {
        var updatedPlace = place
        updatedPlace.isFavorite = true
        
        if !favorites.contains(where: { $0.id == place.id }) {
            favorites.append(updatedPlace)
            savePlaces()
        }
    }
    
    func removeFavorite(_ place: Place) {
        favorites.removeAll { $0.id == place.id }
        savePlaces()
    }
    
    func addRecent(_ place: Place) {
        // Remove if already exists to avoid duplicates
        recents.removeAll { $0.id == place.id }
        
        var updatedPlace = place
        updatedPlace.timestamp = Date()
        
        // Add to the beginning
        recents.insert(updatedPlace, at: 0)
        
        // Keep only the 10 most recent
        if recents.count > 10 {
            recents = Array(recents.prefix(10))
        }
        
        savePlaces()
    }
}
