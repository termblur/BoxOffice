//
//  MainViewModel.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

import Foundation

import RxSwift
import RxCocoa

final class MainViewModel: ViewModel {
    struct Input {
        let searchButtonTapped: Driver<Void>
        let selectedDate: Observable<Date>
        let weekType: Observable<Int>
    }
    
    struct Output {
        let boxOfficeList: Driver<[WeeklyBoxOffice]>
        let selectedDate: Signal<Date>
        let boxOfficeType: Driver<String>
        let dateRange: Driver<String>
    }
    
    private let bag = DisposeBag()
    private let BoxOfficeRepository: BoxOfficeRepository = DefaultBoxOfficeRepository()
    
    func transform(input: Input) -> Output {
        let boxOfficeList = PublishSubject<[WeeklyBoxOffice]>()
        let selectedDate = BehaviorSubject<Date>(value: .now)
        let weekType = BehaviorSubject<Int>(value: 0)
        let boxOfficeType = BehaviorSubject<String>(value: "-")
        let range = BehaviorSubject<String>(value: "-")
        
        input.selectedDate
            .subscribe(onNext: {
                selectedDate.onNext($0)
            })
            .disposed(by: bag)
        
        input.weekType
            .subscribe(onNext: {
                weekType.onNext($0)
            })
            .disposed(by: bag)
        
        input.searchButtonTapped
            .throttle(.milliseconds(500))
            .asObservable()
            .withLatestFrom(Observable.combineLatest(selectedDate, weekType))
            .compactMap { [weak self] in
                self?.BoxOfficeRepository.requestWeeklyBoxOfficeList(targetDate: $0, weekType: $1)
            }
            .flatMap { $0 }
            .subscribe(onNext: { result in
                boxOfficeList.onNext(result.weeklyBoxOfficeList)
                boxOfficeType.onNext(result.boxofficeType)
                range.onNext(result.showRange)
            })
            .disposed(by: bag)
        
        return Output(
            boxOfficeList: boxOfficeList.asDriver(onErrorJustReturn: []), 
            selectedDate: selectedDate.asSignal(onErrorJustReturn: .now),
            boxOfficeType: boxOfficeType.asDriver(onErrorJustReturn: "-"),
            dateRange: range.asDriver(onErrorJustReturn: "-")
        )
    }
}
