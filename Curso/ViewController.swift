//
//  ViewController.swift
//  Curso
//
//  Created by Gastón Sobrevilla on 13/04/2020.
//  Copyright © 2020 Vortex Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let storyboard = UIStoryboard(name: "LoginViewController", bundle: .main)
        let loginVC = storyboard.instantiateViewController(identifier: "LoginViewController")
        
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction private func buttonTapped() {
        label?.textColor = UIColor.red
        print("algo")
    }
}

