//
//  String + Extension.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import Foundation

extension String {
    func getDateFromString() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let date = dateFormatter.date(from: self) ?? Date()
        return date
    }
}
