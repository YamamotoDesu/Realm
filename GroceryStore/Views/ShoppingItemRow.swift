//
//  ShoppingItemRow.swift
//  GroceryStore
//
//  Created by 山本響 on 2021/05/22.
//

import SwiftUI

struct ShoppingItemRow: View {
    @EnvironmentObject var store: ShoppingStore
    @State private var shoppingFormPresented = false
    var shoppingItem: ShoppingItem
    
    
    var body: some View {
        HStack {
            Button(action: openUpdate) {
                Text("\(shoppingItem.quantity)")
                    .bold()
                    .padding(.horizontal, 4)
                
                VStack(alignment: .leading) {
                    Text(shoppingItem.title)
                        .font(.headline)
                    
                    Text(shoppingItem.notes)
                        .font(.subheadline)
                        .lineLimit(1)
                }
            }.buttonStyle(PlainButtonStyle()).sheet(isPresented: $shoppingFormPresented) {
                ShoppingFormView(form: ShoppingForm(self.shoppingItem))
                    .environmentObject(self.store)
            }
            Spacer()
            Button(action: buyItem) {
                HStack {
                    Text(shoppingItem.bought ? "購入済み" : "購入する").foregroundColor(Color.black)
                    Circle().fill(shoppingItem.bought ? Color.orange : Color.blue).frame(width: 20, height: 20)
                }
            }
        }
    }
}

//Mark:= Action

extension ShoppingItemRow {
    func openUpdate() {
        if !shoppingItem.bought {
            shoppingFormPresented.toggle()
        }
    }
    
    func buyItem() {
        withAnimation{
            if !shoppingItem.bought {
                store.updateBuy(shoppingItem: shoppingItem)
            }
        }
    }
}

