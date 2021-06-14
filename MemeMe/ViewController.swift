//
//  ViewController.swift
//  MemeMe
//
//  Created by Ricardo Bravo on 14/06/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewPicker: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pickImage(_ sender: Any) {
        let pickerCOntroller = UIImagePickerController()
        present(pickerCOntroller, animated: true, completion: nil)
    }
    
}

