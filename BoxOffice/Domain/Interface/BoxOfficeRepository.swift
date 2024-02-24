//
//  BoxOfficeRepository.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

import Foundation

import RxSwift


protocol BoxOfficeRepository {
    func requestWeeklyBoxOfficeList(targetDate: Date, weekType: Int) -> Single<BoxOfficeListResponse>
}
