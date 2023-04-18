//
//  ContentView.swift
//  MyReadBooks
//
//  Created by Ваня Науменко on 14.04.23.
//

import SwiftUI

// MARK: - BookStruct
struct BookStruct: Codable {
    let success: Bool?
    let result: [Result]?
}

// MARK: - Result
struct Result: Codable {
    let url, indirim, fiyat, yayın: String?
    let yazar, title, image: String?
}

// Main ContentView for the app

    var body: some View {
        NavigationView {
            List(books) { book in
                NavigationLink(destination: BookDetailView(book: book)) {
                    Text(book.title)
                }
            }
            .navigationBarTitle("Books")
        }
        .onAppear {
            fetchBooks()
        }
    }
        
    //"https://api.example.com/books"
    func fetchBooks() {
        guard let url = URL(string: "https://www.goodreads.com/book/") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedBooks = try JSONDecoder().decode([Book].self, from: data)
                    DispatchQueue.main.async {
                        self.books = decodedBooks
                    }
                } catch {
                    print("Failed to decode books: \(error.localizedDescription)")
                }
            } else if let error = error {
                print("Failed to fetch books: \(error.localizedDescription)")
            }
        }.resume()
    }


// Book detail view

struct BookDetailView: View {
    let book: Book

    var body: some View {
        VStack {
            Text(book.title)
                .font(.title)
                .padding()
            List(book.chapters) { chapter in
                NavigationLink(destination: ChapterDetailView(chapter: chapter)) {
                    Text(chapter.title)
                }
            }
            .navigationBarTitle(book.title)
        }
    }
}

// Chapter detail view
//struct ChapterDetailView: View {
//    let chapter: Chapter
//
//    var body: some View {
//        VStack {
//            Text(chapter.title)
//                .font(.title)
//                .padding()
//            ScrollView {
//                VStack {
//                    ForEach(chapter.pages) { page in
//                        Text(page.content)
//                            .padding()
//                    }
//                }
//            }
//            .navigationBarTitle(chapter.title)
//        }
//    }
//}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
