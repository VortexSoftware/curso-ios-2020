//
//  LoginViewController.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 15/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet private var usernameTextField: UITextField?
    @IBOutlet private var passwordTextField: UITextField?
    @IBOutlet private var button: UIButton?
    
    let repository = AuthRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button?.layer.cornerRadius = 8
    }
    
    @IBAction private func buttonTapped() {
        if let username = usernameTextField?.text, let password = passwordTextField?.text {
            print(username)
            print(password)
            
            repository.login(username: username, password: password, completion: { user in
                print(user?.name)
                print(user?.token)
            })
        }
    }
}
