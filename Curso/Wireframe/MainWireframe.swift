//
//  MainWireframe.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 22/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation
import UIKit

class MainWireframe {
    
    static func navigateToHomeScreen(from context: UIViewController) {
        let user = SessionHelper().getUser()
        if user != nil {
            ExpensesWireframe.navigateToNewExpense(from: context)
        } else {
            LoginWireframe.navigateToLogin(from: context)
        }
    }
}
