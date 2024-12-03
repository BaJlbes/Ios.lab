import SwiftUI

/// Структура для відображення статті новин
struct NewRow: View {
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

