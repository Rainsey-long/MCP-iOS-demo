import SwiftUI

struct MapControlPanel: View {
    @ObservedObject var viewModel: MapViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            // Map button
            ControlButton(icon: "map.fill", action: {
                // Toggle map style
            })
            
            // Compass button
            ControlButton(icon: "location.north.fill", action: {
                // Reset map orientation
            })
        }
        .padding(8)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct TemperatureView: View {
    var temperature: Int
    
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: "sun.max.fill")
                .foregroundColor(.gray)
            
            Text("\(temperature)°")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.primary)
        }
        .padding(8)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct SearchBarButton: View {
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                Text("Search Maps")
                    .foregroundColor(.gray)
                
                Spacer()
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 36, height: 36)
                    .overlay(
                        Text("AA")
                            .font(.caption)
                            .foregroundColor(.white)
                    )
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
    }
}

struct ControlButton: View {
    var icon: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(.primary)
                .frame(width: 44, height: 44)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
        }
    }
}
