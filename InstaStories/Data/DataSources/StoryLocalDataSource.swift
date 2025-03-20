protocol StoryLocalDataSource {
    func getStories() -> [Story]
}

final class StoryLocalDataSourceImpl: StoryLocalDataSource {
    private var stories: [Story] = Story.mocks
    func getStories() -> [Story] {
        return stories
    }
}
