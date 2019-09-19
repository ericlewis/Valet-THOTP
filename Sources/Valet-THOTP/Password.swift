import Foundation
import THOTP

public struct Password: PasswordProtocol {
    public var name: String
    public var issuer: String?
    public var image: URL?
    public var generator: GeneratorProtocol
    
    public init(name: String, issuer: String?, image: URL?, generator: GeneratorProtocol) {
        self.name = name
        self.issuer = issuer
        self.image = image
        self.generator = generator
    }
}

extension Password: Identifiable {
    public var id: String {
        name + (issuer ?? generator.secret.base64EncodedString())
    }
}
