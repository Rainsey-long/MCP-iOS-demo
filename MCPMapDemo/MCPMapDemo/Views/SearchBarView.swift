import SwiftUI

struct SearchBarView: View {
    @Binding var showingSearchSheet: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    showingSearchSheet = true
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
                .background(Color(.systemGray6).opacity(0.8))
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
        .frame(height: 44)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(showingSearchSheet: .constant(false))
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.white)
    }
}
