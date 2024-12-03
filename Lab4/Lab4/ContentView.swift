//
//  ContentView.swift
//  Lab4
//
//  Created by IPZ-31 on 02.12.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NewViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Завантаження новин...")
                } else if let errorMessage = viewModel.errorMessage {
                    VStack {
                        Text("Помилка: \(errorMessage)")
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Button("Спробувати знову") {
                            viewModel.fetchNews()
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                } else {
                    List(viewModel.articles) { article in
                        NewRow(article: article)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Новини")
            .onAppear {
                viewModel.fetchNews()
            }
        }
    }
}
struct NewsRow: View {
    let article: Article
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let imageUrl = article.urlToImage, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .frame(height: 200)
                            .background(Color.gray.opacity(0.3))
                        
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 200)
                            .clipped()
                        
                    case .failure:
                        Image(systemName: "exclamationmark.triangle.fill")
                            .foregroundColor(.red)
                            .frame(height: 200)
                            .background(Color.gray.opacity(0.3))
                        
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                // Якщо зображення не задано, можна показати дефолтне або пусте місце
                Image(systemName: "photo.fill")
                    .foregroundColor(.gray)
                    .frame(height: 200)
                    .background(Color.gray.opacity(0.3))
            }
            
            Text(article.title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Text(article.source.name)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 8)
    }
}
    
    #Preview {
        ContentView()
    }
    

