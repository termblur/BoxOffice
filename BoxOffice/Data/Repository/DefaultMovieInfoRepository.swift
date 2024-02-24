//
//  DefaultMovieInfoRepository.swift
//  BoxOffice
//
//  Created by termblur on 2/24/24.
//

import Foundation

import Alamofire
import RxSwift


final class DefaultMovieInfoRepository: MovieInfoRepository {
    func requestMovieInfo(movieCode: String) -> Single<MovieInfoResponse> {
        let url = BoxOffice.movieInfoUrl
        let parameters: Parameters = [
            "key": BoxOffice.serviceKey,
            "movieCd": movieCode
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
