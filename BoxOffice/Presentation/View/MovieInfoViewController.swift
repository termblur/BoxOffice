//
//  MovieInfoViewController.swift
//  BoxOffice
//
//  Created by termblur on 2/24/24.
//

import UIKit

import SnapKit
import RxSwift
import RxCocoa

final class MovieInfoViewController: UIViewController {
    // MARK: - Properties
    
    private let viewModel: MovieInfoViewModel
    private let movieCode: String
    
    private lazy var input = MovieInfoViewModel.Input(
        movieCode: Observable.just(movieCode)
    )
    private lazy var output = viewModel.transform(input: input)
    private let bag = DisposeBag()
    
//    let movieName: Driver<String>
//    let movieEnglishName: Driver<String>
//    let showTime: Driver<String>
//    let produecedYear: Driver<String>
//    let openDate: Driver<String>
    
    private let movieNameDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "movieName".localized()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let movieEnglishNameDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "movieEnglishName".localized()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let movieEnglishNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let runningTimeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "showTime".localized()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let runningTimeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let productionYearDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "produecedYear".localized()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let productionYearLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let releaseDateDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "openDate".localized()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        layout()
        bind(output: output)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: MovieInfoViewModel, movieCode: String) {
        self.viewModel = viewModel
        self.movieCode = movieCode
        super.init(nibName: nil, bundle: nil)
    }
    
    
    // MARK: - Methods
    
    private func addSubviews() {
        view.addSubview(movieNameDescriptionLabel)
        view.addSubview(movieNameLabel)
        view.addSubview(movieEnglishNameDescriptionLabel)
        view.addSubview(movieEnglishNameLabel)
        view.addSubview(runningTimeDescriptionLabel)
        view.addSubview(runningTimeLabel)
        view.addSubview(productionYearDescriptionLabel)
        view.addSubview(productionYearLabel)
        view.addSubview(releaseDateDescriptionLabel)
        view.addSubview(releaseDateLabel)
    }
    
    private func layout() {
        movieNameDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.bottom.equalTo(movieNameLabel.snp.top).offset(-10)
        }
        
        movieNameLabel.snp.makeConstraints {
            $0.bottom.equalTo(movieEnglishNameDescriptionLabel.snp.top).offset(-40)
            $0.centerX.equalToSuperview()
        }
        
        movieEnglishNameDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.bottom.equalTo(movieEnglishNameLabel.snp.top).offset(-10)
        }
        
        movieEnglishNameLabel.snp.makeConstraints {
            $0.bottom.equalTo(runningTimeDescriptionLabel.snp.top).offset(-40)
            $0.centerX.equalToSuperview()
        }
        
        runningTimeDescriptionLabel.snp.makeConstraints {
            $0.bottom.equalTo(runningTimeLabel.snp.top).offset(-10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
        }
        
        runningTimeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        productionYearDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.top.equalTo(runningTimeLabel.snp.bottom).offset(40)
        }
        
        productionYearLabel.snp.makeConstraints {
            $0.top.equalTo(productionYearDescriptionLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        releaseDateDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
            $0.top.equalTo(productionYearLabel.snp.bottom).offset(40)
        }
        
        releaseDateLabel.snp.makeConstraints {
            $0.top.equalTo(releaseDateDescriptionLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func bind(output: MovieInfoViewModel.Output) {
        output.movieName
            .drive(onNext: { [weak self] in
                self?.movieNameLabel.text = $0
            })
            .disposed(by: bag)
        
        output.movieEnglishName
            .drive(onNext: { [weak self] in
                self?.movieEnglishNameLabel.text = $0
            })
            .disposed(by: bag)
        
        output.showTime
            .drive(onNext: { [weak self] in
                self?.runningTimeLabel.text = $0 + "minute".localized()
            })
            .disposed(by: bag)
        
        output.produecedYear
            .drive(onNext: { [weak self] in
                self?.productionYearLabel.text = $0
            })
            .disposed(by: bag)
        
        output.openDate
            .drive(onNext: { [weak self] in
                self?.releaseDateLabel.text = $0
            })
            .disposed(by: bag)
    }
    
    private func configureViews() {
        self.view.backgroundColor = .systemBackground
    }
}
