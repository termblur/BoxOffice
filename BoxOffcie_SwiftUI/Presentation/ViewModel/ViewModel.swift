//
//  ViewModel.swift
//  BoxOffcie_SwiftUI
//
//  Created by termblur on 2/25/24.
//

import SwiftUI

final class ViewModel: ObservableObject {
    @Published var weekType: Int = 0
    @Published var selectedDate: Date = .now
    @Published var weeklyBoxOfficeList: [WeeklyBoxOffice] = []
    
    let boxOfficeRepository: BoxOfficeRepository = DefaultBoxOfficeRepository()
    let movieInfoRepository: MovieInfoRepository = DefaultMovieInfoRepository()
    
    
    
}
