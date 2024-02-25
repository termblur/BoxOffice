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
                    
                }, label: {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("search".localized())
                    }
                })
                .buttonStyle(.borderedProminent)

            }
            
            Spacer()
        }
        .padding(5)
    }
}

#Preview {
    BoxOfficeMainView()
        .environmentObject(ViewModel())
}
