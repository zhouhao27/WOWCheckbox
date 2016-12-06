//
//  ViewController.swift
//  Checkbox
//
//  Created by Zhou Hao on 11/8/15.
//  Copyright © 2015 Zhou Hao. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WOWCheckboxDelegate {

    @IBOutlet var check1: WOWCheckbox!
    @IBOutlet var check2: WOWCheckbox!
    @IBOutlet var check3: WOWCheckbox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        check1.delegate = self
        check2.delegate = self
        check3.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didSelectCheckbox(_ checkbox : WOWCheckbox) {
        
        let checked = checkbox.isChecked ? "checked" : "unchecked"
        
        if checkbox == check1 {
            
            print("Checkbox 1 clicked, the value is \(checked)")
            
        } else if checkbox == check2 {
            
            print("Checkbox 2 clicked, the value is \(checked)")
            
        } else if checkbox == check3 {

            print("Checkbox 3 clicked, the value is \(checked)")
        }
    }
    

}

