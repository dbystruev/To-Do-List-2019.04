//
//  ToDoItemViewController.swift
//  To Do List 2019.04
//
//  Created by Denis Bystruev on 25/04/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ToDoItemViewController: UITableViewController {
    let configurator = Configurator()
    var todo = ToDo()
}

// MARK: - CellActionDelegate
extension ToDoItemViewController: CellActionDelegate {
    func cell(editingEnded textField: UITextField, forSection section: Int) {
        print(Date(), #line, #function, textField.text ?? "nil", section)
    }
    
    func cell(textChanged textField: UITextField, forSection section: Int) {
        print(Date(), #line, #function, textField.text ?? "nil", section)
    }
}

// MARK: - UITableViewDateSource
extension ToDoItemViewController /*: UITableViewDateSource */ {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return todo.keys.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let key = todo.capitalizedKeys[section]
        return key
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        
        let cell = configurator.getConfiguredCell(in: self, forSection: section)
        return cell
    }
}

// MARK: - UIViewController Methods
extension ToDoItemViewController {
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
    }
}
