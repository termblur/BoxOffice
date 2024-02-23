//
//  Genre.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

struct Genre: Decodable {
    let genreNm: String

    enum CodingKeys: String, CodingKey {
        case genreNm = "genreNm"
    }
}
