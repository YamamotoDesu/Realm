//
//  ContentView.swift
//  GroceryStore
//
//  Created by 山本響 on 2021/05/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var store: ShoppingStore
    
    var body: some View {
        NavigationView {
            ShoppingItemListView(items: store.items, boughtItems: store.boughtItems).environmentObject(store)
        }
    }
}
