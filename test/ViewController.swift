//
//  ViewController.swift
//  test
//
//  Created by Andrey Buravtsov on 10.06.2022.
//

import UIKit

class ViewController: UIViewController {
    let solo = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let overlayButton = UIButton(type: .custom)
        let bookmarkImage = UIImage(systemName: "infoButton")
        overlayButton.setImage(bookmarkImage, for: .normal)
        overlayButton.addTarget(self, action: #selector(displayBookmarks),
            for: .touchUpInside)
        overlayButton.sizeToFit()
        
        self.solo.frame = CGRect(x: 50, y: 50, width: 140, height: 50)
        self.solo.text = "Hello"
        //self.solo.becomeFirstResponder()
        self.solo.backgroundColor = .red
        self.solo.leftView = overlayButton
        self.solo.leftViewMode = .always
        self.view.addSubview(solo)
        self.view.addSubview(solo)
        // Do any additional setup after loading the view.
    }
    
    @objc func displayBookmarks () {
        
    }


}

