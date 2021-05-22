//
//  RealmPersistentInitializer.swift
//  GroceryStore
//
//  Created by 山本響 on 2021/05/22.
//

import Foundation
import RealmSwift

class RealmPersistent {
    static func initializer() -> Realm {
        do {
            let realm = try Realm()
            return realm
        } catch let err {
            fatalError("Failed to open Realm error\(err.localizedDescription)")
        }
    }
}
