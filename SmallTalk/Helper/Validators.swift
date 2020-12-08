//
//  Validators.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 22.05.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import Foundation

class Validators {
    
    static func isFilled(username: String?, usersurname: String?, sex: String?, bithDate: String?) -> Bool {
        guard let sex = sex,
        let username = username,
        let usersurname = usersurname,
        let bithDate = bithDate,
        sex != "",
        usersurname != "",
        username != "",
        bithDate != "" else {
            return false
        }
        return true
    }
}
