import Foundation
import CoreLocation
import GoogleMaps
import Combine

class MapViewModel: ObservableObject {
    @Published var mapState: MapState = .idle
    @Published var places: [Place] = Place.samplePlaces
    @Published var guides: [Guide] = Guide.sampleGuides
    @Published var selectedPlace: Place?
    @Published var searchText: String = ""
    @Published var isSearching: Bool = false
    @Published var showSearchPanel: Bool = false
    @Published var temperature: Int = 16
    
    var locationManager: LocationManager
    var mapViewDelegate: MapViewDelegate?
    private var cancellables = Set<AnyCancellable>()
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        self.mapViewDelegate = MapViewDelegate()
        
        setupSubscriptions()
    }
    
    private func setupSubscriptions() {
        // Listen to location changes
        locationManager.$location
            .compactMap { $0 }
            .sink { [weak self] location in
                print("Location updated: \(location.coordinate.latitude), \(location.coordinate.longitude)")
            }
            .store(in: &cancellables)
        
        // Listen to search text changes for live search
        $searchText
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] searchText in
                if !searchText.isEmpty {
                    self?.performSearch(query: searchText)
                }
            }
            .store(in: &cancellables)
    }
    
    func performSearch(query: String) {
        // This would normally connect to a search API
        // For demo purposes, we're just filtering our sample data
        isSearching = true
        
        // Simulate a network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.isSearching = false
        }
    }
    
    func toggleSearchPanel() {
        showSearchPanel.toggle()
    }
    
    func addToFavorites(place: Place) {
        // Logic to add a place to favorites
        print("Adding \(place.name) to favorites")
    }
    
    func shareLocation() {
        if let location = locationManager.location {
            // In a real app, this would use UIActivityViewController
            print("Sharing location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        }
    }
    
    func markLocation() {
        if let location = locationManager.location {
            let newPlace = Place(
                name: "Marked Location", 
                address: "", 
                coordinate: location.coordinate, 
                type: .custom, 
                icon: "mappin"
            )
            
            // Add the new place to our list
            places.append(newPlace)
            
            // Select the new place
            selectedPlace = newPlace
            
            print("Marked location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
        }
    }
    
    func reportIssue() {
        print("Reporting map issue")
        // This would typically open a form to report a map issue
    }
}

enum MapState {
    case idle
    case tracking
    case navigating(to: Place)
    case searching
}
