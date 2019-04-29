//
//  ToDo.swift
//  To Do List 2019.04
//
//  Created by Denis Bystruev on 25/04/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

@objcMembers class ToDo: NSObject {
    // MARK: - Stored Properties
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    var image: UIImage?
    
    // MARK: - Initializeers
    init(
        title: String = String(),
        isComplete: Bool = Bool(),
        dueDate: Date = Date(),
        notes: String? = nil,
        image: UIImage? = nil
    ) {
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
        self.image = image
    }
    
    deinit {
        print(Date(), #line, #function, title)
    }
    
    // MARK: - Computed Properties
    var capitalizedKeys: [String] {
        return keys.map { $0.capitalizedWithSpaces }
    }
    
    var keys: [String] {
        return Mirror(reflecting: self).children.compactMap { $0.label }
    }
    
    var values: [Any?] {
        return Mirror(reflecting: self).children.map { $0.value }
    }
    
    // MARK: - Methods
    static func loadData() -> [ToDo]? {
        return loadSampleData()
    }
    
    static func loadSampleData() -> [ToDo] {
        return [
            ToDo(title: "Купить хлеб", isComplete: false, dueDate: Date(), notes: "В Пятёрочке"),
            ToDo(title: "Поздравить с 1 мая", isComplete: false, dueDate: Date()),
            ToDo(title: "Сдать проект", isComplete: false, dueDate: Date()),
        ]
    }
}

extension ToDo: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        let todo = ToDo()
        
        keys.forEach {
            let value = self.value(forKey: $0)
            todo.setValue(value, forKey: $0)
        }
        
        return todo
    }
}
