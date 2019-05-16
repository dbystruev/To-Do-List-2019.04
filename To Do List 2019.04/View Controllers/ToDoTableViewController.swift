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
    
    var todosMO = [ToDoMO]() {
        didSet {
            print(#line, #function, todosMO.count)
            DataManager.manager.saveContext()
        }
    }
}

// MARK: - Navigation
extension ToDoTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "EditSegue" else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let todo = todosMO[indexPath.row]
        let controller = segue.destination as! ToDoItemViewController
        
        controller.navigationItem.title = "Edit"
        controller.todo = ToDo(todo)
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard segue.identifier == "UnwindSegue" else { return }
        let todo = (segue.source as! ToDoItemViewController).todo
        let todoMO = ToDoMO(todo)
        
        if let selectedIndex = tableView.indexPathForSelectedRow {
            todosMO[selectedIndex.row] = todoMO
            tableView.reloadRows(at: [selectedIndex], with: .automatic)
        } else {
            let indexPath = IndexPath(row: todosMO.count, section: 0)
            todosMO.append(todoMO)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: - UITableViewDataSource
extension ToDoTableViewController /*: UITableViewDataSource */ {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell")!
        let todo = todosMO[indexPath.row]
        
        configurator.configure(cell, with: todo)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosMO.count
    }
}

// MARK: - UIViewController Methods
extension ToDoTableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todosMO = ToDoMO.loadData()

    }
}
