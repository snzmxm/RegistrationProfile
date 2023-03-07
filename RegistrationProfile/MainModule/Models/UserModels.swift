//
//  UserModels.swift
//  RegistrationProfile
//
//  Created by SNZ on 07.03.2023.
//

import Foundation

struct UserModel {
    var firstName = ""
    var secondName = ""
    var thirdName = ""
    var birdthDay = ""
    var sex = ""

    //сравнивание наших моделей
    static func == (_ firstModel: UserModel, _ secondModel: UserModel) -> Bool {
        firstModel.firstName == secondModel.firstName &&
        firstModel.secondName == secondModel.secondName &&
        firstModel.thirdName == secondModel.thirdName &&
        firstModel.birdthDay == secondModel.birdthDay &&
        firstModel.sex == secondModel.sex
    }
}
