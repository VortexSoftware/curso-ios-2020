//
//  CategorySelectorPresenter.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 24/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation

protocol CategorySelectorDelegate: class {
    func categoryWasSelected(_ category: Category)
}

protocol CategorySelectorViewProtocol: class {
    func show(categories: [Category])
}

class CategorySelectorPresenter {
    
    let repository = CategoriesRepository()
    var categories: [Category] = []
    
    weak var view: CategorySelectorViewProtocol?
    var delegate: CategorySelectorDelegate?
    
    init(view: CategorySelectorViewProtocol?) {
        self.view = view
    }
}

extension CategorySelectorPresenter: SelectorPresenterProtocol {
    
    func fetchData() {
        repository.getCategories { (categories, error) in
            self.categories = categories ?? []
            self.view?.show(categories: categories ?? [])
        }
    }
    
    func elementSelected(at index: Int) {
        let selectedCategory = categories[index]
        delegate?.categoryWasSelected(selectedCategory)
    }
}
