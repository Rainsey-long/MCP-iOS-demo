import SwiftUI

struct MapControlsView: View {
    @EnvironmentObject private var locationManager: LocationManager
    
    var body: some View {
        VStack(spacing: 8) {
            Button(action: {
                // Map control action
            }) {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.systemBackground))
                            .frame(width: 44, height: 44)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        
                        Image(systemName: "map")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.primary)
                    }
                }
            }
            
            Button(action: {
                // Compass action
                locationManager.centerOnUserLocation()
            }) {
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.systemBackground))
                            .frame(width: 44, height: 44)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        
                        Image(systemName: "location.north.fill")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

struct MapControlsView_Previews: PreviewProvider {
    static var previews: some View {
        MapControlsView()
            .environmentObject(LocationManager())
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray.opacity(0.3))
    }
}
