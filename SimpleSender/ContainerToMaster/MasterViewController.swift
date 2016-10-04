//
//  ViewController.swift
//  ContainerToMaster
//
//  Created by Developer on 10/4/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

protocol MasterViewControllerDelegate {
    func changeLabel(text:String)
}

class MasterViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var labelMaster: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var containerViewController: ContainerViewController?
    

    // MARK: - LyfeCicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


// MARK: - @IBActions

extension MasterViewController {
    
    @IBAction func buttonContainer(sender: AnyObject) {
        guard let text = textField.text else { return }
        containerViewController?.changeLabel(text: text)
    }
}

// MARK: - ContainerViewControllerDelegate

extension MasterViewController: ContainerViewControllerDelegate {
    
    func changeLabel(text: String) {
        labelMaster.text = text
    }
}


// MARK: - Navigation

extension MasterViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "containerViewSegue" {
            containerViewController = segue.destination as? ContainerViewController
            containerViewController?.containerToMaster = self
        }
    }
}
