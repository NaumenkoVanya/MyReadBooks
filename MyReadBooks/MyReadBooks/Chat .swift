////
////  Chat .swift
////  MyReadBooks
////
////  Created by Ваня Науменко on 14.04.23.
////
//
//import SwiftUI
//
//// Data model to represent a book
//struct Book: Identifiable, Codable {
//    let id: Int
//    let title: String
//    let chapters: [Chapter]
//}
//
//// Data model to represent a chapter
//struct Chapter: Identifiable, Codable {
//    let id: Int
//    let title: String
//    let pages: [Page]
//}
//
//// Data model to represent a page
//struct Page: Identifiable, Codable {
//    let id: Int
//    let content: String
//}
//
//// Main ContentView for the app
//struct ContentView: View {
//    @State private var books: [Book] = []
//
//    var body: some View {
//        NavigationView {
//            List(books) { book in
//                NavigationLink(destination: BookDetailView(book: book)) {
//                    Text(book.title)
//                }
//            }
//            .navigationBarTitle("Books")
//        }
//        .onAppear {
//            fetchBooks()
//        }
//    }
//
//    func fetchBooks() {
//        guard let url = URL(string: "https://api.example.com/books") else {
//            return
//        }
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let data = data {
//                do {
//                    let decodedBooks = try JSONDecoder().decode([Book].self, from: data)
//                    DispatchQueue.main.async {
//                        self.books = decodedBooks
//                    }
//                } catch {
//                    print("Failed to decode books: \(error.localizedDescription)")
//                }
//            } else if let error = error {
//                print("Failed to fetch books: \(error.localizedDescription)")
//            }
//        }.resume()
//    }
//}
//
//// Book detail view
//struct BookDetailView: View {
//    let book: Book
//
//    var body: some View {
//        VStack {
//            Text(book.title)
//                .font(.title)
//                .padding()
//            List(book.chapters) { chapter in
//                NavigationLink(destination: ChapterDetailView(chapter: chapter)) {
//                    Text(chapter.title)
//                }
//            }
//            .navigationBarTitle(book.title)
//        }
//    }
//}
//
//// Chapter detail view
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
//
//// Entry point for the app
//@main
//struct BookReaderApp: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}
