import Foundation

struct Guide: Identifiable {
    let id = UUID()
    let name: String
    let placeCount: Int
    let image: String? // Image name or nil for the default "plus" icon
    
    static var sampleGuides: [Guide] {
        [
            Guide(name: "New", placeCount: 3, image: "sample_image"),
            Guide(name: "New Guide", placeCount: 0, image: nil)
        ]
    }
}
