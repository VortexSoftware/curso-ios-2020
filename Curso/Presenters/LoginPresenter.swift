//
//  LoginPresenter.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 20/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation

protocol LoginViewProtocol: class {
    func show(error: String)
    func showLoginSuccess()
}

class LoginPresenter {
    
    var view: LoginViewProtocol?
    
    let repository = AuthRepository()
    
    init(view: LoginViewProtocol) {
        self.view = view
    }
}

extension LoginPresenter: LoginPresenterProtocol {
    
    func login(username: String, password: String) {
        repository.login(username: username, password: password) { (user) in
            
        }
    }
}
