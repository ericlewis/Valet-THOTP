import Foundation
import Valet

public extension Valet {
    func all() -> [Password] {
        allKeys().compactMap {
            password(forKey: $0)
        }
    }
    
    func password(forKey key: String) -> Password? {
        guard let urlString = string(forKey: key), let url = URL(string: urlString) else {
            return nil
        }
        
        return try? Password(url: url)
    }
    
    func set(password: Password) throws {
        set(string: password.absoluteURL.absoluteString,
            forKey: password.id)
    }
    
    func remove<O>(object: O) where O: Identifiable, O.ID == String {
        removeObject(forKey: object.id)
    }
}
