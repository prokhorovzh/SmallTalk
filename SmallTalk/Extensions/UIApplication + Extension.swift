//
//  UIAplication + Extension.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 15.06.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import UIKit

extension UIApplication {
    
    class func getTopViewController(base: UIViewController? = UIApplication.shared.windows.filter{ $0.isKeyWindow }.first?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
            
        } else if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return getTopViewController(base: selected)
            
        } else if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        return base
    }
}
