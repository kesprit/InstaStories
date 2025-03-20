import SwiftUI

struct StoryListView: View {
    @State private var viewModel: ViewModel
    
    init(userStoriesUseCase: UserStoriesUseCase) {
        self._viewModel = .init(
            wrappedValue: .init(
                userStoriesUseCase: userStoriesUseCase
            )
        )
    }

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
    StoryListView(userStoriesUseCase: DIContainer.shared.resolve(type: UserStoriesUseCase.self))
}
