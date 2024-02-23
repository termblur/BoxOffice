//
//  MovieInfoResult.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

struct MovieInfoResult: Decodable {
    let movieInfo: MovieInfo
    let source: String

    enum CodingKeys: String, CodingKey {
        case movieInfo = "movieInfo"
        case source = "source"
    }
}
