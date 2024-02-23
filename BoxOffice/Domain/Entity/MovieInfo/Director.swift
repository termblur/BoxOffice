//
//  Director.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

struct Director: Decodable {
    let peopleNm: String
    let peopleNmEn: String

    enum CodingKeys: String, CodingKey {
        case peopleNm = "peopleNm"
        case peopleNmEn = "peopleNmEn"
    }
}
