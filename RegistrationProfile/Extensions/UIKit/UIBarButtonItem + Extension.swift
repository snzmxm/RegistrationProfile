//
//  UIBarButtonItem + Extension.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import UIKit

extension UIBarButtonItem {
    static func createCustomButton(vc: UIViewController, selector: Selector) -> UIBarButtonItem {

        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "chevron.left")?.withRenderingMode(.alwaysTemplate),
                        for: .normal)
        button.setTitle("Назад", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.tintColor = .systemBlue
        button.addTarget(vc, action: selector, for: .touchUpInside)
        // кнопка назад и правильное ее расположение при бэк свайп(тут при айос 12)
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.imagePadding = 7
            configuration.contentInsets = .init(top: 0,
                                                leading: -7,
                                                bottom: 0,
                                                trailing: 0)
            button.configuration = configuration
        } else {
            button.titleEdgeInsets = .init(top: 0,
                                           left: 10,
                                           bottom: 0,
                                           right: -10)

        }

        let barItem = UIBarButtonItem(customView: button)
        return barItem
    }
}
