import XCTest
import CoreLocation
@testable import MCP_Demo

final class MapViewModelTests: XCTestCase {
    
    var viewModel: MapViewModel!
    var locationManager: LocationManager!

    override func setUpWithError() throws {
        locationManager = LocationManager()
        viewModel = MapViewModel(locationManager: locationManager)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        locationManager = nil
    }

    func testInitialState() throws {
        // Test initial state of the view model
        XCTAssertEqual(viewModel.mapState, .idle)
        XCTAssertEqual(viewModel.searchText, "")
        XCTAssertFalse(viewModel.isSearching)
        XCTAssertFalse(viewModel.showSearchPanel)
        XCTAssertEqual(viewModel.temperature, 16)
    }
    
    func testPlacesInitialization() throws {
        // Test that places are initialized with sample data
        XCTAssertEqual(viewModel.places.count, 5)
        
        // Test that we have a home place
        XCTAssertNotNil(viewModel.places.first(where: { $0.type == .home }))
        
        // Test that we have a work place
        XCTAssertNotNil(viewModel.places.first(where: { $0.type == .work }))
        
        // Test that we have a parked car place
        XCTAssertNotNil(viewModel.places.first(where: { $0.type == .parkedCar }))
    }
    
    func testGuidesInitialization() throws {
        // Test that guides are initialized with sample data
        XCTAssertEqual(viewModel.guides.count, 2)
        
        // Test the first guide has a name and 3 places
        XCTAssertEqual(viewModel.guides[0].name, "New")
        XCTAssertEqual(viewModel.guides[0].placeCount, 3)
        XCTAssertNotNil(viewModel.guides[0].image)
        
        // Test the second guide is for creating new guides
        XCTAssertEqual(viewModel.guides[1].name, "New Guide")
        XCTAssertEqual(viewModel.guides[1].placeCount, 0)
        XCTAssertNil(viewModel.guides[1].image)
    }
    
    func testToggleSearchPanel() throws {
        // Test initial state
        XCTAssertFalse(viewModel.showSearchPanel)
        
        // Toggle search panel
        viewModel.toggleSearchPanel()
        XCTAssertTrue(viewModel.showSearchPanel)
        
        // Toggle again
        viewModel.toggleSearchPanel()
        XCTAssertFalse(viewModel.showSearchPanel)
    }
}
