//
//  BoxOfficeViewController.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

import UIKit

import SnapKit
import RxSwift
import RxCocoa

final class BoxOfficeViewController: UIViewController {
    // MARK: - Properties

    let viewModel: BoxOfficeViewModel
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Box Office".localized()
        return label
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let items = [
            "Week(Mon~Sun)".localized(),
            "Weekends(Fri~Sun)".localized(),
            "Weekdays(Mon-Thu)".localized()
        ]
        let control = UISegmentedControl(items: items)
        control.selectedSegmentIndex = 0
        return control
    }()
    
    private let dateDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.text = "As of the Date:".localized()
        return label
    }()
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.date = Date()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .compact
        picker.locale = .current
        picker.showsMenuAsPrimaryAction = true
        return picker
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 10))
        var config = UIButton.Configuration.filled()
        config.title = "search".localized()
        config.image = UIImage(systemName: "magnifyingglass",
                               withConfiguration: imageConfig)
        config.imagePlacement = .leading
        config.imagePadding = 3
        button.configuration = config
        return button
    }()
    
    private let boxOfficeTypeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.text = "boxOfficeType".localized()
        return label
    }()
    
    private let boxOfficeTypeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    private let rangeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.text = "showRange".localized()
        return label
    }()
    
    private let rangeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.isScrollEnabled = true
        table.showsVerticalScrollIndicator = true
        table.showsHorizontalScrollIndicator = false
        table.allowsSelection = true
        table.separatorStyle = .singleLine
        table.separatorColor = .systemGray
        table.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        table.rowHeight = 100
        table.register(TableViewCell.self,
                       forCellReuseIdentifier: TableViewCell.id)
        return table
    }()
    
    private let emptyTableDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.text = "No data as of the Date🥲".localized()
        label.isHidden = true
        return label
    }()
    
    
    let blockView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .systemGray3
        return view
    }()
    
    private let blockImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .white
        view.image = UIImage(systemName: "antenna.radiowaves.left.and.right.slash")?.withRenderingMode(.alwaysOriginal)
        return view
    }()
    
    private var tableDataSource: UITableViewDiffableDataSource<TableViewSectionKind, WeeklyBoxOffice>?
    
    private lazy var input = BoxOfficeViewModel.Input(
        searchButtonTapped: searchButton.rx.tap.asDriver(),
        selectedDate: datePicker.rx.date.asObservable(),
        weekType: segmentedControl.rx.selectedSegmentIndex.asObservable()
    )
    private lazy var output = viewModel.transform(input: input)
    private let bag = DisposeBag()
    var boxOfficeList: [WeeklyBoxOffice] = []
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        layout()
        bind(output: output)
        configureViews()
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(viewModel: BoxOfficeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    // MARK: - Methods
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(segmentedControl)
        view.addSubview(dateDescriptionLabel)
        view.addSubview(datePicker)
        view.addSubview(searchButton)
        view.addSubview(boxOfficeTypeDescriptionLabel)
        view.addSubview(boxOfficeTypeLabel)
        view.addSubview(rangeDescriptionLabel)
        view.addSubview(rangeLabel)
        view.addSubview(tableView)
        tableView.addSubview(emptyTableDescriptionLabel)
        view.addSubview(blockView)
        blockView.addSubview(blockImageView)
    }
    
    private func layout() {
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(5)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
        }
        
        dateDescriptionLabel.snp.makeConstraints {
            $0.centerY.equalTo(searchButton.snp.centerY)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(5)
        }
        
        datePicker.snp.makeConstraints {
            $0.centerY.equalTo(searchButton.snp.centerY)
            $0.leading.equalTo(dateDescriptionLabel.snp.trailing)
        }
        
        searchButton.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(10)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(5)
        }
        
        boxOfficeTypeDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(searchButton.snp.bottom).offset(10)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(5)
        }
        
        boxOfficeTypeLabel.snp.makeConstraints {
            $0.top.equalTo(searchButton.snp.bottom).offset(10)
            $0.leading.equalTo(boxOfficeTypeDescriptionLabel.snp.trailing)
        }
        
        rangeDescriptionLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        rangeDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(searchButton.snp.bottom).offset(10)
            $0.leading.equalTo(view.snp.centerX)
        }
        
        rangeLabel.snp.makeConstraints {
            $0.top.equalTo(searchButton.snp.bottom).offset(10)
            $0.leading.equalTo(rangeDescriptionLabel.snp.trailing)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(5)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(boxOfficeTypeDescriptionLabel.snp.bottom).offset(10)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(5)
        }
        
        emptyTableDescriptionLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        blockView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        blockImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.width.equalTo(100)
        }
    }
    
    private func bind(output: BoxOfficeViewModel.Output) {
        output.boxOfficeList
            .drive(onNext: { [weak self] in
                self?.emptyTableDescriptionLabel.isHidden = $0.isEmpty ? false : true
                self?.boxOfficeList = $0
                self?.applySnapshot(box: $0)
            })
            .disposed(by: bag)
        
        output.selectedDate
            .emit(onNext: { [weak self] _ in
                self?.dismiss(animated: false)
            })
            .disposed(by: bag)
        
        output.boxOfficeType
            .drive(onNext: { [weak self] in
                self?.boxOfficeTypeLabel.text = $0
            })
            .disposed(by: bag)
        
        output.dateRange
            .drive(onNext: { [weak self] in
                self?.rangeLabel.text = $0
            })
            .disposed(by: bag)
    }
    
    private func configureViews() {
        self.view.backgroundColor = .systemBackground
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    private func configureTableView() {
        self.tableDataSource = UITableViewDiffableDataSource(
            tableView: tableView,
            cellProvider: { tableView, indexPath, item -> UITableViewCell? in
                let cell = TableViewCell(style: .default, reuseIdentifier: TableViewCell.id)
                cell.fill(box: item)
                return cell
            })
    }
    
    func applySnapshot(box: [WeeklyBoxOffice]) {
        var snapshot = NSDiffableDataSourceSnapshot<TableViewSectionKind, WeeklyBoxOffice>()
        snapshot.appendSections(TableViewSectionKind.allCases)
        snapshot.appendItems(box, toSection: .main)
        self.tableDataSource?.apply(snapshot, animatingDifferences: true)
    }
}

