import SwiftUI

struct StoryView: View {
    @State private var story: Story = Story.mock
    @State private var user: User = User.makeMock(id: 1)
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            GeometryReader { proxy in
                AsyncImage(url: URL(string: story.imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray
                        .overlay {
                            ProgressView()
                        }
                }
                .frame(width: proxy.size.width)
                .ignoresSafeArea()
            }
            HStack {
                Button(action: {}) {
                    Color.clear
                }
                Button(action: {}) {
                    Color.clear
                }
            }
            VStack(alignment: .leading) {
                HStack {
                    ProgressView()
                        .progressViewStyle(.linear)
                        .tint(.white)
                    Spacer()
                    Button("Close", systemImage: "xmark.circle") {
                        // TODO: close view
                    }
                    .tint(.white)
                    .labelStyle(.iconOnly)
                }
                .padding(.horizontal)
                StoryAvatarView(profileImageURL: user.profileImageURL, username: user.name)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
            .background {
                LinearGradient(colors: [.black, .clear], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(edges: .top)
            }
        }
    }
}

#Preview {
    StoryView()
}
