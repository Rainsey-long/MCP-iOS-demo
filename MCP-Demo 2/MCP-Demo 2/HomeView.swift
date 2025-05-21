import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Welcome to MindCare")
                        .font(.largeTitle)
                        .bold()
                    Text("Daily mindfulness exercises and tips")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    HStack {
                        Spacer()
                        Image(systemName: "brain.head.profile")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .padding()
                        Spacer()
                    }
                }
                .padding()
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
}
