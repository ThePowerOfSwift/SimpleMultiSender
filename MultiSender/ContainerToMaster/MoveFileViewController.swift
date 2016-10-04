//
//  ContainerViewController.swift
//  ContainerToMaster
//
//  Created by Developer on 10/4/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

protocol MoveFileViewControllerDelegate {
    func changeLabel(text:String)
}

class MoveFileViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var labelContainer: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var containerToMaster: MoveFileViewControllerDelegate?
    var arraayOfStrings = [String]()
    

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

extension MoveFileViewController {
    
    @IBAction func buttonMaster(sender: AnyObject) {
        guard let text = textField.text else { return }
        containerToMaster?.changeLabel(text: text)
    }
}


// MARK: - MasterViewControllerDelegate

extension MoveFileViewController: MainViewControllerDelegate {
    
    func changeLabel(text: String) {
        labelContainer.text = text
        arraayOfStrings.insert(text, at: 0)
        self.tableView.reloadData()
    }
}


extension MoveFileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraayOfStrings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = arraayOfStrings[indexPath.row]
        
        return cell
    }
}




















