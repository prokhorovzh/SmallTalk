//
//  ProfileVC.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 29.06.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import UIKit
import FirebaseFirestore
import SDWebImage

class ProfileVC: UIViewController {
    
    var currentUser: MUser!

    @IBOutlet weak var userPhoto: UIImageView! {
        didSet {
            userPhoto.layer.cornerRadius = userPhoto.frame.size.height / 2
            userPhoto.clipsToBounds = true
            userPhoto.sd_setImage(with: URL(string: currentUser.avatarStringURL), completed: nil)
        }
    }
    @IBOutlet weak var userName: UILabel! {
        didSet {
            userName.text = "\(currentUser.username) \(currentUser.usersurname)"
        }
    }
    @IBOutlet weak var specialization: UILabel!
    @IBOutlet weak var friends: UILabel!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var addFriend: UIButton! {
        didSet {
            addFriend.layer.cornerRadius = 8
            addFriend.clipsToBounds = true
            addFriend.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
    }
    @IBOutlet weak var messageButton: UIButton! {
        didSet {
            messageButton.layer.cornerRadius = 8
            messageButton.clipsToBounds = true
            messageButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
    }
    @IBOutlet weak var bithDate: UILabel! {
        didSet {
            bithDate.text = currentUser.bithDate
        }
    }
    @IBOutlet weak var location: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

}
