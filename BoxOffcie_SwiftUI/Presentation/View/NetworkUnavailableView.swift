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
            "서버 접근이 어려워요😢",
            systemImage: "wifi.exclamationmark",
            description: Text("네트워크 연결 상태를 확인해 주세요.")
        )
    }
}

#Preview {
    NetworkUnavailableView()
}
