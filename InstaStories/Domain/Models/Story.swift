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
    
    static func mocks(_ count: Int = 1) -> [Story] {
        (1...count).map {
            .init(id: "\($0)", userId: "\($0)", imageUrl: "https://picsum.photos/id/\($0)/1080/1920")
        }
    }
}
