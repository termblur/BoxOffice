//
//  BoxOfficeTableView.swift
//  BoxOffcie_SwiftUI
//
//  Created by termblur on 2/25/24.
//

import SwiftUI

struct BoxOfficeTableView: View {
    @EnvironmentObject private var vm: ViewModel
    
    var body: some View {
        List {
            ForEach(vm.weeklyBoxOfficeList, id: \.self) { boxOffice in
                BoxOfficeTableCellView(weeklyBoxOffcie: boxOffice)
            }
        }
        .listStyle(.plain)
    }
}
