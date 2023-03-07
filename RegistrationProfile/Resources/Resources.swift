//
//  Resources.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import UIKit

enum Resources {
    enum NameFields: String, CaseIterable {
        case firstName = "Имя"
        case secondName = "Фамилия"
        case thirdName = "Отчество"
        case birdthDay = "Дата рождения"
        case sex = "Пол"
    }

    enum Sex: String, CaseIterable {
        case noSpecifide = "Не указано"
        case man = "Мужской"
        case woman = "Женский"
    }

    enum Fonts {
        static func avenirNextRegular(with size: CGFloat) -> UIFont? {
            UIFont(name: "Avenir Next", size: size)
        }
    }
}
