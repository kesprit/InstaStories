protocol StoryLocalDataSource {
    func getStories() -> [Story]
}

final class StoryLocalDataSourceImpl: StoryLocalDataSource {
    private var stories: [Story] = Story.mocks(5)
    func getStories() -> [Story] {
        return stories
    }
}
