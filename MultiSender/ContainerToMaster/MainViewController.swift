//
//  ViewController.swift
//  ContainerToMaster
//
//  Created by Developer on 10/4/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

protocol MainViewControllerDelegate {
    func changeLabel(text:String)
}

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var labelMaster: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var movefileViewController: MoveFileViewController?
    

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

extension MainViewController {
    
    @IBAction func buttonContainer(sender: AnyObject) {
        guard let text = textField.text else { return }
        movefileViewController?.changeLabel(text: text)
    }
}

// MARK: - ContainerViewControllerDelegate

extension MainViewController: MoveFileViewControllerDelegate {
    
    func changeLabel(text: String) {
        labelMaster.text = text
    }
}


// MARK: - Navigation

extension MainViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "containerViewSegue" {
            movefileViewController = segue.destination.childViewControllers[0] as? MoveFileViewController
            movefileViewController?.containerToMaster = self
        }
    }
}
