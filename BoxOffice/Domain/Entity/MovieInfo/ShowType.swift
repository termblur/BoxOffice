//
//  ShowType.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

struct ShowType: Decodable {
    let showTypeGroupNm: String
    let showTypeNm: String

    enum CodingKeys: String, CodingKey {
        case showTypeGroupNm = "showTypeGroupNm"
        case showTypeNm = "showTypeNm"
    }
}
