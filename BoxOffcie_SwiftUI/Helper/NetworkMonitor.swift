//
//  NetworkMonitor.swift
//  BoxOffcie_SwiftUI
//
//  Created by termblur on 2/25/24.
//

import SwiftUI
import Network

final class NetworkMonitor: ObservableObject {
    private let networkMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue(label: "Monitor")
    var isConnected = false

    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        networkMonitor.start(queue: workerQueue)
    }
}
