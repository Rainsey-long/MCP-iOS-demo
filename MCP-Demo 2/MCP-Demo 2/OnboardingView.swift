import SwiftUI

struct OnboardingPage {
    let imageName: String
    let title: String
    let description: String
}

struct OnboardingPageView: View {
    let page: OnboardingPage

    var body: some View {
        ZStack {
            Image(systemName: page.imageName)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .clipped()
                .ignoresSafeArea()

            VStack(spacing: 12) {
                Spacer()
                VStack(spacing: 12) {
                    Text(page.title)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                    Text(page.description)
                        .font(.body)
                        .multilineTextAlignment(.center)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .cornerRadius(12)
                Spacer()
            }
            .padding()
        }
    }
}

struct OnboardingView: View {
    let pages: [OnboardingPage] = [
        .init(imageName: "sun.max.fill", title: "Welcome", description: "Discover daily mindfulness tips"),
        .init(imageName: "heart.text.square.fill", title: "Relax", description: "Simple exercises to calm your mind"),
        .init(imageName: "bolt.heart.fill", title: "Get Started", description: "Track your progress over time")
    ]

    @State private var currentIndex: Int = 0
    @State private var timer: Timer?

    var onFinished: () -> Void = {}

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentIndex) {
                ForEach(pages.indices, id: \.self) { index in
                    OnboardingPageView(page: pages[index])
                        .tag(index)
                        .onAppear { startTimer() }
                        .onDisappear { stopTimer() }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            .onChange(of: currentIndex) { _ in
                startTimer()
            }

            if currentIndex < pages.count - 1 {
                HStack(spacing: 8) {
                    ForEach(pages.indices, id: \.self) { index in
                        Circle()
                            .fill(index == currentIndex ? Color.primary : Color.secondary.opacity(0.5))
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.bottom, 20)
            } else {
                Button(action: onFinished) {
                    Text("Go to Home")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal, 40)
                        .padding(.bottom, 20)
                }
            }
        }
    }

    private func startTimer() {
        stopTimer()
        guard currentIndex < pages.count - 1 else { return }
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
            withAnimation {
                currentIndex += 1
            }
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    OnboardingView()
}
