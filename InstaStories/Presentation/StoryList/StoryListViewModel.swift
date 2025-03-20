import Foundation

extension StoryListView {
    @Observable
    final class ViewModel {
        private let userStoriesUseCase: UserStoriesUseCase
        
        var userStories: [UserStories] = []
        var selectedUserStories: UserStories?
        
        init(userStoriesUseCase: UserStoriesUseCase) {
            self.userStoriesUseCase = userStoriesUseCase
        }
        
        func onAppear() {
            refreshStories()
        }
        
        func storyButtonPushed(_ userStories: UserStories) {
            selectedUserStories = userStories
            print(userStories)
        }
        
        func dismissSelectedStory() {
            selectedUserStories = nil
            refreshStories()
        }
        
        private func refreshStories() {
            userStories = userStoriesUseCase.getUserStories()
        }
    }
}
