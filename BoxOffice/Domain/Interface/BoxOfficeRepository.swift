//
//  BoxOfficeRepository.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

import RxSwift

protocol BoxOfficeRepository {
    func requestWeeklyBoxOfficeList(targetDate: Date, weekType: WeekType) -> Single<MovieInfoResponse>
}
