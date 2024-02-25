//
//  BoxOfficeRepository.swift
//  BoxOffcie_SwiftUI
//
//  Created by termblur on 2/25/24.
//

import Foundation

protocol BoxOfficeRepository {
    func requestWeeklyBoxOfficeList(targetDate: Date, weekType: Int) async throws -> BoxOfficeListResponse
}
