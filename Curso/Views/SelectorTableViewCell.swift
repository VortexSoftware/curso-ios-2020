//
//  SelectorTableViewCell.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 24/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import Foundation
import UIKit

class SelectorTableViewCell: UITableViewCell {
 
    @IBOutlet private var label: UILabel?
    
    func set(text: String) {
        label?.text = text
    }
}
