import XCTest
@testable import MCPMapDemo

class MCPMapDemoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPlaceCreation() throws {
        let place = Place(name: "Test Place", address: "123 Test St", latitude: 37.7749, longitude: -122.4194)
        XCTAssertEqual(place.name, "Test Place")
        XCTAssertEqual(place.address, "123 Test St")
        XCTAssertEqual(place.latitude, 37.7749)
        XCTAssertEqual(place.longitude, -122.4194)
        XCTAssertFalse(place.isFavorite)
        XCTAssertEqual(place.category, .other)
    }
    
    func testPlaceStore() throws {
        let store = PlaceStore()
        let initialFavoritesCount = store.favorites.count
        
        let newPlace = Place(name: "New Test Place", address: "456 Test Ave", latitude: 37.7749, longitude: -122.4194)
        store.addFavorite(newPlace)
        
        XCTAssertEqual(store.favorites.count, initialFavoritesCount + 1)
        XCTAssertTrue(store.favorites.contains(where: { $0.id == newPlace.id }))
        
        store.removeFavorite(newPlace)
        XCTAssertEqual(store.favorites.count, initialFavoritesCount)
        XCTAssertFalse(store.favorites.contains(where: { $0.id == newPlace.id }))
    }
    
    func testRecentPlaces() throws {
        let store = PlaceStore()
        let initialRecentsCount = store.recents.count
        
        let newPlace = Place(name: "Recent Test Place", address: "789 Recent Blvd", latitude: 37.7749, longitude: -122.4194)
        store.addRecent(newPlace)
        
        XCTAssertEqual(store.recents.count, min(initialRecentsCount + 1, 10))
        XCTAssertTrue(store.recents.contains(where: { $0.id == newPlace.id }))
        XCTAssertEqual(store.recents.first?.id, newPlace.id) // Should be at the beginning
    }
}
