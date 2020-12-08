//
//  Muser.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 22.05.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import UIKit
import FirebaseFirestore

struct MUser: Hashable, Decodable {
    var username: String
    var usersurname: String
    var avatarStringURL: String
    var phone: String
    var sex: String
    var bithDate: String
    var id: String
    
    init(username: String, usersurname: String, phone: String, sex: String, avatarStringURL: String, id: String, bithDate: String) {
        self.username = username
        self.usersurname = usersurname
        self.sex = sex
        self.phone = phone
        self.bithDate = bithDate
        self.avatarStringURL = avatarStringURL
        self.id = id
    }
    
    init?(document: DocumentSnapshot) {
        guard let data = document.data() else {
            return nil
        }
        guard let username = data["username"] as? String,
        let usersurname = data["usersurname"] as? String,
        let sex = data["sex"] as? String,
        let phone = data["phone"] as? String,
        let avatarStringURL = data["avatarStringURL"] as? String,
        let id = data["uid"] as? String,
        let bithDate = data["bithDate"] as? String
        else { return nil }
        
        self.username = username
        self.usersurname = usersurname
        self.sex = sex
        self.phone = phone
        self.avatarStringURL = avatarStringURL
        self.id = id
        self.bithDate = bithDate
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let username = data["username"] as? String,
        let usersurname = data["usersurname"] as? String,
        let sex = data["sex"] as? String,
        let phone = data["phone"] as? String,
        let avatarStringURL = data["avatarStringURL"] as? String,
        let id = data["uid"] as? String,
        let bithDate = data["bithDate"] as? String
        else { return nil }
        
        self.username = username
        self.usersurname = usersurname
        self.sex = sex
        self.phone = phone
        self.avatarStringURL = avatarStringURL
        self.id = id
        self.bithDate = bithDate
    }
    
    var representation: [String: Any] {
        var rep = ["username": username]
        rep["usersurname"] = usersurname
        rep["sex"] = sex
        rep["phone"] = phone
        rep["avatarStringURL"] = avatarStringURL
        rep["uid"] = id
        rep["bithDate"] = bithDate
        return rep
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MUser, rhs: MUser) -> Bool {
        return lhs.id == rhs.id
    }
    
    func contains(filter: String?) -> Bool {
        guard let filter = filter else { return true }
        if filter.isEmpty { return true }
        let lowercasedFilter = filter.lowercased()
        return username.lowercased().contains(lowercasedFilter)
    }
    
}
