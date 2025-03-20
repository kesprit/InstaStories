protocol UserStoriesUseCase {
    func getUserStories() -> [UserStories]
}

final class UserStoriesUseCaseImpl: UserStoriesUseCase {
    func getUserStories() -> [UserStories] {
        return UserStories.makeMocks(count: 10)
    }
}
