//
//  CreateProfileVC.swift
//  SmallTalk
//
//  Created by Евгений Прохоров on 16.05.2020.
//  Copyright © 2020 Евгений Прохоров. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class CreateProfileVC: UIViewController, UIGestureRecognizerDelegate {
    
    let datePicker = UIDatePicker()
    var currentUser: User!
    
    var imageIsChanged = false
    
    @IBOutlet weak var userPhoto: UIImageView! {
        didSet {
            userPhoto.layer.cornerRadius = userPhoto.frame.size.height / 2
            userPhoto.clipsToBounds = true
            userPhoto.layer.borderWidth = 15
            userPhoto.layer.borderColor = #colorLiteral(red: 0.6901960784, green: 0.8352941176, blue: 0.9882352941, alpha: 1)
        }
    }
    @IBOutlet weak var ComletedButton: UIButton! {
        didSet {
            ComletedButton.layer.cornerRadius = 8
            ComletedButton.clipsToBounds = true
            ComletedButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        }
    }
    
    @IBOutlet weak var NameTextField: UITextField! {
        didSet {

        }
    }
    @IBOutlet weak var SurnameTextField: UITextField!
    @IBOutlet weak var sexSegmentedControl: UISegmentedControl!
    @IBOutlet weak var dateField: UITextField!

    @IBAction func CompletedButtonAction(_ sender: UIButton) {
        FirestoreServices.shared.saveProfileWith(id: currentUser.uid,
                                                 phone: currentUser.phoneNumber!,
                                                 username: NameTextField.text,
                                                 usersurname: SurnameTextField.text,
                                                 avatarImage: userPhoto.image,
                                                 sex: sexSegmentedControl.titleForSegment(at: sexSegmentedControl.selectedSegmentIndex),
                                                 bithDate: dateField.text) {
                                                    (result) in switch result {
                                                    case .success(let muser):
                                                        self.showAlert(with: "Успешно", and: "Приятного общения!", completion: {
                                                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                                            let dvc = storyboard.instantiateViewController(identifier: "MainTabBarViewController") as! MainTabBarViewController
                                                            dvc.currentUser = muser
                                                            self.present(dvc, animated: true)
                                                        })
                                                        print(muser)
                                                    case .failure(let error):
                                                        self.showAlert(with: "Ошибка", and: error.localizedDescription)
                                                }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Пикер на Дату
        dateField.inputView = datePicker
        datePicker.datePickerMode = .date
        let localeID = Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: localeID!)
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexSpace, doneButton], animated: true)
        dateField.inputAccessoryView = toolbar
        
        // Убрать клаву по свайпу
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
        swipeDown.delegate = self
        swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
        // Убрать клаву по тапу на экран
        view.addTapGestureToHideKeyboard()
        
        // Тапы по изображению
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        userPhoto.isUserInteractionEnabled = true
        userPhoto.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
   
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
//        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        let actionSheet = UIAlertController(title: nil,
                                            message: nil,
                                            preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            self.chooseImagePicker(source: .camera)
        }
        
        let photo = UIAlertAction(title: "Photo", style: .default) { _ in
            self.chooseImagePicker(source: .photoLibrary)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionSheet.addAction(camera)
        actionSheet.addAction(photo)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true)
    }
    
    @objc func doneAction() {
        getDateFromPicker()
        view.endEditing(true)
    }
    
    func getDateFromPicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        dateField.text = formatter.string(from: datePicker.date)
    }
    
    @objc func hideKeyboardOnSwipeDown() {
        view.endEditing(true)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

}

extension UIViewController {
    
    func showAlert(with title: String, and message: String, completion: @escaping () -> Void = { }) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            completion()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}

// MARK: work with image

extension CreateProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        userPhoto.image = info[.editedImage] as? UIImage
        userPhoto.contentMode = .scaleAspectFit
        userPhoto.clipsToBounds = true
        
        imageIsChanged = true
        
        dismiss(animated: true)
    }
    
}
