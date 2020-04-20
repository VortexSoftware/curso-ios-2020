//
//  LoginViewController.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 15/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation
import UIKit

protocol LoginPresenterProtocol: class {
    func login(username: String, password: String)
}

class LoginViewController: UIViewController {
    
    @IBOutlet private var usernameTextField: UITextField?
    @IBOutlet private var passwordTextField: UITextField?
    @IBOutlet private var button: UIButton?
    
    var presenter: LoginPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button?.layer.cornerRadius = 8
    }
    
    @IBAction private func buttonTapped() {
        if let username = usernameTextField?.text, let password = passwordTextField?.text {
            presenter?.login(username: username, password: password)
        }
    }
}

extension LoginViewController: LoginViewProtocol {
    
    func show(error: String) {
        
    }
    
    func showLoginSuccess() {
        
    }
}
