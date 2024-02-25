//
//  BoxOffcie_SwiftUIApp.swift
//  BoxOffcie_SwiftUI
//
//  Created by termblur on 2/25/24.
//

import SwiftUI

@main
struct BoxOffcie_SwiftUIApp: App {
    @Environment(\.scenePhase) var scenePhase
    @StateObject private var vm = ViewModel()
    @StateObject private var networkMonitor = NetworkMonitor()
    @State private var isConnectNetwork: Bool = true
    
    var body: some Scene {
        WindowGroup {
            Group {
                if isConnectNetwork {
                    BoxOfficeMainView()
                } else {
                    NetworkUnavailableView()
                }
            }
            .onChange(of: scenePhase) { _, newPhase in
                if newPhase == .active {
                    isConnectNetwork = networkMonitor.isConnected
                }
            }
        }
        .environmentObject(vm)
    }
}
