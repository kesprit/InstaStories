import Foundation

struct UserStories: Identifiable {
    let id: String
    let user: User
    let stories: [Story]
}

extension UserStories {
    static func makeMocks(count: Int = 1) -> [UserStories] {
        (1...count).map {
            .init(
                id: "\($0)",
                user: User.makeMock(id: $0),
                stories: Story.mocks(4)
            )
        }
    }
}
