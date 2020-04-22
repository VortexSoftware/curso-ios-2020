//
//  AuthRepository.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 17/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class AuthRepository: BaseRepository {
    
    func login(username: String, password: String, completion: @escaping (User?, String?) -> Void) {
        
        requestBuilder.login(username: username, password: password).responseObject { (dataResponse: DataResponse<LoginResponse>) in
            switch dataResponse.result {
                case .success:
                    let user: User? = dataResponse.value?.user
                    completion(user, nil)
                case .failure:
                    completion(nil, self.getError(from: dataResponse))
            }
        }
    }
}
