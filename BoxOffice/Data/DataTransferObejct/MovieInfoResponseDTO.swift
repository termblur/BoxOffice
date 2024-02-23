//
//  MovieInfoResponseDTO.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

struct MovieInfoResponseDTO: Decodable {
    let movieInfoResult: MovieInfoResult

    enum CodingKeys: String, CodingKey {
        case movieInfoResult = "movieInfoResult"
    }
}

extension MovieInfoResponseDTO {
    func toDomain() -> MovieInfoResponse {
        return .init(
            movieName: self.movieInfoResult.movieInfo.movieNm,
            movieEnglishName: self.movieInfoResult.movieInfo.movieNmEn,
            showTime: self.movieInfoResult.movieInfo.showTm,
            producedYear: self.movieInfoResult.movieInfo.prdtYear,
            openDate: self.movieInfoResult.movieInfo.openDt
        )
    }
}
