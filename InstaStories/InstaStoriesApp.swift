import SwiftUI

@main
struct InstaStoriesApp: App {
    init() {
        DIConfig.configure()
    }

    var body: some Scene {
        WindowGroup {
            StoryListView(userStoriesUseCase: DIContainer.shared.resolve(type: UserStoriesUseCase.self))
        }
    }
}
