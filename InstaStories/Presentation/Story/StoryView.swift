import SwiftUI

struct StoryView: View {
    let story: Story
    let user: User
    let dismiss: () -> Void
    
    init(userStories: UserStories, dismiss: @escaping () -> Void) {
        self.user = userStories.user
        self.story = userStories.stories.first!
        self.dismiss = dismiss
    }
    
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
                        dismiss()
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
    StoryView(userStories: UserStories.makeMocks(count: 1).first!, dismiss: {})
}
