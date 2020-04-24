//
//  ProvidersRepository.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 24/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
 
class ProvidersRepository: BaseRepository {
    
    func getProviders(categoryId: Int, completion: @escaping ([Provider]?, String?) -> Void) {
        requestBuilder.providers(categoryId: categoryId).responseArray { (response: DataResponse<[Provider]>) in
            switch response.result {
            case .success:
                completion(response.value ?? [], nil)
            case .failure:
                completion(nil, self.getError(from: response))
            }
        }
    }
}
