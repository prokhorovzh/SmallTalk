//
//  UserError.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 22.05.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import Foundation

enum UserError {
    case notFilled
    case photoNotExist
    case cannotGetUserInfo
    case cannotUnwrapToMUser
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Заполните все поля", comment: "")
        case .photoNotExist:
            return NSLocalizedString("Пользователь не выбрал фотографию", comment: "")
        case .cannotGetUserInfo:
            return NSLocalizedString("Невозможно загрузить информацию", comment: "")
        case .cannotUnwrapToMUser:
            return NSLocalizedString("Невозможно конвентировать MUser из User", comment: "")
        }
    }
}
