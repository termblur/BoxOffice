//
//  BoxOfficeListResponse.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

struct BoxOfficeListResponse {
    let boxofficeType: String
    let showRange: String
    let yearWeekTime: String
    let weeklyBoxOfficeList: [WeeklyBoxOffice]
}
