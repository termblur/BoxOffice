//
//  MovieInfoRepository.swift
//  BoxOffice
//
//  Created by termblur on 2/24/24.
//

import Foundation

import RxSwift


protocol MovieInfoRepository {
    func requestMovieInfo(movieCode: String) -> Single<MovieInfoResponse>
}
