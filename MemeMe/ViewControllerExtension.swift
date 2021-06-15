//
//  ViewControllerExtension.swift
//  MemeMe
//
//  Created by Ricardo Bravo on 14/06/21.
//

import UIKit

extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeField = textField
        
        if textField.text == Text.TOP.rawValue {
            textField.text = ""
        }
        
        if textField.text == Text.BOTTOM.rawValue {
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField){
        switch textField {
        case self.headerText:
            let value = self.headerText.text
            if value?.isEmpty == true {
                self.headerText.text = Text.TOP.rawValue
            }
            break
        default:
            let value = self.footerText.text
            if value?.isEmpty == true {
                self.footerText.text = Text.BOTTOM.rawValue
            }
        }
        self.activeField = nil
    }
    
}
