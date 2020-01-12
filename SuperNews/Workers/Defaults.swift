//
//  Defaults.swift
//  SuperNews
//
//  Created by Luis Zapata on 12-01-20.
//  Copyright © 2020 Luis Zapata. All rights reserved.
//

import Foundation

let defaults = Defaults()

class Defaults {
    private let def: UserDefaults;
    init() {
        def = UserDefaults.standard
    }
    
    func get(key: Constants.LocalKeys) -> Any? {
        return def.object(forKey: key.rawValue)
    }
    
    func getStringArray(key: Constants.LocalKeys) -> [String] {
        return def.stringArray(forKey: key.rawValue) ?? []
    }
    
    func set(key: Constants.LocalKeys, value: Any) -> Void {
        def.set(value, forKey: key.rawValue)
    }
    
    func stringArra(key: Constants.LocalKeys, value: [String]) -> Void {
        def.stringArray(forKey: key.rawValue)
    }
    
}
