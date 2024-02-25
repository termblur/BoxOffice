//
//  MovieInfoView.swift
//  BoxOffcie_SwiftUI
//
//  Created by termblur on 2/25/24.
//

import SwiftUI

struct MovieInfoView: View {
    @EnvironmentObject private var vm: ViewModel
    
    @State private var movieTitle: String = "-"
    @State private var movieEnglishTitle: String = "-"
    @State private var runningTime: String = "-"
    @State private var productionYear: String = "-"
    @State private var openDate: String = "-"
    @State private var isLoading: Bool = true
    
    let movieCode: String
    private let betweenSectionSpace: CGFloat = 40
    private let inSectionSpace: CGFloat = 10
    
    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
                    .controlSize(.regular)
                    .zIndex(1)
            } else {
                VStack {
                    Spacer()
                    HStack {
                        Text("movieName".localized())
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    Spacer()
                        .frame(height: inSectionSpace)
                    Text(movieTitle)
                        .bold()
                    Spacer()
                        .frame(height: betweenSectionSpace)
                    
                    HStack {
                        Text("movieEnglishName".localized())
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    Spacer()
                        .frame(height: inSectionSpace)
                    Text(movieEnglishTitle)
                        .bold()
                    Spacer()
                        .frame(height: betweenSectionSpace)
                    
                    HStack {
                        Text("showTime".localized())
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    Spacer()
                        .frame(height: inSectionSpace)
                    Text(runningTime + "minute".localized())
                        .bold()
                    Spacer()
                        .frame(height: betweenSectionSpace)
                    
                    HStack {
                        Text("produecedYear".localized())
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    Spacer()
                        .frame(height: inSectionSpace)
                    Text(productionYear)
                        .bold()
                    Spacer()
                        .frame(height: betweenSectionSpace)
                    
                    HStack {
                        Text("openDate".localized())
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    Spacer()
                        .frame(height: inSectionSpace)
                    Text(openDate)
                        .bold()
                    Spacer()
                }
                .lineLimit(1)
                .padding(.horizontal, 15)
            }
        }
        .task {
            do {
                isLoading = true
                let movieInfo = try await vm.movieInfoRepository.requestMovieInfo(movieCode: movieCode)
                movieTitle = movieInfo.movieName
                movieEnglishTitle = movieInfo.movieEnglishName
                runningTime = movieInfo.showTime
                productionYear = movieInfo.producedYear
                openDate = movieInfo.openDate
                isLoading = false
            } catch {
                debugPrint(Errors.failedFetchMovieInfo.localizedDescription)
                isLoading = false
            }
        }
    }
}
