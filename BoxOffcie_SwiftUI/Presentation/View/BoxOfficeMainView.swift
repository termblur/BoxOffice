//
//  BoxOfficeMainView.swift
//  BoxOffcie_SwiftUI
//
//  Created by termblur on 2/25/24.
//

import SwiftUI

struct BoxOfficeMainView: View {
    @EnvironmentObject private var vm: ViewModel
    @State var calendarId: UUID = UUID()
    
    @State private var isTappedSearchButton: Bool = false
    @State private var isLoading: LoadingState = .nothing
    @State private var boxOfficeType: String = "-"
    @State private var showRange: String = "-"
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Box Office".localized() + " by SwiftUI")
                    .font(.title3)
                    .bold()
                Picker("", selection: $vm.weekType) {
                    Text("Week(Mon~Sun)".localized()).tag(0)
                    Text("Weekends(Fri~Sun)".localized()).tag(1)
                    Text("Weekdays(Mon-Thu)".localized()).tag(2)
                }
                .pickerStyle(.segmented)
                
                HStack {
                    Text("As of the Date:".localized())
                    DatePicker("",
                               selection: $vm.selectedDate,
                               displayedComponents: [.date])
                    .datePickerStyle(.compact)
                    .environment(\.locale, .current)
                    .labelsHidden()
                    
                    Spacer()
                    
                    Button(action: {
                        isTappedSearchButton.toggle()
                    }, label: {
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Text("search".localized())
                        }
                    })
                    .buttonStyle(.borderedProminent)
                    
                }
                
                switch isLoading {
                case .loading:
                    Spacer()
                    ProgressView()
                        .controlSize(.regular)
                    Spacer()
                case .finish:
                    HStack {
                        Text("boxOfficeType".localized())
                            .foregroundStyle(.secondary)
                        Text(boxOfficeType)
                            .bold()
                        Spacer()
                        Text("showRange".localized())
                            .foregroundStyle(.secondary)
                        Text(showRange)
                            .bold()
                    }
                    .font(.caption)
                    BoxOfficeTableView()
                case .finishButNoData:
                    Spacer()
                    Text("No data as of the Date🥲".localized())
                        .font(.headline)
                    Spacer()
                case .nothing:
                    Spacer()
                }
            }
            .padding(5)
            .onChange(of: isTappedSearchButton) {
                Task {
                    do {
                        isLoading = .loading
                        let weekBoxOffice = try await vm.boxOfficeRepository.requestWeeklyBoxOfficeList(targetDate: vm.selectedDate,
                                                                                                        weekType: vm.weekType)
                        vm.weeklyBoxOfficeList = weekBoxOffice.weeklyBoxOfficeList
                        showRange = weekBoxOffice.showRange
                        boxOfficeType = weekBoxOffice.boxofficeType
                        isLoading = weekBoxOffice.weeklyBoxOfficeList.isEmpty ? .finishButNoData : .finish
                    } catch {
                        debugPrint(Errors.failedFetchBoxOfficeList.localizedDescription)
                        isLoading = .nothing
                    }
                }
            }
        }
    }
}
