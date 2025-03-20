protocol UserRepository {
    func getUsers() -> [User]
}

final class UserRepositoryImpl: UserRepository {
    private let userLocalDataSource: UserLocalDataSource
    
    init(userLocalDataSource: UserLocalDataSource) {
        self.userLocalDataSource = userLocalDataSource
    }

    func getUsers() -> [User] {
        return userLocalDataSource.getUsers()
    }
}
