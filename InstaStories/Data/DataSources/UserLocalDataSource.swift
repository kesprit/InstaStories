protocol UserLocalDataSource {
    func getUsers() -> [User]
}

final class UserLocalDataSourceImpl: UserLocalDataSource {
    private var users: [User] = User.makeMocks(count: 5)
    func getUsers() -> [User] {
        return users
    }
}
