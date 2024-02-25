//
//  DefaultBoxOfficeRepository.swift
//  BoxOffcie_SwiftUI
//
//  Created by termblur on 2/25/24.
//

import Foundation

final class DefaultBoxOfficeRepository: BoxOfficeRepository {
    func requestWeeklyBoxOfficeList(targetDate: Date, weekType: Int) async throws -> BoxOfficeListResponse {
        var urlComponent = URLComponents(string: BoxOffice.movieInfoUrl)
        let queryItems = [
            URLQueryItem(name: "key", value: BoxOffice.serviceKey),
            URLQueryItem(name: "targetDt", value: targetDate.toString()),
            URLQueryItem(name: "weekGb", value: String(weekType))
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
        let result = try JSONDecoder().decode(BoxOfficeListResponseDTO.self, from: data)
        return result.toDomain()
    }
}
