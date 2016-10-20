//
//  TaskTableViewController.swift
//  Todo
//
//  Created by Alex Chan on 10/18/16.
//  Copyright © 2016 AChan Inc. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //load tasks
        //self.itemsList.append(Task(taskName: "hello"))
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        for (index, item) in taskhelper.itemsList.enumerated() {
            let current = CFAbsoluteTimeGetCurrent()
            let timePassed = current - item.time
            if Int(timePassed) > 24*60*60 {
                taskhelper.itemsList.remove(at: index)
            }
        }
        return taskhelper.itemsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "test")
        let task = taskhelper.itemsList[(indexPath as NSIndexPath).row]
        print(task.done)
        if task.done {
            let doneTask: NSMutableAttributedString =  NSMutableAttributedString(string: task.taskString)
            doneTask.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, doneTask.length))
            cell.textLabel?.attributedText = doneTask
            print("In here")
        } else {
            cell.textLabel?.text = task.taskString
        }
        return cell
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let curr = taskhelper.itemsList[indexPath.row]
        curr.done = !curr.done
        if curr.done {
            curr.time = CFAbsoluteTimeGetCurrent()
        }
        taskhelper.itemsList[indexPath.row] = curr
        self.tableView.reloadData()
        return indexPath
    }
    



    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
