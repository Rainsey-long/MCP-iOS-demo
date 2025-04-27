import Foundation
import CoreLocation

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let address: String
    let coordinate: CLLocationCoordinate2D
    let type: PlaceType
    let icon: String
    
    static var samplePlaces: [Place] {
        [
            Place(name: "Home", 
                  address: "Add", 
                  coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194), 
                  type: .home, 
                  icon: "house"),
            Place(name: "Work", 
                  address: "Add", 
                  coordinate: CLLocationCoordinate2D(latitude: 37.7849, longitude: -122.4294), 
                  type: .work, 
                  icon: "briefcase"),
            Place(name: "Parked Car", 
                  address: "290 m away, near ulica Krasnoarmejska", 
                  coordinate: CLLocationCoordinate2D(latitude: 37.7649, longitude: -122.4094), 
                  type: .parkedCar, 
                  icon: "car"),
            Place(name: "Shop Starazhytny, Zavodskaya str...", 
                  address: "", 
                  coordinate: CLLocationCoordinate2D(latitude: 37.7949, longitude: -122.4394), 
                  type: .recent, 
                  icon: "magnifyingglass"),
            Place(name: "Voenkomat, Oktyabrskaya 13", 
                  address: "", 
                  coordinate: CLLocationCoordinate2D(latitude: 37.7549, longitude: -122.4194), 
                  type: .recent, 
                  icon: "magnifyingglass")
        ]
    }
}

enum PlaceType {
    case home, work, parkedCar, recent, custom
}
