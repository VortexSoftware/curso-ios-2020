//
//  Category.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 24/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation
import ObjectMapper
 
class Category: Mappable {
    
    var id: Int?
    var name: String?
    var description: String?
    
    init() {}
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
    }
}
