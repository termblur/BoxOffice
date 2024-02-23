//
//  Extensions.swift
//  BoxOffice
//
//  Created by STJANG on 2/23/24.
//

import Foundation

extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: self)
    }
    
}
