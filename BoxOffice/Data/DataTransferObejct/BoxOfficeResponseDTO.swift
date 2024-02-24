//
//  BoxOfficeResponseDTO.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

struct BoxOfficeListResponseDTO: Decodable {
    let boxOfficeResult: BoxOfficeResult

    enum CodingKeys: String, CodingKey {
        case boxOfficeResult = "boxOfficeResult"
    }
}

extension BoxOfficeListResponseDTO {
    func toDomain() -> BoxOfficeListResponse {
        return .init(
            boxofficeType: self.boxOfficeResult.boxofficeType,
            showRange: self.boxOfficeResult.showRange ?? "-",
            yearWeekTime: self.boxOfficeResult.yearWeekTime ?? "-",
            weeklyBoxOfficeList: self.boxOfficeResult.weeklyBoxOfficeList
        )
    }
}
