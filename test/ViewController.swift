//
//  ViewController.swift
//  test
//
//  Created by Andrey Buravtsov on 10.06.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    let solo = UITextField()
    let overlayButton = UIButton(type: .custom)
    let bookmarkImage = UIImage(systemName: "bookmark")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overlayButton.setImage(bookmarkImage, for: .normal)
        overlayButton.backgroundColor = .red
        overlayButton.addTarget(self, action: #selector(displayBookmarks),
            for: .touchUpInside)
        overlayButton.sizeToFit()
        
        
        self.solo.frame = CGRect(x: 50, y: 50, width: 200, height: 30)
        self.solo.text = "Hello;l,'';,';,';,';,';,;',';;,';,'"
        self.solo.adjustsFontSizeToFitWidth = true
        self.solo.tintColor = .red
        self.solo.textAlignment = .center
        self.solo.placeholder = "Твой будущий текст"
        self.solo.font = UIFont(name: "Helvetica Nueu", size: 80)
        self.solo.borderStyle = .bezel
        self.solo.keyboardAppearance = .dark
        self.solo.keyboardType = .emailAddress
        self.solo.delegate = self
        self.solo.leftView = overlayButton
        self.solo.leftViewMode = .always
        self.solo.clearButtonMode = .always
        self.view.addSubview(solo)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.solo.resignFirstResponder()
        return true
    }
    
    @objc func displayBookmarks () {
        print("Получилось")
    }


}

