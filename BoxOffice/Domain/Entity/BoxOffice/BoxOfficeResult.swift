//
//  BoxOfficeResult.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

struct BoxOfficeResult: Decodable {
    let boxofficeType: String
    var showRange: String?
    var yearWeekTime: String?
    let weeklyBoxOfficeList: [WeeklyBoxOffice]

    enum CodingKeys: String, CodingKey {
        case boxofficeType = "boxofficeType"
        case showRange = "showRange"
        case yearWeekTime = "yearWeekTime"
        case weeklyBoxOfficeList = "weeklyBoxOfficeList"
    }
}
