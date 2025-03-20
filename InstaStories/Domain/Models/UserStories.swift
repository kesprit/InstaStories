import Foundation

struct UserStories: Identifiable {
    let id: String
    let user: User
    let stories: [Story]
}
