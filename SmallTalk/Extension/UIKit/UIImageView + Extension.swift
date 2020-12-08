//
//  UIImageView + Extension.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 13.05.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
}
