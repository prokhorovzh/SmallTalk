//
//  MainTabBarViewController.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 30.05.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    var currentUser: MUser = MUser(username: "fdff",
                                   usersurname: "dfdf",
                                   phone: "dffd",
                                   sex: "dfb",
                                   avatarStringURL: "fgf",
                                   id: "gf",
                                   bithDate: "fggf")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let navMessVC = self.viewControllers?[2] as! UINavigationController
        let messageVC = navMessVC.topViewController as! MessageVC
        messageVC.currentUser = currentUser
        
        let navMainVC = self.viewControllers?[0] as! UINavigationController
        let mainVC = navMainVC.topViewController as! MainViewController
        mainVC.currentUser = currentUser
        
        let navProfileVC = self.viewControllers?[3] as! UINavigationController
        let profileVC = navProfileVC.topViewController as! ProfileVC
        profileVC.currentUser = currentUser
        tabBar.tintColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    }

}
