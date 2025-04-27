import SwiftUI

struct SearchSheetView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            // Search bar at top
            HStack {
                Button(action: {
                    withAnimation {
                        isShowing = false
                    }
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        Text("Search Maps")
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                }
                
                Button(action: {
                    // Profile action
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 36, height: 36)
                        
                        Text("AA")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 16)
            .padding(.bottom, 8)
            .background(Color(.systemBackground))
            
            // Scroll content
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Siri Suggestions
                    SectionHeaderView(title: "Siri Suggestions")
                    
                    ParkedCarView()
                    
                    // Favorites
                    FavoritesHeaderView()
                    
                    FavoritesView()
                    
                    // Recent
                    SectionHeaderView(title: "Recent")
                    
                    RecentSearchesView()
                    
                    // My Guides
                    SectionHeaderView(title: "My Guides")
                    
                    GuidesView()
                    
                    // System options
                    SystemOptionsView()
                    
                    // Terms and conditions
                    TermsView()
                    
                    // Extra space at bottom
                    Spacer()
                        .frame(height: 50)
                }
                .padding(.horizontal)
            }
            .background(Color(.systemBackground))
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SectionHeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.subheadline)
            .foregroundColor(.gray)
            .padding(.top, 8)
    }
}

struct FavoritesHeaderView: View {
    var body: some View {
        HStack {
            Text("Favorites")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Spacer()
            
            Text("More")
                .font(.subheadline)
                .foregroundColor(.blue)
        }
        .padding(.top, 8)
    }
}

struct ParkedCarView: View {
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 36, height: 36)
                
                Image(systemName: "car.fill")
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Parked Car")
                    .font(.system(size: 16, weight: .medium))
                
                Text("290 m away, near ulica Krasnoarmejska")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(12)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

struct FavoritesView: View {
    var body: some View {
        HStack(spacing: 12) {
            // Home
            VStack(spacing: 6) {
                ZStack {
                    Circle()
                        .fill(Color(.systemGray5))
                        .frame(width: 40, height: 40)
                    
                    Image(systemName: "house.fill")
                        .foregroundColor(.blue)
                }
                
                Text("Home")
                    .font(.system(size: 12))
                
                Text("Add")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            
            // Work
            VStack(spacing: 6) {
                ZStack {
                    Circle()
                        .fill(Color(.systemGray5))
                        .frame(width: 40, height: 40)
                    
                    Image(systemName: "briefcase.fill")
                        .foregroundColor(.blue)
                }
                
                Text("Work")
                    .font(.system(size: 12))
                
                Text("Add")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            
            // Add
            VStack(spacing: 6) {
                ZStack {
                    Circle()
                        .fill(Color(.systemGray5))
                        .frame(width: 40, height: 40)
                    
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
                
                Text("Add")
                    .font(.system(size: 12))
                
                Text(" ")
                    .font(.system(size: 12))
            }
            .frame(maxWidth: .infinity)
        }
        .padding(12)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

struct RecentSearchesView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(Color(.systemGray4))
                        .frame(width: 36, height: 36)
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                }
                
                Text("Shop Starazhytny, Zavodskaya str...")
                    .font(.system(size: 16, weight: .medium))
                    .lineLimit(1)
                
                Spacer()
            }
            .padding(12)
            .background(Color(.systemBackground))
            
            Divider()
                .padding(.leading, 60)
            
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(Color(.systemGray4))
                        .frame(width: 36, height: 36)
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                }
                
                Text("Voenkomat, Oktyabrskaya 13")
                    .font(.system(size: 16, weight: .medium))
                
                Spacer()
            }
            .padding(12)
            .background(Color(.systemBackground))
        }
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

struct GuidesView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 36, height: 36)
                    .cornerRadius(6)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("New")
                        .font(.system(size: 16, weight: .medium))
                    
                    Text("3 places")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding(12)
            .background(Color(.systemBackground))
            
            Divider()
                .padding(.leading, 60)
            
            HStack(spacing: 12) {
                ZStack {
                    Rectangle()
                        .fill(Color(.systemGray5))
                        .frame(width: 36, height: 36)
                        .cornerRadius(6)
                    
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                }
                
                Text("New Guide")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.blue)
                
                Spacer()
            }
            .padding(12)
            .background(Color(.systemBackground))
        }
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

struct SystemOptionsView: View {
    var body: some View {
        VStack(spacing: 8) {
            Button(action: {}) {
                Text("Share My Location")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 12)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
            }
            
            Button(action: {}) {
                Text("Mark My Location")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 12)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
            }
            
            Button(action: {}) {
                Text("Report an Issue")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.blue)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical, 12)
                    .background(Color(.systemGray5))
                    .cornerRadius(10)
            }
        }
    }
}

struct TermsView: View {
    var body: some View {
        HStack {
            Text("Terms & Conditions")
                .font(.system(size: 12))
                .foregroundColor(.secondary)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 12))
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 16)
    }
}

struct SearchSheetView_Previews: PreviewProvider {
    static var previews: some View {
        SearchSheetView(isShowing: .constant(true))
    }
}
