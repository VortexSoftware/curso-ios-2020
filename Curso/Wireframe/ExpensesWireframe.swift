//
//  ExpensesWireframe.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 22/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation
import UIKit

class ExpensesWireframe {
    
    static func navigateToNewExpense(from context: UIViewController) {
        let storyboard = UIStoryboard(name: "NewExpenseViewController", bundle: .main)
        let newExpenseVC = storyboard.instantiateViewController(identifier: "NewExpenseViewController") as NewExpenseViewController
        let presenter = NewExpensePresenter(view: newExpenseVC)
        newExpenseVC.presenter = presenter
        
        context.navigationController?.pushViewController(newExpenseVC, animated: true)
    }
}
