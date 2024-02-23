//
//  BoxOfficeResult.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

struct BoxOfficeResult: Decodable {
    let boxofficeType: String
    let showRange: String
    let yearWeekTime: String
    let weeklyBoxOfficeList: [WeeklyBoxOfficeList]

    enum CodingKeys: String, CodingKey {
        case boxofficeType = "boxofficeType"
        case showRange = "showRange"
        case yearWeekTime = "yearWeekTime"
        case weeklyBoxOfficeList = "weeklyBoxOfficeList"
    }
}
