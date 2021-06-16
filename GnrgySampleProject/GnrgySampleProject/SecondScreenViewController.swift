//
//  SecondScreenViewController.swift
//  GnrgySampleProject
//
//  Created by praveen on 16/06/21.
//

import UIKit

class SecondScreenViewController: UIViewController {
    
    @IBOutlet var displayLabel : UILabel!
    var displayText = String()
    var textColor = UIColor()
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = displayText
        displayLabel.textColor = textColor
        // Do any additional setup after loading the view.
    }
}
