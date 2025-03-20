import SwiftUI

struct StoryListCellView: View {
    let title: String
    let imageUrl: String
    let isViewed: Bool

    var body: some View {
        VStack {
            ZStack {
                AsyncImage(url: .init(string: imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: isViewed ? [.gray] : [.red, .purple, .orange],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 6
                    )
            }
            .frame(width: 70, height: 70)
            .clipShape(Circle())
            Text(title)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .shadow(radius: 1)
    }
}

#Preview {
    StoryListCellView(title: "Morpheus", imageUrl: "https://i.pravatar.cc/300?u=21", isViewed: false)
}
