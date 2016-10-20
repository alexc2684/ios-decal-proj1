//
//  Task.swift
//  Todo
//
//  Created by Alex Chan on 10/19/16.
//  Copyright © 2016 AChan Inc. All rights reserved.
//

import UIKit

var taskhelper: TaskHelper = TaskHelper()

class Task: NSObject {
    
    var taskString: String! = " "
    var done: Bool = false
    var time: CFAbsoluteTime!
    
    init(taskString: String) {
        self.taskString = taskString
        self.time = CFAbsoluteTimeGetCurrent()
    }
    

}

class TaskHelper: NSObject {
    
    var itemsList = [Task]()

    func addTask(taskField: String) {
        self.itemsList.append(Task(taskString: taskField))
    }
    
    func numComplete() -> Int {
       var count = 0
        for item in itemsList {
            if item.done {
                count += 1
            }
        }
        return count
    }
}
