//
//  AppDelegate.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 01.05.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
     /*   if let user = Auth.auth().currentUser {
            FirestoreServices.shared.getUserData(user: user) { (result) in
                switch result {
                case .success(let muser):
                    let mainTabBar = MainTabBarViewController()
                    mainTabBar.currentUser = muser
                    mainTabBar.modalPresentationStyle = .fullScreen
                    self.window?.rootViewController = mainTabBar
                case .failure(_):
                    self.window?.rootViewController = AuthViewController()
                }
            }
        } else {
            window?.rootViewController = AuthViewController()
        }
        window?.makeKeyAndVisible() */
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
    
}


