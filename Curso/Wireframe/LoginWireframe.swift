//
//  LoginWireframe.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 20/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation
import UIKit

class LoginWireframe {
    
    static func navigateToLogin(from context: UIViewController) {
        let storyboard = UIStoryboard(name: "LoginViewController", bundle: .main)
        
        let loginVC = storyboard.instantiateViewController(identifier: "LoginViewController") as LoginViewController
        
        let loginPresenter = LoginPresenter(view: loginVC)
        loginVC.presenter = loginPresenter
        
        context.navigationController?.setViewControllers([loginVC], animated: true)
    }
}
