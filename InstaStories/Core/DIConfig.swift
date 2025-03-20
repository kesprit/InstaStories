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

    }
    
    private static func configureRepositories(container: DIContainerProtocol) {

    }
    
    private static func configureUseCases(container: DIContainerProtocol) {
        let userStoriesUseCase = UserStoriesUseCaseImpl()
        container.register(type: UserStoriesUseCase.self, component: userStoriesUseCase)
    }
} 
