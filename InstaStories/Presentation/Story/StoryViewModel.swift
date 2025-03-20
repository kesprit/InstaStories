import Foundation

extension StoryView {
    @Observable
    final class ViewModel {
        private let initialUserStories: UserStories
        private let dismiss: () -> Void
        
        var username: String = ""
        var storyImageUrl: String = ""
        var userImageUrl: String = ""
        
        init(
            initialUserStories: UserStories,
            dismiss: @escaping () -> Void
        ) {
            self.initialUserStories = initialUserStories
            self.dismiss = dismiss
        }
        
        func onAppear() {
            self.username = initialUserStories.user.name
            self.userImageUrl = initialUserStories.user.profileImageURL
            self.storyImageUrl = initialUserStories.stories.first!.imageUrl
        }
        
        func closeButtonTapped() {
            dismiss()
        }
    }
}
