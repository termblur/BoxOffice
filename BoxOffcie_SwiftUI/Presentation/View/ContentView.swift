//
//  ContentView.swift
//  BoxOffcie_SwiftUI
//
//  Created by termblur on 2/25/24.
//

import SwiftUI

struct BoxOfficeView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("openDate".localized())
        }
        .padding()
    }
}

#Preview {
    BoxOfficeView()
}
