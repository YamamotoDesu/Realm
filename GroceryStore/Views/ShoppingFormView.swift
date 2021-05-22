//
//  ShoppingFormView.swift
//  GroceryStore
//
//  Created by 山本響 on 2021/05/22.
//

import SwiftUI

struct ShoppingFormView: View {
    
    @EnvironmentObject var store: ShoppingStore
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var form: ShoppingForm
    let quantityOptions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("商品名", text: $form.title)
                
                Picker(selection: $form.quantity, label: Text("個数")) {
                    ForEach(quantityOptions, id: \.self) { option in
                        Text("\(option)").tag(option)
                    }
                }
                
                Section(header: Text("メモ 📒")) {
                    TextField("", text: $form.notes)
                }
            }
            .navigationTitle("🥑 詳細を入力 🥑")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("閉じる", action: dismiss)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(form.updating ? "更新" : "かごに追加", action: save)
                }
            }

        }
    }
}

// MARK:= Actions

extension ShoppingFormView {
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func save() {
        if form.updating, let id = form.shoppingItemId {
            store.updateItem(itemId: id, title: form.title, notes: form.notes, quantity: form.quantity, bought: form.bought)
        } else {
            store.create(title: form.title, notes: form.notes, quantity: form.quantity)
        }
        
        dismiss()
    }
}
