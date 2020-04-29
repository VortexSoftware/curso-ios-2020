//
//  ExpensesRepository.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 29/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation
import Alamofire

class ExpensesRepository: BaseRepository {
    
    typealias CreateExpenseCompletion = (_ successMessage: String?, _ errorMessage: String?) -> Void
    
    func createExpense(expense: NewExpense, completion: @escaping CreateExpenseCompletion) {
        requestBuilder.createExpense(data: expense).responseObject { (dataResponse: DataResponse<MessageResponse>) in
            switch dataResponse.result {
            case .success:
                completion(dataResponse.value?.message, nil)
            case .failure:
                completion(nil, self.getError(from: dataResponse))
            }
        }
    }
}
