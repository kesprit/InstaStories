import Foundation

final class DIConfig {
    static func configure(container: DIContainerProtocol = DIContainer.shared) {
        // Core
        configureCore(container: container)
        
        // Data Sources
        configureDataSources(container: container)
        
        // Repositories
        configureRepositories(container: container)
        
        // Use Cases
        configureUseCases(container: container)
    }
    
    // MARK: - Private configuration methods
    
    private static func configureCore(container: DIContainerProtocol) {

    }
    
    private static func configureDataSources(container: DIContainerProtocol) {
        let storyLocalDataSource = StoryLocalDataSourceImpl()
        container
            .register(
                type: StoryLocalDataSource.self,
                component: storyLocalDataSource
            )
        
        let userLocalDataSource = UserLocalDataSourceImpl()
        container
            .register(
                type: UserLocalDataSource.self,
                component: userLocalDataSource
            )
    }
    
    private static func configureRepositories(container: DIContainerProtocol) {
        let storyRepository = StoryRepositoryImpl(
            storyLocalDataSource: container.resolve(
                type: StoryLocalDataSource.self
            )
        )
        container
            .register(
                type: StoryRepository.self,
                component: storyRepository
            )
        
        let userRepository = UserRepositoryImpl(
            userLocalDataSource: container.resolve(
                type: UserLocalDataSource.self
            )
        )
        container
            .register(
                type: UserRepository.self,
                component: userRepository
            )
    }
    
    private static func configureUseCases(container: DIContainerProtocol) {
        let userStoriesUseCase = UserStoriesUseCaseImpl(
            userRepository: container.resolve(
                type: UserRepository.self
            ),
            storyRepository: container.resolve(
                type: StoryRepository.self
            )
        )
        container.register(type: UserStoriesUseCase.self, component: userStoriesUseCase)
    }
} 
