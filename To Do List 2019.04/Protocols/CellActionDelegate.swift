//
//  CellActionDelegate.swift
//  To Do List 2019.04
//
//  Created by Denis Bystruev on 25/04/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

protocol CellActionDelegate: class {
    func cell(editingEnded textField: UITextField, forSection section: Int)
    func cell(textChanged textField: UITextField, forSection section: Int)
}
