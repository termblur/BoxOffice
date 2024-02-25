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
    case failedFetchMovieInfo
    case failedFetchBoxOfficeList
}

extension Errors: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidServer:
            return NSLocalizedString("Invalid Server Response", comment: "서버 응답이 없습니다.")
        case .invalidURL:
            return NSLocalizedString("Invalid URL", comment: "URL이 유효하지 않습니다.")
        case .failedFetchBoxOfficeList:
            return NSLocalizedString("Failed Fetch BoxOffice List", comment: "박스오피스 리스트 가져오기에 실패하였습니다.")
        case .failedFetchMovieInfo:
            return NSLocalizedString("Failed Fetch MovieInfo", comment: "영화 상세정보 가져오기에 실패하였습니다.")
        }
    }
}
