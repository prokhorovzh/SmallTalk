//
//  CodeValidViewController.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 16.05.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class CodeValidViewController: UIViewController{
    
    var property = "Phone Number"
    var verificationID: String!
    @IBOutlet weak var codeTextField: UITextField! {
        didSet {
            codeTextField.layer.shadowColor = UIColor.black.cgColor
            codeTextField.layer.shadowOffset = CGSize(width: 0, height: 0)
            codeTextField.layer.shadowOpacity = 0.4
            codeTextField.layer.shadowRadius = 2
            codeTextField.clipsToBounds = true
            codeTextField.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var phoneNumberLabel: UILabel! {
        didSet {
            phoneNumberLabel.text = property
        }
    }
    @IBOutlet weak var checkCodeButton: UIButton! {
        didSet {
            checkCodeButton.layer.cornerRadius = 8
            checkCodeButton.clipsToBounds = true
        }
    }
    @IBOutlet weak var backButton: UIButton! {
        didSet {
            backButton.layer.cornerRadius = 8
            backButton.clipsToBounds = true
        }
    }
    @IBAction func checkCodeTapped(_ sender: UIButton) {
        
        guard let code = codeTextField.text else { return }
        
        let credetional = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: code)
        
        Auth.auth().signIn(with: credetional) { (_, error) in
            if error != nil {
                let ac = UIAlertController(title: error?.localizedDescription, message: nil, preferredStyle: .alert)
                let cancel = UIAlertAction(title: "Отмена", style: .cancel)
                ac.addAction(cancel)
                self.present(ac, animated: true)
            } else {
                self.showCreateProfileVC()
            }
        }
    }
    
    private func showCreateProfileVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dvc = storyboard.instantiateViewController(withIdentifier: "CreateProfileVC") as! CreateProfileVC
        dvc.currentUser = Auth.auth().currentUser!
        self.present(dvc, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       // view.addTapGestureToHideKeyboard()
        setupConfig()
    }
    
    private func setupConfig() {
        checkCodeButton.alpha = 0.5
        checkCodeButton.isEnabled = false
        
        codeTextField.delegate = self
    }
}

extension CodeValidViewController: UITextFieldDelegate {
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//
//        let currentCharacterCount = textView.text?.count ?? 0
//        if range.length + range.location > currentCharacterCount {
//            return false
//        }
//        let newLength = currentCharacterCount + text.count - range.length
//        return newLength <= 6
//
//    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString text: String) -> Bool {
        
        let currentCharacterCount = textField.text?.count ?? 0
        if range.length + range.location > currentCharacterCount {
            return false
        }
        let newLength = currentCharacterCount + text.count - range.length
        print(currentCharacterCount)
        return newLength <= 6
        
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count == 6 {
            checkCodeButton.alpha = 1
            checkCodeButton.isEnabled = true
        } else {
            checkCodeButton.alpha = 0.5
            checkCodeButton.isEnabled = false
        }
    }
}
