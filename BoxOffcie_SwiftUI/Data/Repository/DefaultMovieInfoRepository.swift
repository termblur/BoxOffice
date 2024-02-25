//
//  DefaultMovieInfoRepository.swift
//  BoxOffcie_SwiftUI
//
//  Created by termblur on 2/25/24.
//

import Foundation

final class DefaultMovieInfoRepository: MovieInfoRepository {
    func requestMovieInfo(movieCode: String) async throws -> MovieInfoResponse {
        var urlComponent = URLComponents(string: BoxOffice.movieInfoUrl)
        let queryItems = [
            URLQueryItem(name: "key", value: BoxOffice.serviceKey),
            URLQueryItem(name: "movieCd", value: movieCode)
        ]
        urlComponent?.queryItems = queryItems
        guard let url = urlComponent?.url else { throw Errors.invalidURL }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode)
        else { throw Errors.invalidServer }
        let result = try JSONDecoder().decode(MovieInfoResponseDTO.self, from: data)
        return result.toDomain()
    }
}
