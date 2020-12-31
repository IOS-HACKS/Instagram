//
//  RegistrationViewController.swift
//  Instagram
//
//  Created by ABDUL BASITH A on 29/11/20.
//

import UIKit

class RegistrationViewController: UIViewController {
    struct Constants {
        static let cornerRadius: CGFloat = 8.0
    }
    
    private let  usernameField: UITextField = {
       let field = UITextField()
        field.placeholder = "Username... "
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.backgroundColor  = .secondarySystemBackground
        field.layer.cornerRadius = Constants.cornerRadius
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let  EmailField: UITextField = {
       let field = UITextField()
        field.placeholder = "Email... "
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.backgroundColor  = .secondarySystemBackground
        field.layer.cornerRadius = Constants.cornerRadius
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let  passwordField: UITextField = {
       let field =  UITextField()
        field.placeholder = "Password ... "
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor  = .secondarySystemBackground
        field.isSecureTextEntry = true
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
        
    }()
    
    private let  RegisterButton: UIButton = {
       let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        RegisterButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        usernameField.delegate = self
        EmailField.delegate = self
        passwordField.delegate = self
        
        view.addSubview(usernameField)
        view.addSubview(EmailField)
        view.addSubview(passwordField)
        view.addSubview(RegisterButton)
    
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        usernameField.frame = CGRect(x: 20, y: view.safeAreaInsets.top + 100, width:view.width - 40, height: 52)
        EmailField.frame = CGRect(x: 20, y: usernameField.bottom + 20, width:view.width - 40, height: 52)
        passwordField.frame = CGRect(x: 20, y: EmailField.bottom + 20, width:view.width - 40, height: 52)
        RegisterButton.frame = CGRect(x: 20, y: passwordField.bottom + 20, width:view.width - 40, height: 52)
    }
    
    @objc private func didTapRegister(){
        // hide keyboard
        usernameField.resignFirstResponder()
        EmailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = EmailField.text, !email.isEmpty,
              let username =  usernameField.text ,!username.isEmpty,
              let password = passwordField.text ,!password.isEmpty, password.count >= 8 else  {
            return
        }
        AuthManager.shared.registerNewUser(username: username, email: email, password: password) { (registered) in
            DispatchQueue.main.async {
                if registered {
                    
                }
            }
        }
    }

   

}
extension RegistrationViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameField {
            EmailField.becomeFirstResponder()
        }
        else if textField == EmailField {
            passwordField.becomeFirstResponder()
        }else {
            didTapRegister()
        }
        return true
    }
    
}
