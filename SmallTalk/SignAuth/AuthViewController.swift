//
//  AuthViewController.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 13.05.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class AuthViewController: UIViewController {
    
    @IBOutlet weak var PrivacyLabel: UILabel! {
        didSet {
            let formattedString = NSMutableAttributedString()
            formattedString
                .normal("Нажимая \"Войти\" вы соглашаетесь с ")
                .bold(" условиями пользования ")
                .normal("\"Messnet\"")

            PrivacyLabel.attributedText = formattedString
            
        }
    }
    @IBOutlet weak var ButtonPhone: UIButton! {
        didSet {
            ButtonPhone.titleLabel?.textColor = #colorLiteral(red: 0.1176470588, green: 0.4470588235, blue: 0.8, alpha: 1)
        }
    }
    
    @IBAction func phoneButtonTapped() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dvc = storyboard.instantiateViewController(withIdentifier: "PhoneNumberViewController") as! PhoneNumberViewController
        self.navigationController?.pushViewController(dvc, animated: true)
       // self.present(dvc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    @IBOutlet var phoneButton: UIButton! {
        didSet {
            phoneButton.backgroundColor = UIColor.white
            phoneButton.layer.cornerRadius = 8
            phoneButton.layer.shadowColor = UIColor.black.cgColor
            phoneButton.layer.shadowOffset = CGSize(width: 0, height: 0)
            phoneButton.layer.shadowOpacity = 0.4
            phoneButton.layer.shadowRadius = 4
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont(name: "SFUIDisplay-Medium", size: 17)!]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)

        return self
    }

    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)

        return self
    }
}
