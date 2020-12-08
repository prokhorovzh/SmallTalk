//
//  UIButton + Extension.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 13.05.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    convenience init(title: String,
                     titleColor: UIColor,
                     backgroundColor: UIColor,
                     font: UIFont? = .sanFranciscoDisplay20(),
                     isShadow: Bool = true,
                     cornerRadius: CGFloat = 4) {
        self.init(type: .system)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = font
        
        self.layer.cornerRadius = cornerRadius
        
        if isShadow {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowRadius = 4
            self.layer.shadowOpacity = 0.2
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
        }
        
    }
}
