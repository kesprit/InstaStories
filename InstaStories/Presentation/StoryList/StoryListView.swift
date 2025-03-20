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
        ZStack {
            VStack {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.userStories) { userStory in
                            Button {
                                viewModel.storyButtonPushed(userStory)
                            } label: {
                                StoryListCellView(
                                    title: userStory.user.name,
                                    imageUrl: userStory.user.profileImageURL,
                                    isViewed: false
                                )
                            }
                        }
                    }
                    .offset(x: 10)
                }
                .frame(height: 100)
                .scrollIndicators(.hidden)
                Spacer()
            }
            if let selectedUserStories = viewModel.selectedUserStories {
                StoryView(
                    userStories: selectedUserStories,
                    dismiss: viewModel.dismissSelectedStory
                )
                .frame(maxHeight: .infinity)
            }
        }
        .onAppear(perform: viewModel.onAppear)
        .animation(.default, value: viewModel.selectedUserStories)
    }
}

#Preview {
    StoryListView(userStoriesUseCase: DIContainer.shared.resolve(type: UserStoriesUseCase.self))
}
