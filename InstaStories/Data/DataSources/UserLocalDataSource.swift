protocol UserLocalDataSource {
    func getUsers() -> [User]
}

final class UserLocalDataSourceImpl: UserLocalDataSource {
    private var users: [User] = User.mocks
    func getUsers() -> [User] {
        return users
    }
}
