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
    
    static func makeMocks(count: Int = 1) -> [User] {
        (1...count).map {
            makeMock(id: $0)
        }
    }
}
