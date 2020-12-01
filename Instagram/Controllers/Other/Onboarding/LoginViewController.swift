//
//  LoginViewController.swift
//  Instagram
//
//  Created by ABDUL BASITH A on 29/11/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let  usernameEmailField: UITextField = {
        return UITextField()
    }()
    
    private let  passwordEmailField: UITextField = {
       let field =  UITextField()
        field.isSecureTextEntry = true
        return field
        
    }()
    
    private let  loginButton: UIButton = {
        return UIButton()
    }()
    
    private let  headerView: UIView = {
        return UIView()
    }()
    
    private let  termsButton: UIButton = {
        return UIButton()
    }()
    
    private let  privacyButton: UIButton = {
        return UIButton()
    }()
    private let  createAccountButton: UIButton = {
        return UIButton()
    }()
  



    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
   
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
    }
    
    private func addSubViews(){
        view.addSubview(usernameEmailField)
        view.addSubview(passwordEmailField)
        view.addSubview(loginButton)
        view.addSubview(headerView)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(createAccountButton)
    }
    
    @objc private func didTapLoginButton(){}
    @objc private func didTapTermsButton(){}
    @objc private func didTapPrivacyButton(){}
    @objc private func didTapCreateAccountButton(){}
    

  

}
