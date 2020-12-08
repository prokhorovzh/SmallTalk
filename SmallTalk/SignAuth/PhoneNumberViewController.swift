//
//  PhoneNumberViewController.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 14.05.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import UIKit
import FirebaseAuth
import FlagPhoneNumber

class PhoneNumberViewController: UIViewController, UIGestureRecognizerDelegate {
    
    var phoneNumber: String?
    var listController: FPNCountryListViewController!
    
    @IBOutlet weak var phoneNumberTextField: FPNTextField! {
        didSet {
            phoneNumberTextField.becomeFirstResponder()
            phoneNumberTextField.layer.cornerRadius = 8
            phoneNumberTextField.clipsToBounds = true
            phoneNumberTextField.layer.shadowColor = UIColor.black.cgColor
            phoneNumberTextField.layer.shadowOffset = CGSize(width: 0, height: 0)
            phoneNumberTextField.layer.shadowOpacity = 0.4
            phoneNumberTextField.layer.shadowRadius = 2
            phoneNumberTextField.layer.masksToBounds = false
        }
    }
    @IBOutlet weak var fetchCodeButton: UIButton! {
        didSet {
            fetchCodeButton.layer.cornerRadius = 8
            fetchCodeButton.clipsToBounds = true
        }
    }
    @IBAction func fetchCodeTapped(_ sender: UIButton) {
        guard phoneNumber != nil else { return }
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber!, uiDelegate: nil) { (verificationID, error) in
            if error != nil {
                print(error?.localizedDescription ?? "is empty")
            } else {
                self.showCodeValidVC(verificationID: verificationID!)
            }
        }
    }
    
    private func showCodeValidVC(verificationID: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let dvc = storyboard.instantiateViewController(withIdentifier: "CodeValidViewController") as! CodeValidViewController
        dvc.property = phoneNumber!
        dvc.verificationID = verificationID
        self.navigationController?.pushViewController(dvc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addTapGestureToHideKeyboard()
        
        // Убрать клаву по свайпу
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
        swipeDown.delegate = self
        swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        setupConfig()
    }
    
    @objc func hideKeyboardOnSwipeDown() {
        view.endEditing(true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    private func setupConfig() {
        fetchCodeButton.alpha = 0.5
        fetchCodeButton.isEnabled = false
        
        phoneNumberTextField.displayMode = .list
        phoneNumberTextField.delegate = self
        
        listController = FPNCountryListViewController(style: .grouped)
        listController?.setup(repository: phoneNumberTextField.countryRepository )
        listController.didSelect = { country in
            self.phoneNumberTextField.setFlag(countryCode: country.code)
        }
    }
}

extension PhoneNumberViewController: FPNTextFieldDelegate {
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        ///
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        
        if isValid {
            fetchCodeButton.alpha = 1
            fetchCodeButton.isEnabled = true
            phoneNumber = textField.getFormattedPhoneNumber(format: .International)
        } else {
            fetchCodeButton.alpha = 0.5
            fetchCodeButton.isEnabled = false
        }
    }
    
    func fpnDisplayCountryList() {
        let navigationController = UINavigationController(rootViewController: listController)
        listController.title = "Страны"
        phoneNumberTextField.text = ""
        self.present(navigationController, animated: true)
    }
    
    
}
