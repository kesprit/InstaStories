import SwiftUI

struct StoryListView: View {
    @State private var viewModel: ViewModel = .init()

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.stories) { story in
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
        .onAppear(perform: viewModel.onAppear)
    }
}

#Preview {
    StoryListView()
}
