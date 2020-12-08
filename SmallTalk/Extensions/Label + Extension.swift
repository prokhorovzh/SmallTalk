//
//  Label + Extension.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 08.06.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont? = .avenir20()) {
        self.init()
        
        self.text = text
        self.font = font
    }
}
