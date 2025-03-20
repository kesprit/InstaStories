import Foundation

struct Story: Identifiable, Equatable {
    let id: String
    let userId: String
    let imageUrl: String
}

extension Story {
    static let mock: Story = .init(
        id: "1",
        userId: "1",
        imageUrl: "https://picsum.photos/id/1015/200/300"
    )
    
    static let mocks: [Story] = [
        .init(
            id: "1",
            userId: "1",
            imageUrl: "https://picsum.photos/id/1/1080/1920"
        ),
        .init(
            id: "2",
            userId: "1",
            imageUrl: "https://picsum.photos/id/101/1080/1920"
        ),
        .init(
            id: "3",
            userId: "1",
            imageUrl: "https://picsum.photos/id/115/1080/1920"
        ),
        .init(
            id: "4",
            userId: "2",
            imageUrl: "https://picsum.photos/id/15/1080/1920"
        ),
        .init(
            id: "5",
            userId: "2",
            imageUrl: "https://picsum.photos/id/5/1080/1920"
        ),
        .init(
            id: "6",
            userId: "3",
            imageUrl: "https://picsum.photos/id/105/1080/1920"
        ),
        .init(
            id: "7",
            userId: "4",
            imageUrl: "https://picsum.photos/id/88/1080/1920"
        ),
    ]
    
    static func mocks(_ count: Int = 1) -> [Story] {
        (1...count).map {
            .init(id: "\($0)", userId: "\($0)", imageUrl: "https://picsum.photos/id/\($0)/1080/1920")
        }
    }
}
