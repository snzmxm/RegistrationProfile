//
//  UITableView + Extension.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import UIKit

extension UITableView {

    func register(_ type: UITableViewCell.Type) {
        let className = String(describing: type)
        register(type, forCellReuseIdentifier: className)
    }

    func dequeReusableCell<T>(_ type: T.Type) -> T? {
        let className = String(describing: type)
        return dequeueReusableCell(withIdentifier: className) as? T
    }
}
