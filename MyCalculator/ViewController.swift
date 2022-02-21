//
//  ViewController.swift
//  MyCalculator
//
//  Created by Savitha M K on 2022-02-19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var calculatorButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in calculatorButtons {
            button.layer.cornerRadius =  button.bounds.size.height / 3
        }
    }


}

