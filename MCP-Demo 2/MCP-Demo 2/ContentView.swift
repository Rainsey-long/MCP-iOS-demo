//
//  ContentView.swift
//  MCP-Demo 2
//
//  Created by Puthsarangsey LONG on 27/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showOnboarding = true

    var body: some View {
        Group {
            if showOnboarding {
                OnboardingView {
                    showOnboarding = false
                }
            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
