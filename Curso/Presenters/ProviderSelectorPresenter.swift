//
//  ProviderSelectorPresenter.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 24/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation

protocol ProviderSelectorDelegate: class {
    func providerWasSelected(_ provider: Provider)
}

protocol ProviderSelectorViewProtocol: class {
    func show(providers: [Provider])
}

class ProviderSelectorPresenter {
    
    let repository = ProvidersRepository()
    var providers: [Provider] = []
    
    weak var view: ProviderSelectorViewProtocol?
    var delegate: ProviderSelectorDelegate?
    var categoryId: Int?
    
    init(view: ProviderSelectorViewProtocol?) {
        self.view = view
    }
}

extension ProviderSelectorPresenter: SelectorPresenterProtocol {
    
    func fetchData() {
        guard let categoryId = categoryId else { return }
        
        repository.getProviders(categoryId: categoryId) { (providers, error) in
            self.providers = providers ?? []
            self.view?.show(providers: providers ?? [])
        }
    }
    
    func elementSelected(at index: Int) {
        let selectedProvider = providers[index]
        delegate?.providerWasSelected(selectedProvider)
    }
}
