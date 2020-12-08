//
//  UIView + Extension.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 14.06.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import UIKit

extension UIView {
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        addGestureRecognizer(tapGesture)
    }
    
    var topSuperview: UIView? {
        var view = superview
        while view?.superview != nil {
            view = view!.superview
        }
        return view
    }

    func dismissKeyboard() {
        topSuperview?.endEditing(true)
    }
}
