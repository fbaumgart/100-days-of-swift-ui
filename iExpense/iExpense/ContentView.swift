//
//  ContentView.swift
//  iExpense
//
//  Created by Filip Baumgart on 23/05/2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var showingAddExpense = false
  @ObservedObject private var expenses = Expenses()
  
  var body: some View {
    NavigationView {
      List {
        ForEach(expenses.items) { item in
          HStack {
            VStack(alignment: .leading) {
              Text(item.name)
                .font(.headline)
              Text(item.type)
            }
            Spacer()
            Text("$\(item.amount)")
          }
        }
        .onDelete(perform: removeItems) 
      }
      .navigationBarTitle("iExpense")
      .navigationBarItems(trailing:
                            HStack {
                              Button(action: {
                                showingAddExpense = true
                              }) {
                                Text("Add")
                              }
                              .frame(width: 75, height: 40, alignment: .center)
                              .background(Color.orange)
                              .clipShape(Capsule())
                              .padding()
                              EditButton()
                                .frame(width: 75, height: 40, alignment: .center)
                                .background(Color.orange)
                                .clipShape(Capsule())
                            }
                            
      )
    }
    .sheet(isPresented: $showingAddExpense) {
      AddView(expenses: expenses)
    }
  }
  
  private func removeItems(at offsets: IndexSet) {
    expenses.items.remove(atOffsets: offsets)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
