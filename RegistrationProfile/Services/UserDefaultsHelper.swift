//
//  UserDefaultsHelper.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import UIKit

final class UserDefaultsHelper {

    private static let defaults = UserDefaults.standard
    private static let userSessionKey = "userKey"
//получаем данные пользователя
    static func getUserDictionary() -> [String : String] {
        defaults.value(forKey: userSessionKey) as? [String : String] ?? [:]
    }
//сохраняем данные пользователя
    static func saveUserValue(_ key: String, _ value: String) {
        var userDictionary = getUserDictionary()
        userDictionary[key] = value
        defaults.set(userDictionary, forKey: userSessionKey)
    }

//передаем данные в модель
    static func getUserModel() -> UserModel {
        var userModel = UserModel()

        let userDictionary = getUserDictionary()
        userModel.firstName = userDictionary[Resources.NameFields.firstName.rawValue] ?? ""
        userModel.secondName = userDictionary[Resources.NameFields.secondName.rawValue] ?? ""
        userModel.thirdName = userDictionary[Resources.NameFields.thirdName.rawValue] ?? ""
        userModel.birdthDay = userDictionary[Resources.NameFields.birdthDay.rawValue] ?? ""
        userModel.sex = userDictionary[Resources.NameFields.sex.rawValue] ?? ""

        return userModel
    }

    //метод выдает значение по ключу
    static func getUserValue(_ key: String) -> String {
        let userDictionary = getUserDictionary()
        let stringValue = userDictionary[key] ?? ""
        return stringValue
    }

    static func saveuserImage(image: UIImage) {
        //сжимаем изображение в половину
        guard let data = image.jpegData(compressionQuality: 0.5) else { return }
        defaults.set(data, forKey: "userPhoto")
    }

    static func loadUserImage() -> UIImage {
        guard let data = defaults.data(forKey: "userPhoto"),
                let image = UIImage(data: data) else {
            return UIImage()
        }
        return image
    }
}
