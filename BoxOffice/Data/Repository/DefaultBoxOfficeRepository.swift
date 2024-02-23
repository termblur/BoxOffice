//
//  DefaultBoxOfficeRepository.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

import Foundation

import Alamofire
import RxSwift


final class DefaultBoxOfficeRepository: BoxOfficeRepository {
    func requestWeeklyBoxOfficeList(targetDate: Date, weekType: WeekType) -> Single<MovieInfoResponse> {
        let url = BoxOffice.weeklyBoxOfficeListUrl
        let parameters: Parameters = [
            "key": BoxOffice.serviceKey,
            "targetDt": targetDate.toString(),
            "weekGb": weekType.rawValue
        ]
        
        return Single.create { single in
            let request = AF.request(url,
                                     method: .get,
                                     parameters: parameters,
                                     encoding: URLEncoding.default)
                .validate(statusCode: 200..<300)
                .responseDecodable(of: MovieInfoResponseDTO.self) { response in
                    switch response.result {
                    case .success(let data):
                        single(.success(data.toDomain()))
                    case .failure(let error):
                        single(.failure(error))
                    }
                }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}
