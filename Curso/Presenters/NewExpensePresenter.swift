//
//  NewExpensePresenter.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 22/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation

protocol NewExpenseViewProtocol: class {
    func navigateToAccountSelector(delegate: AccounteSelectorDelegate)
    func navigateToCategorySelector(delegate: CategorySelectorDelegate)
    func navigateToProviderSelector(categoryId: Int, delegate: ProviderSelectorDelegate)
    func showSelected(account: Account)
    func showSelected(category: Category)
    func showSelected(provider: Provider)
    func showSuccess(message: String?)
    func showError(message: String?)
}

class NewExpensePresenter {
    
    weak var view: NewExpenseViewProtocol?
    
    var selectedAccount: Account?
    var selectedCategory: Category?
    var selectedProvider: Provider?
    var amount: Double?
    var quantity: Int?
    var description: String?
    
    let repository = ExpensesRepository()
    
    init(view: NewExpenseViewProtocol) {
        self.view = view
    }
}

extension NewExpensePresenter: NewExpensePresenterProtocol {
    
    func accountTapped() {
        view?.navigateToAccountSelector(delegate: self)
    }
    
    func categoryTapped() {
        view?.navigateToCategorySelector(delegate: self)
    }
    
    func providerTapped() {
        if let categoryId = selectedCategory?.id {
            view?.navigateToProviderSelector(categoryId: categoryId, delegate: self)
        } else {
            print("no seleccionó categoria aun")
        }
    }
    
    func createTapped(amount: Double, descripcion: String, quantity: Int) {
        self.amount = amount
        self.description = descripcion
        self.quantity = quantity
        
        guard validateInputs() else { return }
        
        let newExpense = getNewExpense()
        
        repository.createExpense(expense: newExpense) { (successMsg, errorMsg) in
            if errorMsg == nil {
                self.view?.showSuccess(message: successMsg)
            } else {
                self.view?.showError(message: errorMsg)
            }
        }
    }
    
    func getNewExpense() -> NewExpense {
        let newExpense = NewExpense()
        newExpense.amount = amount
        newExpense.description = description
        newExpense.quantity = quantity
        newExpense.categoryId = selectedCategory?.id
        newExpense.accountId = selectedAccount?.id
        newExpense.providerId = selectedProvider?.id
        return newExpense
    }
    
    func validateInputs() -> Bool {
        guard let amount = amount, amount > 0.0 else {
            view?.showError(message: "Monto no puede ser cero")
            return false
        }
        
        guard let description = description, !description.isEmpty else {
            view?.showError(message: "Descripcion no puede ser vacío")
            return false
        }
        
        return true
    }
}

extension NewExpensePresenter: AccounteSelectorDelegate {
    
    func accountWasSelected(_ account: Account) {
        view?.showSelected(account: account)
        selectedAccount = account
    }
}

extension NewExpensePresenter: CategorySelectorDelegate {
    
    func categoryWasSelected(_ category: Category) {
        view?.showSelected(category: category)
        selectedCategory = category
    }
}

extension NewExpensePresenter: ProviderSelectorDelegate {
    
    func providerWasSelected(_ provider: Provider) {
        view?.showSelected(provider: provider)
        selectedProvider = provider
    }
}
