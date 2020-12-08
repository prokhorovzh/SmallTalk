//
//  HelpFunc.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 13.05.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import Foundation
import UIKit

class HelpFunc: UIViewController {
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
