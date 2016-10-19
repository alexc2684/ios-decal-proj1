//
//  AddTaskViewController.swift
//  Todo
//
//  Created by Alex Chan on 10/18/16.
//  Copyright © 2016 AChan Inc. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addDoneButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
        
    @IBAction func addTask(_ sender: UIButton) {
       // let tvc = self.nav.topViewController as! TaskTableViewController //reference to child (top view)
        taskhelper.addTask(taskField: self.textField.text!)
        print(taskhelper.itemsList.count)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //self.nav = segue.destination as! UINavigationController //reference to nav controller

    }
    

}
