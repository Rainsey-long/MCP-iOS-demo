import SwiftUI
import GoogleMaps

struct MapContainerView: UIViewRepresentable {
    @EnvironmentObject private var locationManager: LocationManager
    
    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: locationManager.location?.coordinate.latitude ?? 37.7749,
                                              longitude: locationManager.location?.coordinate.longitude ?? -122.4194,
                                              zoom: 14.0)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = false
        mapView.settings.compassButton = false
        mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
        if let location = locationManager.location {
            let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                                  longitude: location.coordinate.longitude,
                                                  zoom: 14.0)
            mapView.animate(to: camera)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, GMSMapViewDelegate {
        var parent: MapContainerView
        
        init(_ parent: MapContainerView) {
            self.parent = parent
        }
        
        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            return true
        }
        
        func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
            print("Tapped at coordinate: \(coordinate)")
        }
    }
}
