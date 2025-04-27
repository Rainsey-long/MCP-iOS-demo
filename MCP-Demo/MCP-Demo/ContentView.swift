import SwiftUI
import GoogleMaps
import CoreLocation

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var viewModel: MapViewModel
    @State private var showSearchPanel = false
    @State private var selectedCoordinate: CLLocationCoordinate2D?
    @State private var mapViewDelegate: GMSMapViewDelegate?
    
    init() {
        let locationManager = LocationManager()
        let viewModel = MapViewModel(locationManager: locationManager)
        _viewModel = StateObject(wrappedValue: viewModel)
        _locationManager = StateObject(wrappedValue: locationManager)
        _mapViewDelegate = State(initialValue: viewModel.mapViewDelegate)
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Map View
            GoogleMapView(
                mapViewDelegate: $mapViewDelegate,
                selectedLocationCoordinate: $selectedCoordinate
            )
            .edgesIgnoringSafeArea(.all)
            
            // UI Overlays
            VStack {
                // Search bar at the top
                SearchBarButton {
                    showSearchPanel = true
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
                Spacer()
                
                // Controls
                HStack(alignment: .bottom) {
                    // Temperature display
                    TemperatureView(temperature: viewModel.temperature)
                    
                    Spacer()
                    
                    // Map controls
                    VStack(spacing: 15) {
                        MapControlPanel(viewModel: viewModel)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 8)
            }
            
            // Home indicator area
            Rectangle()
                .fill(Color.white)
                .frame(height: 5)
                .cornerRadius(2.5)
                .padding(.bottom, 8)
                .frame(width: 134)
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height - 10)
        }
        .sheet(isPresented: $showSearchPanel) {
            SearchPanel(viewModel: viewModel, isPresented: $showSearchPanel)
                .edgesIgnoringSafeArea(.bottom)
        }
        .onAppear {
            // Update selected coordinate if location is available
            if let location = locationManager.location {
                selectedCoordinate = location.coordinate
            }
        }
        .onChange(of: locationManager.location) { newLocation in
            if let newLocation = newLocation, viewModel.mapState == .tracking {
                selectedCoordinate = newLocation.coordinate
            }
        }
        .onChange(of: viewModel.selectedPlace) { place in
            if let place = place {
                selectedCoordinate = place.coordinate
            }
        }
    }
}

#Preview {
    ContentView()
}
