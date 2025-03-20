protocol UserRepository {
    func getUsers() -> [User]
}

final class UserRepositoryImpl: UserRepository {
    func getUsers() -> [User] {
        return User.makeMocks(count: 5)
    }
}
