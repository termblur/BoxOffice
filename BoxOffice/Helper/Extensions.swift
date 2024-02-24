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


extension String {
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
    
    func withCommaAndUnit() -> Self {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 0
        let number = NSNumber(value: Int64(self) ?? 0)
        return (formatter.string(from: number) ?? "0") + "person".localized()
    }
}
