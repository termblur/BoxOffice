//
//  TableViewCell.swift
//  BoxOffice
//
//  Created by termblur on 2/23/24.
//

import UIKit

import SnapKit

final class TableViewCell: UITableViewCell {
    // MARK: - Properties
    
    static let id = "TableViewCell"
    
    private let rankDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "rank".localized()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    private let titleDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.text = "movieName".localized()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.numberOfLines = 1
        return label
    }()
    
    private let openDateDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "openingDate".localized()
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let openDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    private let audienceNumberDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .secondaryLabel
        label.text = "totalAudience".localized()
        return label
    }()
    
    private let audienceNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    
    // MARK: - Life Cycle
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubViews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods
    
    private func addSubViews() {
        contentView.addSubview(rankDescriptionLabel)
        contentView.addSubview(rankLabel)
        contentView.addSubview(titleDescriptionLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(openDateDescriptionLabel)
        contentView.addSubview(openDateLabel)
        contentView.addSubview(audienceNumberDescriptionLabel)
        contentView.addSubview(audienceNumberLabel)
    }
    
    private func layout() {
        rankDescriptionLabel.snp.makeConstraints {
            $0.bottom.equalTo(titleDescriptionLabel.snp.top).offset(-10)
            $0.leading.equalToSuperview().offset(10)
        }
        
        titleDescriptionLabel.snp.makeConstraints {
            $0.bottom.equalTo(contentView.snp.centerY).offset(-5)
            $0.leading.equalToSuperview().offset(10)
        }
        
        openDateDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.centerY).offset(5)
            $0.leading.equalToSuperview().offset(10)
        }
        
        audienceNumberDescriptionLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        audienceNumberDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(openDateDescriptionLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
        }
        
        rankLabel.snp.makeConstraints {
            $0.centerY.equalTo(rankDescriptionLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(5)
            $0.leading.equalTo(audienceNumberDescriptionLabel.snp.trailing).offset(30)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalTo(titleDescriptionLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(5)
            $0.leading.equalTo(audienceNumberDescriptionLabel.snp.trailing).offset(30)
        }
        
        openDateLabel.snp.makeConstraints {
            $0.centerY.equalTo(openDateDescriptionLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(5)
            $0.leading.equalTo(audienceNumberDescriptionLabel.snp.trailing).offset(30)
        }
        
        audienceNumberLabel.snp.makeConstraints {
            $0.centerY.equalTo(audienceNumberDescriptionLabel.snp.centerY)
            $0.trailing.equalToSuperview().inset(5)
            $0.leading.equalTo(audienceNumberDescriptionLabel.snp.trailing).offset(30)
        }
    }
    
    func fill(box: WeeklyBoxOffice) {
        self.rankLabel.text = box.rank
        self.titleLabel.text = box.movieNm
        self.openDateLabel.text = box.openDt
        self.audienceNumberLabel.text = box.audiAcc.withCommaAndUnit()
    }
}
