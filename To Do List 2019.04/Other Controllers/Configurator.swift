//
//  Configurator.swift
//  To Do List 2019.04
//
//  Created by Denis Bystruev on 25/04/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class Configurator {
    func configure(_ cell: UITableViewCell, with todo: ToDo) {
        cell.detailTextLabel?.text = todo.dueDate.formatted
        cell.textLabel?.text = todo.title
        cell.imageView?.image = todo.image
    }

    func getConfiguredCell(in controller: ToDoItemViewController, forSection section: Int) -> UITableViewCell {
        let isEditing = controller.isEditing
        let value = controller.todo.values[section]
        
        if let value = value as? String {
            let cell = controller.tableView.dequeueReusableCell(withIdentifier: "StringCell")! as! StringCell
            
            cell.delegate = controller
            cell.section = section
            
            if isEditing {
                cell.label.isHidden = true
                cell.textField.isHidden = false
                cell.textField.text = value
            } else {
                cell.label.isHidden = false
                cell.label.text = value
                cell.textField.isHidden = true
            }
            
            return cell
        }
        
        return UITableViewCell()
    }
}
