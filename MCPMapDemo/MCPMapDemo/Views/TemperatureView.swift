import SwiftUI

struct TemperatureView: View {
    let temperature: String
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "sun.max.fill")
                .foregroundColor(.gray)
            
            Text(temperature)
                .font(.system(size: the17, weight: .semibold))
                .foregroundColor(.primary)
        }
        .padding(8)
        .background(Color(.systemBackground).opacity(0.8))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView(temperature: "16°")
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray.opacity(0.3))
    }
}
