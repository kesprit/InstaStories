import SwiftUI

struct StoryListView: View {
    @State private var stories: [UserStories] = UserStories.makeMocks(count: 10)
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(stories) { story in
                        StoryListCellView(
                            title: story.user.name,
                            imageUrl: story.user.profileImageURL,
                            isViewed: false
                        )
                    }
                }
                .offset(x: 10)
            }
            .frame(height: 100)
            .scrollIndicators(.hidden)
            Spacer()
        }
    }
}

#Preview {
    StoryListView()
}
