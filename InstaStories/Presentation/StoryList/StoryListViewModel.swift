import Foundation

extension StoryListView {
    @Observable
    final class ViewModel {
        var stories: [UserStories] = []
        
        func onAppear() {
            refreshStories()
        }
        
        private func refreshStories() {
            stories = UserStories.makeMocks(count: 10)
        }
    }
}
