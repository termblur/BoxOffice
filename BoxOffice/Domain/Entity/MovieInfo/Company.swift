//
//  Company.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

struct Company: Decodable {
    let companyCD: String
    let companyNm: String
    let companyNmEn: String
    let companyPartNm: String

    enum CodingKeys: String, CodingKey {
        case companyCD = "companyCd"
        case companyNm = "companyNm"
        case companyNmEn = "companyNmEn"
        case companyPartNm = "companyPartNm"
    }
}
