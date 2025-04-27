import SwiftUI

struct SearchPanel: View {
    @ObservedObject var viewModel: MapViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // Search header
            SearchHeader(
                searchText: $viewModel.searchText,
                isSearching: viewModel.isSearching,
                onClose: { isPresented = false }
            )
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Siri Suggestions section
                    SectionHeader(title: "Siri Suggestions")
                    
                    if let parkedCar = viewModel.places.first(where: { $0.type == .parkedCar }) {
                        PlaceCard(place: parkedCar, showAddress: true)
                    }
                    
                    // Favorites section
                    HStack {
                        Text("Favorites")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Button("More") {
                            // Show more favorites
                        }
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            // Home
                            FavoriteCard(
                                icon: "house.fill",
                                iconColor: .blue,
                                title: "Home",
                                subtitle: "Add"
                            )
                            
                            // Work
                            FavoriteCard(
                                icon: "briefcase.fill",
                                iconColor: .blue,
                                title: "Work",
                                subtitle: "Add"
                            )
                            
                            // Add button
                            FavoriteCard(
                                icon: "plus",
                                iconColor: .blue,
                                title: "Add",
                                subtitle: nil
                            )
                        }
                        .padding(.horizontal)
                    }
                    
                    // Recent places section
                    SectionHeader(title: "Recent")
                    
                    ForEach(viewModel.places.filter { $0.type == .recent }) { place in
                        PlaceCard(place: place, showAddress: false)
                    }
                    
                    // My Guides section
                    SectionHeader(title: "My Guides")
                    
                    ForEach(viewModel.guides) { guide in
                        GuideCard(guide: guide)
                    }
                    
                    // System options section
                    SystemOptionButton(title: "Share My Location") {
                        viewModel.shareLocation()
                        isPresented = false
                    }
                    
                    SystemOptionButton(title: "Mark My Location") {
                        viewModel.markLocation()
                        isPresented = false
                    }
                    
                    SystemOptionButton(title: "Report an Issue") {
                        viewModel.reportIssue()
                        isPresented = false
                    }
                    
                    // Terms and conditions footer
                    HStack {
                        Text("Terms & Conditions")
                            .font(.footnote)
                            .foregroundColor(.gray)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.top)
                }
                .padding()
            }
        }
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10, corners: [.topLeft, .topRight])
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: -2)
    }
}

struct SearchHeader: View {
    @Binding var searchText: String
    var isSearching: Bool
    var onClose: () -> Void
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Search Maps", text: $searchText)
                    .foregroundColor(.primary)
                
                if !searchText.isEmpty {
                    Button(action: {
                        searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
                
                if isSearching {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
            .padding(8)
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
            
            Button(action: onClose) {
                Image("user_avatar")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .overlay(
                        Text("AA")
                            .font(.caption)
                            .foregroundColor(.white)
                    )
            }
        }
        .padding()
        .background(Color(UIColor.systemBackground))
    }
}

struct SectionHeader: View {
    var title: String
    
    var body: some View {
        Text(title)
            .font(.subheadline)
            .foregroundColor(.secondary)
            .padding(.top, 5)
    }
}

struct PlaceCard: View {
    var place: Place
    var showAddress: Bool
    
    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 40, height: 40)
                
                Image(systemName: place.icon)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading) {
                Text(place.name)
                    .font(.body)
                    .foregroundColor(.primary)
                
                if showAddress && !place.address.isEmpty {
                    Text(place.address)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground).opacity(0.5))
        .cornerRadius(10)
    }
}

struct FavoriteCard: View {
    var icon: String
    var iconColor: Color
    var title: String
    var subtitle: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 36, height: 36)
                
                Image(systemName: icon)
                    .font(.system(size: 16))
                    .foregroundColor(iconColor)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.body)
                    .foregroundColor(.primary)
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.blue)
                }
            }
        }
        .frame(width: 100, alignment: .leading)
    }
}

struct GuideCard: View {
    var guide: Guide
    
    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 40, height: 40)
                
                if let _ = guide.image {
                    // In a real app, we would load the image here
                    // For now, just show a placeholder
                    Color.blue.opacity(0.5)
                        .cornerRadius(8)
                        .frame(width: 40, height: 40)
                } else {
                    Image(systemName: "plus")
                        .font(.system(size: 16))
                        .foregroundColor(.blue)
                }
            }
            
            VStack(alignment: .leading) {
                Text(guide.name)
                    .font(.body)
                    .foregroundColor(guide.image == nil ? .blue : .primary)
                
                if guide.placeCount > 0 {
                    Text("\(guide.placeCount) places")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            
            Spacer()
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground).opacity(0.5))
        .cornerRadius(10)
    }
}

struct SystemOptionButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.body)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
    }
}

// Helper extension for rounded corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
