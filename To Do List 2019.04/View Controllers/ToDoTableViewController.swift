//
//  ToDoTableViewController.swift
//  To Do List 2019.04
//
//  Created by Denis Bystruev on 25/04/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    let configurator = Configurator()
    
    var todos = [ToDo]()
}

// MARK: - Navigation
extension ToDoTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "EditSegue" else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let todo = todos[indexPath.row]
        let controller = segue.destination as! ToDoItemViewController
        
        controller.todo = todo
    }
}

// MARK: - UITableViewDataSource
extension ToDoTableViewController /*: UITableViewDataSource */ {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell")!
        let todo = todos[indexPath.row]
        
        configurator.configure(cell, with: todo)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
}

// MARK: - UIViewController Methods
extension ToDoTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let todos = ToDo.loadData() {
            self.todos = todos
        } else {
            self.todos = ToDo.loadSampleData()
        }
    }
}
