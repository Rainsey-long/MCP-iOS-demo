import Foundation
import CoreLocation

struct Place: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var address: String
    var latitude: Double
    var longitude: Double
    var isFavorite: Bool = false
    var category: Category = .other
    var timestamp: Date = Date()
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    enum Category: String, Codable, CaseIterable {
        case home
        case work
        case restaurant
        case shopping
        case entertainment
        case travel
        case other
        
        var systemImageName: String {
            switch self {
            case .home: return "house.fill"
            case .work: return "briefcase.fill"
            case .restaurant: return "fork.knife"
            case .shopping: return "cart.fill"
            case .entertainment: return "film.fill"
            case .travel: return "airplane"
            case .other: return "mappin"
            }
        }
    }
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.id == rhs.id
    }
}

// Extension for sample data
extension Place {
    static var samplePlaces: [Place] = [
        Place(name: "Home", address: "123 Main St", latitude: 37.7749, longitude: -122.4194, isFavorite: true, category: .home),
        Place(name: "Work", address: "456 Market St", latitude: 37.7749, longitude: -122.4194, isFavorite: true, category: .work),
        Place(name: "Favorite Restaurant", address: "789 Mission St", latitude: 37.7749, longitude: -122.4194, isFavorite: true, category: .restaurant),
        Place(name: "Shop Starazhytny", address: "Zavodskaya str 12", latitude: 37.7749, longitude: -122.4194, category: .shopping),
        Place(name: "Voenkomat", address: "Oktyabrskaya 13", latitude: 37.7749, longitude: -122.4194, category: .other)
    ]
}
