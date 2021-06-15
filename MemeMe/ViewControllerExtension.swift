//
//  ViewControllerExtension.swift
//  MemeMe
//
//  Created by Ricardo Bravo on 14/06/21.
//

import UIKit

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("The text is "+textField.text!)
        if textField.text == "WRITE HERE" {
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("The text is "+textField.text!)
        textField.resignFirstResponder()
        return true
    }
    
}
