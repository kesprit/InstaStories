import SwiftUI

@main
struct InstaStoriesApp: App {
    init() {
        DIConfig.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
