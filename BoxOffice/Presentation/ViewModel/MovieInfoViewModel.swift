//
//  MovieInfoViewModel.swift
//  BoxOffice
//
//  Created by termblur on 2/24/24.
//

import Foundation

import RxSwift
import RxCocoa

final class MovieInfoViewModel: ViewModel {
    struct Input {
        let movieCode: Observable<String>
    }
    
    struct Output {
        let movieName: Driver<String>
        let movieEnglishName: Driver<String>
        let showTime: Driver<String>
        let produecedYear: Driver<String>
        let openDate: Driver<String>
    }
    
    private let bag = DisposeBag()
    private let movieInfoRepository: MovieInfoRepository
    
    init(movieInfoRepository: MovieInfoRepository) {
        self.movieInfoRepository = movieInfoRepository
    }
    
    func transform(input: Input) -> Output {
        let movieName = BehaviorSubject<String>(value: "-")
        let movieEnglishName = BehaviorSubject<String>(value: "-")
        let showTime = BehaviorSubject<String>(value: "-")
        let produecedYear = BehaviorSubject<String>(value: "-")
        let openDate = BehaviorSubject<String>(value: "-")

        input.movieCode
            .compactMap { [weak self] in
                self?.movieInfoRepository.requestMovieInfo(movieCode: $0)
            }
            .flatMap { $0 }
            .subscribe(onNext: {
                movieName.onNext($0.movieName)
                movieEnglishName.onNext($0.movieEnglishName)
                showTime.onNext($0.showTime)
                produecedYear.onNext($0.producedYear)
                openDate.onNext($0.openDate)
            })
            .disposed(by: bag)
        
        return Output(
            movieName: movieName.asDriver(onErrorJustReturn: "-"),
            movieEnglishName: movieEnglishName.asDriver(onErrorJustReturn: "-"),
            showTime: showTime.asDriver(onErrorJustReturn: "-"),
            produecedYear: produecedYear.asDriver(onErrorJustReturn: "-"),
            openDate: openDate.asDriver(onErrorJustReturn: "-")
        )
    }
}
