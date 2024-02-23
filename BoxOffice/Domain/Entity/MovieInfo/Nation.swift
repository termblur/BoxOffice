//
//  Nation.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

struct Nation: Decodable {
    let nationNm: String

    enum CodingKeys: String, CodingKey {
        case nationNm = "nationNm"
    }
}
