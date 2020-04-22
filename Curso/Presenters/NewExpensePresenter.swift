//
//  NewExpensePresenter.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 22/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation

protocol NewExpenseViewProtocol: class {
    
}

class NewExpensePresenter {
    
    weak var view: NewExpenseViewProtocol?
    
    init(view: NewExpenseViewProtocol) {
        self.view = view
    }
}

extension NewExpensePresenter: NewExpensePresenterProtocol {
    
}
