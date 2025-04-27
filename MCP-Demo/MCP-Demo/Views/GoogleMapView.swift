import SwiftUI
import GoogleMaps
import UIKit

struct GoogleMapView: UIViewRepresentable {
    @Binding var mapViewDelegate: GMSMapViewDelegate?
    @Binding var selectedLocationCoordinate: CLLocationCoordinate2D?
    
    func makeUIView(context: Context) -> GMSMapView {
        // Default to a central location
        let camera = GMSCameraPosition.camera(withLatitude: 37.7749, longitude: -122.4194, zoom: 14.0)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.settings.compassButton = true
        mapView.delegate = mapViewDelegate
        
        // Add a pin if a location is selected
        if let coordinate = selectedLocationCoordinate {
            let marker = GMSMarker(position: coordinate)
            marker.map = mapView
            mapView.animate(toLocation: coordinate)
        }
        
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        // Update the map when selectedLocationCoordinate changes
        if let coordinate = selectedLocationCoordinate {
            let marker = GMSMarker(position: coordinate)
            marker.map = mapView
            mapView.animate(toLocation: coordinate)
        }
    }
}

class MapViewDelegate: NSObject, GMSMapViewDelegate, ObservableObject {
    @Published var selectedPlace: String?
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("Tapped at coordinate: \(coordinate.latitude), \(coordinate.longitude)")
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("Tapped marker at: \(marker.position.latitude), \(marker.position.longitude)")
        return true
    }
}
