//
//  MovieInfo.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

struct MovieInfo: Decodable {
    let movieCD: String
    let movieNm: String
    let movieNmEn: String
    let movieNmOg: String
    let showTm: String
    let prdtYear: String
    let openDt: String
    let prdtStatNm: String
    let typeNm: String
    let nations: [Nation]
    let genres: [Genre]
    let directors: [Director]
    let actors: [Actor]
    let showTypes: [ShowType]
    let companys: [Company]
    let audits: [Audit]

    enum CodingKeys: String, CodingKey {
        case movieCD = "movieCd"
        case movieNm = "movieNm"
        case movieNmEn = "movieNmEn"
        case movieNmOg = "movieNmOg"
        case showTm = "showTm"
        case prdtYear = "prdtYear"
        case openDt = "openDt"
        case prdtStatNm = "prdtStatNm"
        case typeNm = "typeNm"
        case nations = "nations"
        case genres = "genres"
        case directors = "directors"
        case actors = "actors"
        case showTypes = "showTypes"
        case companys = "companys"
        case audits = "audits"
    }
}
