import Foundation

protocol DIContainerProtocol: Sendable {
    func register<T>(type: T.Type, component: Any)
    func resolve<T>(type: T.Type) -> T
}

final class DIContainer: DIContainerProtocol {
    static let shared = DIContainer()
    
    private init() {}
    
    private let lock = NSLock()
    private var components: [String: Any] = [:]
    
    func register<T>(type: T.Type, component: Any) {
        lock.lock()
        defer { lock.unlock() }
        
        let key = String(describing: type)
        components[key] = component
    }
    
    func resolve<T>(type: T.Type) -> T {
        lock.lock()
        defer { lock.unlock() }
        
        let key = String(describing: type)
        guard let component = components[key] as? T else {
            fatalError("No component registered for type: \(key)")
        }
        return component
    }
}
