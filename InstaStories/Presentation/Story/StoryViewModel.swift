import Foundation

extension StoryView {
    @Observable
    final class ViewModel {
        private let userStoriesUseCase: UserStoriesUseCase
        private let initialUserStories: UserStories
        private let dismiss: () -> Void
        private var timer: Timer?
        private var currentUserStoriesIndex = 0
        private var currentStoryIndex = 0
        private var userStories: [UserStories] = []
        private var currentUserStories: UserStories?
        private var currentStory: Story?
        
        var username: String = ""
        var storyImageUrl: String = ""
        var userImageUrl: String = ""
        var currentTime: TimeInterval = 0
        
        init(
            initialUserStories: UserStories,
            userStoriesUseCase: UserStoriesUseCase,
            dismiss: @escaping () -> Void
        ) {
            self.initialUserStories = initialUserStories
            self.userStoriesUseCase = userStoriesUseCase
            self.dismiss = dismiss
            self.userStories = userStoriesUseCase.getUserStories()
        }
        
        func onAppear() {
            guard
                let currentUserStoriesIndex = userStories.firstIndex(where: { $0.user.id == initialUserStories.user.id }),
                !userStories.isEmpty
            else {
                fatalError("User Stories not found")
            }
            currentUserStories = userStories[currentUserStoriesIndex]
            updateStory()
            startTimer()
        }
        
        func closeButtonTapped() {
            stopTimer()
            dismiss()
        }
        
        func nextButtonTapped() {
            nextStory()
        }
        
        func previousButtonTapped() {
            previousStory()
        }
        
        private func updateStory() {
            DispatchQueue.main.async {
                self.username = self.currentUserStories?.user.name ?? ""
                self.userImageUrl = self.currentUserStories?.user.profileImageURL ?? ""
                self.storyImageUrl = self.currentUserStories?.stories.first!.imageUrl ?? ""
            }
        }
        
        // MARK: Timer's methods
        private func startTimer() {
            stopTimer()
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] _ in
                guard let self = self else { return }
                if self.currentTime >= 9.99 {
                    self.resetTimer()
                    self.nextStory()
                    return
                }
                self.currentTime += 0.01
            })
        }
        
        private func resetTimer() {
            stopTimer()
            startTimer()
        }
        
        private func stopTimer() {
            timer?.invalidate()
            timer = nil
            currentTime = 0
        }
        
        // MARK: Story managment
        private func nextStory() {
            guard
                let currentUserStories,
                currentUserStories.stories.indices.contains(currentStoryIndex + 1)
            else {
                nextUserStories()
                return
            }
            currentStoryIndex += 1
            currentStory = currentUserStories.stories[currentStoryIndex]
            updateStory()
        }
        
        private func previousStory() {
            guard
                let currentUserStories,
                currentUserStories.stories.indices.contains(currentStoryIndex - 1)
            else {
                previousUserStories()
                return
            }
            currentStoryIndex -= 1
            currentStory = currentUserStories.stories[currentStoryIndex]
            updateStory()
        }
        
        private func nextUserStories() {
            currentStoryIndex = 0
            guard
                userStories.indices.contains(currentUserStoriesIndex + 1)
            else {
                dismiss()
                return
            }
            
            currentUserStoriesIndex += 1
            currentUserStories = userStories[currentUserStoriesIndex]
            guard let currentUserStories else {
                dismiss()
                return
            }
            currentStory = currentUserStories.stories[currentStoryIndex]
            updateStory()
        }
        
        private func previousUserStories() {
            currentStoryIndex = 0
            guard
                userStories.indices.contains(currentUserStoriesIndex - 1)
            else {
                dismiss()
                return
            }
            
            currentUserStoriesIndex -= 1
            currentUserStories = userStories[currentUserStoriesIndex]
            guard let currentUserStories else {
                dismiss()
                return
            }
            currentStory = currentUserStories.stories[currentStoryIndex]
            updateStory()
        }
    }
}
