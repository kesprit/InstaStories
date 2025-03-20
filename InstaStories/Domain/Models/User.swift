import Foundation

struct User: Identifiable, Equatable {
    let id: String
    let name: String
    let profileImageURL: String
}

extension User {
    static func makeMock(id: Int) -> User {
        .init(
            id: "\(id)",
            name: "User \(id)",
            profileImageURL: "https://i.pravatar.cc/300?u=\(id)"
        )
    }
    
    static var mocks: [User] = [
        .init(
            id: "1",
            name: "User 1",
            profileImageURL: "https://i.pravatar.cc/300?u=1"
        ),
        .init(
            id: "2",
            name: "User 2",
            profileImageURL: "https://i.pravatar.cc/300?u=2"
        ),        .init(
            id: "3",
            name: "User 3",
            profileImageURL: "https://i.pravatar.cc/300?u=3"
        ),
        .init(
            id: "4",
            name: "User 4",
            profileImageURL: "https://i.pravatar.cc/300?u=4"
        ),
        .init(
            id: "5",
            name: "User 5",
            profileImageURL: "https://i.pravatar.cc/300?u=5"
        ),
    ]
    
    static func makeMocks(count: Int = 1) -> [User] {
        (1...count).map {
            makeMock(id: $0)
        }
    }
}
