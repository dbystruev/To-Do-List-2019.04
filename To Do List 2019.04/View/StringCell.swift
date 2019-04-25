//
//  StringCell.swift
//  To Do List 2019.04
//
//  Created by Denis Bystruev on 25/04/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class StringCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    weak var delegate: CellActionDelegate?
    var section: Int!
    
    @IBAction func editingEnded(_ sender: UITextField) {
        delegate?.cell(editingEnded: sender, forSection: section)
    }
    
    @IBAction func textChanged(_ sender: UITextField) {
        delegate?.cell(textChanged: sender, forSection: section)
    }
}
