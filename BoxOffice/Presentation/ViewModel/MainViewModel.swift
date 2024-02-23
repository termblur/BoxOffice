//
//  MainViewModel.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

import RxSwift

final class MainViewModel: ViewModel {
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    private let bag = DisposeBag()
    private let movieInfoRepository: MovieInfoRepository = DefaultMovieInfoRepository()
    private let BoxOfficeRepository: BoxOfficeRepository = DefaultBoxOfficeRepository()
    
    func transform(input: Input) -> Output {
        
        
        return Output()
    }
}
