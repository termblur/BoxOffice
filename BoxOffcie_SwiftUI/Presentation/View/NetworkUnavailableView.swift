//
//  NetworkUnavailableView.swift
//  BoxOffcie_SwiftUI
//
//  Created by termblur on 2/25/24.
//

import SwiftUI

struct NetworkUnavailableView: View {
    var body: some View {
        ContentUnavailableView(
            "FailAccess".localized(),
            systemImage: "wifi.exclamationmark",
            description: Text("Please Check Network Connection".localized())
        )
    }
}

#Preview {
    NetworkUnavailableView()
}
