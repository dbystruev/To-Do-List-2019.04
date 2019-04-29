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
    var isCancelled = false
    var todo = ToDo()
    var originalTodo: ToDo!
}

// MARK: - CellActionDelegate
extension ToDoItemViewController: CellActionDelegate {
    func cell(editingEnded textField: UITextField, forSection section: Int) {
        updateFromField(textField, forSection: section)
    }
    
    func cell(switchToggled switch: UISwitch, forSection section: Int) {
        if !isCancelled {
            let key = todo.keys[section]
            let isSet = `switch`.isOn
            todo.setValue(isSet, forKey: key)
        }
        isCancelled = false
    }
    
    func cell(textChanged textField: UITextField, forSection section: Int) {
        updateFromField(textField, forSection: section)
    }
}

// MARK: - Methods
extension ToDoItemViewController {
    @objc func cancelButtonTapped() {
        todo = originalTodo!.copy() as! ToDo
        isCancelled = true
        setEditing(false, animated: true)
    }
    
    @objc func saveButtonTapped() {
        performSegue(withIdentifier: "UnwindSegue", sender: nil)
    }
    
    func updateFromField(_ textField: UITextField, forSection section: Int) {
        if !isCancelled {
            let key = todo.keys[section]
            let text = textField.text ?? ""
            todo.setValue(text, forKey: key)
        }
        isCancelled = false
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
        
        let cell = configurator.getCell(in: self, forSection: section)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ToDoItemViewController /*: UITableViewDelegate */ {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !isEditing {
            setEditing(true, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

// MARK: - UIViewController Methods
extension ToDoItemViewController {
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        } else {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
        }
        
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalTodo = todo.copy() as? ToDo
        navigationItem.rightBarButtonItem = editButtonItem
    }
}
