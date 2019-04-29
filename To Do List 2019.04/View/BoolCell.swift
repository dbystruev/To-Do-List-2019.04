//
//  BoolCell.swift
//  To Do List 2019.04
//
//  Created by Denis Bystruev on 29/04/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class BoolCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var `switch`: UISwitch!
    
    weak var delegate: CellActionDelegate?
    var section: Int!
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        delegate?.cell(switchToggled: `switch`, forSection: section)
    }
}
