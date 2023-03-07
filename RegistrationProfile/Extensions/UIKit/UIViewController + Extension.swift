//
//  UIViewController + Extension.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import UIKit
//ALERT
extension UIViewController {
    func presentSimpleAlert(title: String, message: String?) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }

    func presentChangeAlert(completionHandler: @escaping (Bool) -> Void) {

        let alertController = UIAlertController(title: "Данные были изменены",
                                                message: "Вы желаете сохранить измения, в противном случае внесенные правки будут отменены",
                                                preferredStyle: .alert)

        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { _ in
            completionHandler(true)
        }

        let skipAction = UIAlertAction(title: "Пропусить", style: .default) { _ in
            completionHandler(false)
        }

        alertController.addAction(saveAction)
        alertController.addAction(skipAction)

        present(alertController, animated: true)
    }
}
