import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var locationManager: LocationManager
    @State private var showingSearchSheet = false
    
    var body: some View {
        ZStack(alignment: .top) {
            // Map View container
            MapContainerView()
                .edgesIgnoringSafeArea(.all)
            
            // Top search bar
            SearchBarView(showingSearchSheet: $showingSearchSheet)
                .padding(.horizontal)
                .padding(.top, 8)
            
            // Temperature indicator
            TemperatureView(temperature: "16°")
                .padding(.top, 100)
                .padding(.trailing, 16)
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            // Navigation controls
            MapControlsView()
                .padding(.trailing, 16)
                .padding(.top, 160)
                .frame(maxWidth: .infinity, alignment: .trailing)
                
            // Home indicator area
            if showingSearchSheet {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation {
                            showingSearchSheet = false
                        }
                    }
                
                SearchSheetView(isShowing: $showingSearchSheet)
                    .transition(.move(edge: .bottom))
            }
        }
        .sheet(isPresented: $showingSearchSheet) {
            SearchSheetView(isShowing: $showingSearchSheet)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LocationManager())
    }
}
