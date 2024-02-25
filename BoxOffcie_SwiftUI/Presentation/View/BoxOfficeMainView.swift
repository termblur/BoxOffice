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
        VStack {
            Text("Box Office".localized())
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
                .frame(alignment: .leading)
                .padding(2)
                .id(calendarId)
                .onChange(of: vm.selectedDate) {
                    calendarId = UUID()
                }
                
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
            
            if isLoading == .finish {
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
            } else if isLoading == .loading {
                Spacer()
                ProgressView()
                    .controlSize(.large)
                Spacer()
            } else {
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
                    isLoading = weekBoxOffice.weeklyBoxOfficeList.isEmpty ? .nothing : .finish
                } catch {
                    debugPrint(Errors.failedFetchBoxOfficeList.localizedDescription)
                    isLoading = .nothing
                }
            }
        }
    }
}
