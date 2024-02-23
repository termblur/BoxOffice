//
//  Actor.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

struct Actor: Decodable {
    let peopleNm: String
    let peopleNmEn: String
    let cast: String
    let castEn: String

    enum CodingKeys: String, CodingKey {
        case peopleNm = "peopleNm"
        case peopleNmEn = "peopleNmEn"
        case cast = "cast"
        case castEn = "castEn"
    }
}
