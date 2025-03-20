import SwiftUI

struct StoryAvatarView: View {
    let profileImageURL: String
    let username: String
    var body: some View {
        HStack {
            ZStack {
                AsyncImage(url: .init(string: profileImageURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                }
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [.red, .purple, .orange],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 3
                    )
            }
            .frame(width: 30, height: 30)
            .clipShape(Circle())
            Text(username)
                .foregroundStyle(.white)
                .bold()
                .font(.footnote)
        }
    }
}

#Preview {
    StoryAvatarView(
        profileImageURL: "https://i.pravatar.cc/300?u=12",
        username: "username"
    )
}
