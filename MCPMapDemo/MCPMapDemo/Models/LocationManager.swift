import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    @Published var location: CLLocation?
    @Published var status: CLAuthorizationStatus?
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.status = status
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed with error: \(error.localizedDescription)")
    }
    
    func centerOnUserLocation() {
        locationManager.requestLocation()
    }
    
    func saveParkedCarLocation() {
        // Save current location as the parked car location
        // This would typically be stored in UserDefaults or similar
        if let location = location {
            let userDefaults = UserDefaults.standard
            userDefaults.set(location.coordinate.latitude, forKey: "parkedCarLatitude")
            userDefaults.set(location.coordinate.longitude, forKey: "parkedCarLongitude")
            userDefaults.set(Date(), forKey: "parkedCarTimestamp")
        }
    }
    
    func getParkedCarLocation() -> CLLocationCoordinate2D? {
        let userDefaults = UserDefaults.standard
        if let latitude = userDefaults.object(forKey: "parkedCarLatitude") as? CLLocationDegrees,
           let longitude = userDefaults.object(forKey: "parkedCarLongitude") as? CLLocationDegrees {
            return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        return nil
    }
}
