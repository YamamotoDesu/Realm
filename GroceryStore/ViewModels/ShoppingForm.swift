//
//  ShoppingForm.swift
//  GroceryStore
//
//  Created by 山本響 on 2021/05/22.
//

import Foundation

class ShoppingForm: ObservableObject {
    @Published var title = ""
    @Published var notes = ""
    @Published var quantity = 1
    @Published var bought = false
    
    var shoppingItemId: Int?
    
    var updating: Bool {
        shoppingItemId != nil
    }
    
    init() {}
    
    init(_ shoppingItem: ShoppingItem) {
        shoppingItemId = shoppingItem.id
        title = shoppingItem.title
        notes = shoppingItem.notes
        quantity = shoppingItem.quantity
    }
}
