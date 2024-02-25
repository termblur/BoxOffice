//
//  MovieInfoRepository.swift
//  BoxOffcie_SwiftUI
//
//  Created by termblur on 2/25/24.
//

protocol MovieInfoRepository {
    func requestMovieInfo(movieCode: String) async throws -> MovieInfoResponse
}
