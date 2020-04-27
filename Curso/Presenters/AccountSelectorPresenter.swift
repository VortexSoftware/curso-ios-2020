//
//  AccountSelectorPresenter.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 24/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation

protocol AccounteSelectorDelegate: class {
    func accountWasSelected(_ account: Account)
}

protocol AccountSelectorViewProtocol: class {
    func show(accounts: [Account])
}

class AccountSelectorPresenter {
    
    let repository = AccountsRepository()
    var accounts: [Account] = []
    
    weak var view: AccountSelectorViewProtocol?
    var delegate: AccounteSelectorDelegate?
    
    init(view: AccountSelectorViewProtocol?) {
        self.view = view
    }
}

extension AccountSelectorPresenter: SelectorPresenterProtocol {
    
    func fetchData() {
        repository.getAccounts { (accounts, error) in
            self.accounts = accounts ?? []
            self.view?.show(accounts: accounts ?? [])
        }
    }
    
    func elementSelected(at index: Int) {
        let selectedAccount = accounts[index]
        delegate?.accountWasSelected(selectedAccount)
    }
}
