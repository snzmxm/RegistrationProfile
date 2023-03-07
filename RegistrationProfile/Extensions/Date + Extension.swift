//
//  Date + Extension.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import Foundation

extension Date {

    func getStringFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}
