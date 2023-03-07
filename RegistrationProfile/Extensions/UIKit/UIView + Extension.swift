//
//  UIView + Extension.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import UIKit

extension UIView {

    func addView(_ view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
