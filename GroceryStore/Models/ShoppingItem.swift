//
//  ShoppingItem.swift
//  GroceryStore
//
//  Created by 山本響 on 2021/05/22.
//

import Foundation

struct ShoppingItem: Identifiable {
    let id: Int
    let title: String
    let notes: String
    let quantity: Int
    let bought: Bool
}

// Mark: = init
extension ShoppingItem {
    init(shoppingItemDB: ShoppingItemDB) {
        id = shoppingItemDB.id
        title = shoppingItemDB.title
        notes = shoppingItemDB.notes
        quantity = shoppingItemDB.quantity
        bought = shoppingItemDB.bought
    }
}
