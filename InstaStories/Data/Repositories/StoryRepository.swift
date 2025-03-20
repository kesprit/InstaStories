protocol StoryRepository {
    func getStories() -> [Story]
}

final class StoryRepositoryImpl: StoryRepository {
    func getStories() -> [Story] {
        return Story.mocks(5)
    }
}
