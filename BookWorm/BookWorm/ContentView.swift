//
//  ContentView.swift
//  BookWorm
//
//  Created by Filip Baumgart on 03/08/2021.
//

import SwiftUI

struct ContentView: View {
  
  @Environment(\.managedObjectContext) var moc
  @FetchRequest(entity: Book.entity(),
                sortDescriptors: [NSSortDescriptor(keyPath: \Book.title,
                                                   ascending: true),
                                  NSSortDescriptor(keyPath: \Book.author, ascending: true)])
  var books: FetchedResults<Book>
  
  @State private var showingAddScreen = false
  
  var body: some View {
    NavigationView {
      List {
        ForEach(books, id: \.self) { book in
          NavigationLink(destination: DetailView(book: book)) {
            EmojiRatingView(rating: book.rating)
              .font(.largeTitle)
            
            VStack(alignment: .leading) {
              Text(book.title ?? "Unknown Title")
                .font(.headline)
              Text(book.author ?? "Unknown Author")
                .foregroundColor(.secondary)
            }
          }
        }
      }
      .navigationBarTitle("Bookworm")
      .navigationBarItems(trailing: Button(action: {
        self.showingAddScreen.toggle()
      }) {
        Image(systemName: "plus")
      })
      .sheet(isPresented: $showingAddScreen) {
        AddBookView().environment(\.managedObjectContext, self.moc)
      }
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
  }
}
