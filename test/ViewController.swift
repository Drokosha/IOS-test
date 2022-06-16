//
//  ViewController.swift
//  test
//
//  Created by Andrey Buravtsov on 10.06.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    let solo = UITextField()
    let passwordTextField = UITextField()
    let overlayButton = UIButton(type: .custom)
    let bookmarkImage = UIImage(systemName: "bookmark")
    let pressButton = UIButton()
    let checkingTheinput = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTextField ()
        addButton ()
        self.solo.delegate = self
        self.passwordTextField.delegate = self
        notificationCentr()
        
    }
    
    func notificationCentr() {
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidChange), name: UITextField.textDidChangeNotification, object: nil)
        //чтобы передвинуть что то текстфилд, чтобы клавиатура не заслоняла
        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.solo.frame.origin.y = 100
            self.passwordTextField.frame.origin.y = 200
        }
        
        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.solo.frame.origin.y = 50
            self.passwordTextField.frame.origin.y = 100
        }
    }
    
    func addTextField () {
       //добавляем кнопку в тексвилд
        overlayButton.setImage(bookmarkImage, for: .normal)
        overlayButton.backgroundColor = .red
        overlayButton.addTarget(self, action: #selector(displayBookmarks),
            for: .touchUpInside)
        overlayButton.sizeToFit()
        
        //self.solo.becomeFirstResponder() //чтоьы сразу на текст филд было
        self.solo.frame = CGRect(x: 50, y: 50, width: 200, height: 31)
        self.solo.text = ""
        self.solo.adjustsFontSizeToFitWidth = true
        self.solo.tintColor = .red
        self.solo.textAlignment = .center
        self.solo.contentVerticalAlignment = .center
        self.solo.placeholder = "Введите логин"
        self.solo.font = UIFont(name: "Helvetica Nueu", size: 80)
        self.solo.borderStyle = .roundedRect
        self.solo.keyboardAppearance = .dark
        self.solo.keyboardType = .emailAddress
        self.solo.leftView = overlayButton
        self.solo.leftViewMode = .always
        self.solo.clearButtonMode = .always
        self.view.addSubview(solo)
        
        self.passwordTextField.frame = CGRect(x: 50, y: 100, width: 200, height: 31)
        self.passwordTextField.contentMode = .center
        self.passwordTextField.borderStyle = .bezel
        self.passwordTextField.textAlignment = .center
        self.passwordTextField.placeholder = "Введите пароль"
        self.passwordTextField.adjustsFontSizeToFitWidth = true
        self.view.addSubview(passwordTextField)
        
        self.checkingTheinput.frame = CGRect(x: 20, y: self.passwordTextField.frame.width + 40, width: 200, height: 60)
        self.checkingTheinput.textAlignment = .center
        self.checkingTheinput.textColor = .black
        self.checkingTheinput.backgroundColor = .yellow
        self.checkingTheinput.isHidden = true
        self.view.addSubview(checkingTheinput)
    }
    
    func addButton () {
        self.pressButton.frame = CGRect(x: 50, y: 150, width: 200, height: 31)
        self.pressButton.layer.borderColor = CGColor(red: 10, green: 10, blue: 10, alpha: 1)
        self.pressButton.backgroundColor = .red
        self.pressButton.contentMode = .center
        self.pressButton.setTitle("Нажми", for: .normal)
        self.pressButton.addTarget(self, action: #selector(pushPress), for: .touchUpInside)
        self.view.addSubview(pressButton)
    }
    
    @objc func pushPress () {
       
        self.checkingTheinput.isHidden = true
        
        guard let email = self.solo.text, self.solo.text?.count != 0 else {
            self.checkingTheinput.isHidden = false
            self.checkingTheinput.text = "NO email"
            return
        }
        if isValidEmail(emailID: email) == false {
            self.checkingTheinput.isHidden = false
            self.checkingTheinput.text = "Pleas enter you email"
        }
        guard let email = self.passwordTextField.text, self.passwordTextField.text?.count != 0 else {
            self.checkingTheinput.isHidden = false
            self.checkingTheinput.text = "NO password"
            return
        }
    }
    
    func isValidEmail(emailID:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailID)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField == solo {
        print("textFieldShouldBeginEditing = это я решаю можно и редокатировать")
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing = внимание началось редактирование")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing = внимание pfrjyxbkjcm редактирование")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("Понять кога срабатывает")
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("shouldChangeCharactersIn = вы вели = \(string)")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear = ты что то очистил")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("активирует кнопку возврата return на клавиатуре убрат ьклввиатуру")
        if textField == solo {
        self.solo.resignFirstResponder() // убрать
        }
        
        if textField == passwordTextField {
        self.solo.resignFirstResponder() // убрать
        }
        return true
    }
    
    @objc func displayBookmarks () {
        print("Получилось")
    }

//Notification centr
    @objc func textFieldTextDidChange(ncParam: NSNotification) {
        print("UITextFieldTextDidChange = \(ncParam)")
    }
}

