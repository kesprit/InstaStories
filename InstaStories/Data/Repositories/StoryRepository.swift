protocol StoryRepository {
    func getStories() -> [Story]
}

final class StoryRepositoryImpl: StoryRepository {
    private let storyLocalDataSource: StoryLocalDataSource
    
    init(storyLocalDataSource: StoryLocalDataSource) {
        self.storyLocalDataSource = storyLocalDataSource
    }

    func getStories() -> [Story] {
        return storyLocalDataSource.getStories()
    }
}
