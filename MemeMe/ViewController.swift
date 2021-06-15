//
//  ViewController.swift
//  MemeMe
//
//  Created by Ricardo Bravo on 14/06/21.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var headerText: UITextField!
    @IBOutlet weak var footerText: UITextField!
    let pickerController = UIImagePickerController()
    
    var memeTextAttributes: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.white,
        .strokeColor: UIColor.black,
        .strokeWidth: -3.5
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pickerController.delegate = self
        
        headerText.defaultTextAttributes = memeTextAttributes
        footerText.defaultTextAttributes = memeTextAttributes
        
        headerText.textAlignment = .center
        footerText.textAlignment = .center
        
        headerText.font = UIFont(name: "impact", size: 30)
        footerText.font = UIFont(name: "impact", size: 30)
        
        headerText.delegate = self
        footerText.delegate = self
        
        headerText.text = "TOP"
        footerText.text = "BOTTOM"

    }
    
    override func viewWillAppear(_ animated: Bool) {
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsuscribeFromKeyboardNotifications()
    }

    @IBAction func pickImageFromPhotos(_ sender: Any) {
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.imageView.image = image
        }

        self.pickerController.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func imageFromCamera(_ sender: Any) {
        pickerController.sourceType = .camera
        present(pickerController, animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(_ notification : Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.view.transform = CGAffineTransform(translationX: 0, y: -keyboardHeight)
        }
    }
    
    private func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    @objc func keyboardWillHide(notification: Notification){
        self.view.transform = .identity
    }
    
    private func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil)
    }
    
    private func unsuscribeFromKeyboardNotifications(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
}

