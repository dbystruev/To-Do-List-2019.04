//
//  Configurator.swift
//  To Do List 2019.04
//
//  Created by Denis Bystruev on 25/04/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class Configurator {
    func configure(_ cell: UITableViewCell, with todo: ToDoMO) {
        cell.detailTextLabel?.text = todo.dueDate?.formatted
        cell.textLabel?.text = todo.title
        if let imageData = todo.image {
            cell.imageView?.image = UIImage(data: imageData)
        }
    }

    func getCell(in controller: ToDoItemViewController, forSection section: Int) -> UITableViewCell {
        let value = controller.todo.values[section]
        
        if let value = value as? String {
            return getCell(with: value, in: controller, forSection: section)
        } else if let value = value as? Bool {
            return getCell(with: value, in: controller, forSection: section)
        } else {
            return UITableViewCell()
        }
    }
    
    func getCell(with value: String, in controller: ToDoItemViewController, forSection section: Int) -> UITableViewCell {
        let cell = controller.tableView.dequeueReusableCell(withIdentifier: "StringCell")! as! StringCell
        
        cell.delegate = controller
        cell.section = section
        
        if controller.isEditing {
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
    
    func getCell(with value: Bool, in controller: ToDoItemViewController, forSection section: Int) -> UITableViewCell {
        let cell = controller.tableView.dequeueReusableCell(withIdentifier: "BoolCell")! as! BoolCell
        
        cell.delegate = controller
        cell.section = section
        
        if controller.isEditing {
            cell.label.isHidden = true
            cell.`switch`.isHidden = false
            cell.`switch`.isOn = value
        } else {
            cell.label.isHidden = false
            cell.label.text = value ? "On" : "Off"
            cell.`switch`.isHidden = true
        }
        
        return cell
    }
}
