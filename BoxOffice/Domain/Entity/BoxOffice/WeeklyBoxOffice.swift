//
//  WeeklyBoxOffice.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

struct WeeklyBoxOffice: Decodable, Hashable {
    let rnum: String
    let rank: String
    let rankInten: String
    let rankOldAndNew: String
    let movieCD: String
    let movieNm: String
    let openDt: String
    let salesAmt: String
    let salesShare: String
    let salesInten: String
    let salesChange: String
    let salesAcc: String
    let audiCnt: String
    let audiInten: String
    let audiChange: String
    let audiAcc: String
    let scrnCnt: String
    let showCnt: String

    enum CodingKeys: String, CodingKey {
        case rnum = "rnum"
        case rank = "rank"
        case rankInten = "rankInten"
        case rankOldAndNew = "rankOldAndNew"
        case movieCD = "movieCd"
        case movieNm = "movieNm"
        case openDt = "openDt"
        case salesAmt = "salesAmt"
        case salesShare = "salesShare"
        case salesInten = "salesInten"
        case salesChange = "salesChange"
        case salesAcc = "salesAcc"
        case audiCnt = "audiCnt"
        case audiInten = "audiInten"
        case audiChange = "audiChange"
        case audiAcc = "audiAcc"
        case scrnCnt = "scrnCnt"
        case showCnt = "showCnt"
    }
}
