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
        label.textAlignment = .center
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
        label.textAlignment = .center
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
        label.textAlignment = .center
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
        label.textAlignment = .center
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
        label.textAlignment = .center
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
        let descriptionLabelLeadingSpace: CGFloat = 15
        let verticalLargeSpace: CGFloat = 40
        let verticalSmallSpace: CGFloat = 10
        let labelLeadingSpace: CGFloat = 5
        
        movieNameDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(descriptionLabelLeadingSpace)
            $0.bottom.equalTo(movieNameLabel.snp.top).offset(-verticalSmallSpace)
        }
        
        movieNameLabel.snp.makeConstraints {
            $0.bottom.equalTo(movieEnglishNameDescriptionLabel.snp.top).offset(-verticalLargeSpace)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(labelLeadingSpace)
        }
        
        movieEnglishNameDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(descriptionLabelLeadingSpace)
            $0.bottom.equalTo(movieEnglishNameLabel.snp.top).offset(-verticalSmallSpace)
        }
        
        movieEnglishNameLabel.snp.makeConstraints {
            $0.bottom.equalTo(runningTimeDescriptionLabel.snp.top).offset(-verticalLargeSpace)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(labelLeadingSpace)
        }
        
        runningTimeDescriptionLabel.snp.makeConstraints {
            $0.bottom.equalTo(runningTimeLabel.snp.top).offset(-verticalSmallSpace)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(descriptionLabelLeadingSpace)
        }
        
        runningTimeLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(labelLeadingSpace)
        }
        
        productionYearDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(descriptionLabelLeadingSpace)
            $0.top.equalTo(runningTimeLabel.snp.bottom).offset(verticalLargeSpace)
        }
        
        productionYearLabel.snp.makeConstraints {
            $0.top.equalTo(productionYearDescriptionLabel.snp.bottom).offset(verticalSmallSpace)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(labelLeadingSpace)
        }
        
        releaseDateDescriptionLabel.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(descriptionLabelLeadingSpace)
            $0.top.equalTo(productionYearLabel.snp.bottom).offset(verticalLargeSpace)
        }
        
        releaseDateLabel.snp.makeConstraints {
            $0.top.equalTo(releaseDateDescriptionLabel.snp.bottom).offset(verticalSmallSpace)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(labelLeadingSpace)
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
