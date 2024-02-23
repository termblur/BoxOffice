//
//  Audit.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

struct Audit: Decodable {
    let auditNo: String
    let watchGradeNm: String

    enum CodingKeys: String, CodingKey {
        case auditNo = "auditNo"
        case watchGradeNm = "watchGradeNm"
    }
}
