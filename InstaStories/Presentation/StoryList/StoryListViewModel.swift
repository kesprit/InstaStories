import Foundation

extension StoryListView {
    @Observable
    final class ViewModel {
        private let userStoriesUseCase: UserStoriesUseCase
        
        var stories: [UserStories] = []
        
        init(userStoriesUseCase: UserStoriesUseCase) {
            self.userStoriesUseCase = userStoriesUseCase
        }
        
        func onAppear() {
            refreshStories()
        }
        
        private func refreshStories() {
            stories = userStoriesUseCase.getUserStories()
        }
    }
}
