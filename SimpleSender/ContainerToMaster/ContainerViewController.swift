//
//  ContainerViewController.swift
//  ContainerToMaster
//
//  Created by Developer on 10/4/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

protocol ContainerViewControllerDelegate {
    func changeLabel(text:String)
}

class ContainerViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var labelContainer: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var containerToMaster: ContainerViewControllerDelegate?
    

    // MARK: - LyfeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: - @IBAction's

extension ContainerViewController {
    
    @IBAction func buttonMaster(sender: AnyObject) {
        guard let text = textField.text else { return }
        containerToMaster?.changeLabel(text: text)
    }
}


// MARK: - MasterViewControllerDelegate

extension ContainerViewController: MasterViewControllerDelegate {
    
    func changeLabel(text: String) {
        labelContainer.text = text
    }
}
