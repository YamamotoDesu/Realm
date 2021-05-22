//
//  SwiftUIView.swift
//  GroceryStore
//
//  Created by 山本響 on 2021/05/22.
//

import SwiftUI

struct ShoppingItemListView: View {
    @EnvironmentObject var store: ShoppingStore
    @State private var shoppingFormPresented = false
    let items: [ShoppingItem]
    let boughtItems: [ShoppingItem]
    
    var body: some View {
        List {
            Section(header: Text("買い物かご")) {
                if items.isEmpty {
                    Text("🥬 商品を追加して下さい 🥬")
                }
                ForEach (items) { item in
                    ShoppingItemRow(shoppingItem:  item)
                }
                newItemButton
            }
            
            Section(header: Text("購入履歴")) {
                if boughtItems.isEmpty {
                    Text("🛒　購入した商品が表示されます　🛒")
                }
                ForEach(boughtItems) { item in
                    ShoppingItemRow(shoppingItem: item)
                }.onDelete { indexSet in
                    if let idx = indexSet.first {
                        store.delete(itemId: boughtItems[idx].id)
                    }
                }
            }
        }.listStyle(GroupedListStyle())
        .navigationTitle("🥑 楽10市場 🥑")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    var newItemButton: some View {
        Button(action: { shoppingFormPresented.toggle() }) {
            HStack {
                Image(systemName: "plus.circle.fill")
                
                Text("商品を追加")
                    .bold()
            }
        }.foregroundColor(.orange)
        .sheet(isPresented: $shoppingFormPresented) {
            ShoppingFormView(form: ShoppingForm()).environmentObject(store)
        }
    }
}

