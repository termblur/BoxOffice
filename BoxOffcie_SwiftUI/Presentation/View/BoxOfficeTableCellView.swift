//
//  BoxOfficeTableCellView.swift
//  BoxOffcie_SwiftUI
//
//  Created by termblur on 2/25/24.
//

import SwiftUI

struct BoxOfficeTableCellView: View {
    let weeklyBoxOffcie: WeeklyBoxOffice
    private let descriptionWidth: CGFloat = 120
    
    var body: some View {
        NavigationLink(destination: MovieInfoView(movieCode: weeklyBoxOffcie.movieCD)) {
            VStack(alignment: .leading) {
                HStack {
                    Text("rank".localized())
                        .foregroundStyle(.secondary)
                        .frame(width: descriptionWidth, alignment: .leading)
                    Text(weeklyBoxOffcie.rank)
                    Spacer()
                }
                HStack {
                    Text("movieName".localized())
                        .foregroundStyle(.secondary)
                        .frame(width: descriptionWidth, alignment: .leading)
                    Text(weeklyBoxOffcie.movieNm)
                    Spacer()
                }
                .bold()
                HStack {
                    Text("openingDate".localized())
                        .foregroundStyle(.secondary)
                        .frame(width: descriptionWidth, alignment: .leading)
                    Text(weeklyBoxOffcie.openDt)
                    Spacer()
                }
                HStack {
                    Text("totalAudience".localized())
                        .foregroundStyle(.secondary)
                        .frame(width: descriptionWidth, alignment: .leading)
                    Text(weeklyBoxOffcie.audiAcc.withCommaAndUnit())
                    Spacer()
                }
            }
            .lineLimit(1)
            .foregroundStyle(.primary)
            
        }
    }
}
