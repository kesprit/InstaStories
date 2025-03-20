import Foundation

protocol UserStoriesUseCase {
    func getUserStories() -> [UserStories]
}

final class UserStoriesUseCaseImpl: UserStoriesUseCase {
    private let userRepository: UserRepository
    private let storyRepository: StoryRepository
    
    init(userRepository: UserRepository, storyRepository: StoryRepository) {
        self.userRepository = userRepository
        self.storyRepository = storyRepository
    }

    func getUserStories() -> [UserStories] {
        let users = userRepository.getUsers()
        let stories = storyRepository.getStories()
        
        return users.map { user in
            let stories = stories.filter {
                $0.userId == user.id
            }
            return UserStories(
                id: UUID().uuidString,
                user: user,
                stories: stories
            )
        }.filter { !$0.stories.isEmpty }
    }
}
