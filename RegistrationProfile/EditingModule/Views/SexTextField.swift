//
//  SexTextField.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import UIKit

class SexTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        placeholder = "Введите данные"
        textAlignment = .right
        tintColor = .clear
        font = Resources.Fonts.avenirNextRegular(with: 18)
    }
    //отключает возвожность передвигать курсор
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        !isFirstResponder
    }
}
