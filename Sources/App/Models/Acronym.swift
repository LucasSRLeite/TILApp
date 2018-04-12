import Vapor
import FluentPostgreSQL

final class Acronym: Codable {
    var id: Int?
    var short: String
    var long: String
    var userID: User.ID
    
    var user: Parent<Acronym, User> {
        return parent(\.userID)
    }
    
    var categories: Siblings<Acronym, Category, AcronymCategoryPivot> {
        return siblings()
    }
    
    init(short: String, long: String, userID: User.ID) {
        self.short = short
        self.long = long
        self.userID = userID
    }
}

// Conformidade com database com ID:Int?
extension Acronym: PostgreSQLModel {}

// Conformidade com Migration para criação da tabela no database
extension Acronym: Migration {
    static func prepare(on connection: PostgreSQLConnection) -> Future<Void> {
        return Database.create(self, on: connection) { builder in
            try addProperties(to: builder)
            try builder.addReference(from: \.userID, to: \User.id)
        }
    }
}

// Conformidade com Content para permitir conversão dos dados JSON <-> Model com .encode() e .decode()
extension Acronym: Content {}

// Conformidade com Parameter para usar Acronym.parameter (ID)
extension Acronym: Parameter {}
