//
//  ViewModel.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

protocol ViewModel: AnyObject {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}
