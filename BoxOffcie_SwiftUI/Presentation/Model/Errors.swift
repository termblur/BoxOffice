//
//  Errors.swift
//  BoxOffcie_SwiftUI
//
//  Created by termblur on 2/25/24.
//

import Foundation

enum Errors: Error {
    case invalidServer
    case invalidURL
}

extension Errors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidServer:
            return NSLocalizedString("Invalid Server Response", comment: "서버 응답이 없습니다.")
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "URL이 유효하지 않습니다.")
        }
    }
}
